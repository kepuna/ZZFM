//
//  DNNetworkManager.m
//  DoNewsNetworking
//
//  Created by Ming on 2018/9/11.
//  Copyright © 2018 DoNews. All rights reserved.
//

#import "DNNetworkManager.h"
#import "AFNetworking.h"
#import "AFNetworkActivityIndicatorManager.h"
#import "DNNetworkMacro.h"
#import "DNNetworkPrivate.h"
#import "DNNetworkManager+SSL.h"
#import "DNNetworkPrivate.h"
#import "DNNetworkCache.h"

//#if __has_include( <DNCrashReport/DNCrashReport.h>)
//#import <DNCrashReport/DNCrashReport.h>
//#else
//#import "DNReportManager.h"
//#endif

#ifdef DEBUG
#define DNLog(...) printf("[%s] %s [第%d行]: %s\n", __TIME__ ,__PRETTY_FUNCTION__ ,__LINE__, [[NSString stringWithFormat:__VA_ARGS__] UTF8String])
#else
#define DNLog(...)
#endif

#define NSStringFormat(format,...) [NSString stringWithFormat:format,##__VA_ARGS__]

@implementation DNNetworkManager
static BOOL _isOpenLog;   // 是否已开启日志打印
static NSMutableArray *_allSessionTask;

#pragma mark - Override
/**
 *  所有的HTTP请求共享一个AFHTTPSessionManager
 */
+ (void)load {
    _sessionManager =  [[AFHTTPSessionManager manager] init];
    
    
    // 设置请求的超时时间
    _sessionManager.requestSerializer.timeoutInterval = 15.f;
    // 设置服务器返回结果的类型:JSON (AFJSONResponseSerializer,AFHTTPResponseSerializer)
    _sessionManager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    _sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html", @"text/json", @"text/plain", @"text/javascript", @"text/xml", @"image/*", nil];
    // 打开状态栏的等待菊花
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    
    _sessionManager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
    
//    //基于公钥设置客服端安全策略 ssl
//    _sessionManager.securityPolicy = [self customSecurityPolicy];
//
//    //客服端利用p12验证服务器
//    [self checkCredential:_sessionManager];
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
}

#pragma mark - Public
#pragma mark - 网络状态
/**
 有网YES, 无网:NO
 */
+ (BOOL)isNetwork
{
    return [AFNetworkReachabilityManager sharedManager].reachable;
}

/**
 手机网络:YES, 反之:NO
 */
+ (BOOL)isWWANNetwork
{
    return [AFNetworkReachabilityManager sharedManager].reachableViaWWAN;
}

/**
 WiFi网络:YES, 反之:NO
 */
+ (BOOL)isWiFiNetwork
{
    return [AFNetworkReachabilityManager sharedManager].reachableViaWiFi;
}

/**
 取消所有HTTP请求
 */
+ (void)cancelAllRequest
{
    // 锁操作
    @synchronized(self) {
        [[[self class] allSessionTask] enumerateObjectsUsingBlock:^(NSURLSessionTask  *_Nonnull task, NSUInteger idx, BOOL * _Nonnull stop) {
            [task cancel];
        }];
        [[[self class] allSessionTask] removeAllObjects];
    }
    
}

/**
 实时获取网络状态,通过Block回调实时获取(此方法可多次调用)
 */
+ (void)networkStatusWithBlock:(DNNetworkStatus)networkStatus
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
            
//            NSDictionary * Dic =   @{FirstComeReachabilityStatus:[NSString stringWithFormat:@"%ld",(long)status]};
//
//            [[NSNotificationCenter defaultCenter] postNotificationName:FirstComeReachabilityStatus object:nil userInfo:Dic];
            
            switch (status) {
                    case AFNetworkReachabilityStatusUnknown:
                    
                    networkStatus ? networkStatus(DNNetworkStatusUnknown) : nil;
                    if (_isOpenLog) DNLog(@"未知网络");
                    break;
                    case AFNetworkReachabilityStatusNotReachable:
                    networkStatus ? networkStatus(DNNetworkStatusNotReachable) : nil;
                    if (_isOpenLog) DNLog(@"无网络");
                    break;
                    case AFNetworkReachabilityStatusReachableViaWWAN:
                    networkStatus ? networkStatus(DNNetworkStatusReachableViaWWAN) : nil;
                    if (_isOpenLog) DNLog(@"手机自带网络");
                    break;
                    case AFNetworkReachabilityStatusReachableViaWiFi:
                    networkStatus ? networkStatus(DNNetworkStatusReachableViaWiFi) : nil;
                    if (_isOpenLog) DNLog(@"WIFI");
                    break;
            }
        }];
    });
}

/**
 取消指定URL的HTTP请求
 */
+ (void)cancelRequestWithURL:(NSString *)URL
{
    if (!URL)  return;
    @synchronized (self) {
        [[[self class] allSessionTask] enumerateObjectsUsingBlock:^(NSURLSessionTask  *_Nonnull task, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([task.currentRequest.URL.absoluteString hasPrefix:URL]) {
                [task cancel];
                [[[self class] allSessionTask] removeObject:task];
                *stop = YES;
            }
        }];
    }
}

#pragma mark - 设置
/**
 开启日志打印 (Debug级别)
 */
+ (void)openLog
{
    _isOpenLog = YES;
}

/**
 关闭日志打印,默认关闭
 */
+ (void)closeLog
{
    _isOpenLog = NO;
}

/**
 在开发中,如果以下的设置方式不满足项目的需求,就调用此方法获取AFHTTPSessionManager实例进行自定义设置
 */
+ (void)setAFHTTPSessionManagerProperty:(void(^)(AFHTTPSessionManager *sessionManager))sessionManager
{
    sessionManager ? sessionManager(_sessionManager) : nil;
}

/**
 设置网络请求参数的格式:默认为二进制格式
 */
+ (void)setRequestSerializer:(DNRequestSerializer)requestSerializer
{
    _sessionManager.requestSerializer = requestSerializer == DNRequestSerializerHTTP ? [AFHTTPRequestSerializer serializer] : [AFJSONRequestSerializer serializer];
}

/**
 设置服务器响应数据格式:默认为JSON格式
 */
+ (void)setResponseSerializer:(DNResponseSerializer)responseSerializer
{
    _sessionManager.responseSerializer = responseSerializer == DNResponseSerializerHTTP ? [AFHTTPResponseSerializer serializer] : [AFJSONResponseSerializer serializer];
}

/**
 设置请求超时时间:默认为30S
 */
+ (void)setRequestTimeoutInterval:(NSTimeInterval)time
{
    _sessionManager.requestSerializer.timeoutInterval = time;
}

/**
 设置请求头
 */
+ (void)setValue:(NSString *)value forHTTPHeaderField:(NSString *)field
{
    [_sessionManager.requestSerializer setValue:value forHTTPHeaderField:field];
}

/**
 是否打开网络状态转圈菊花:默认打开
 */
+ (void)openNetworkActivityIndicator:(BOOL)open
{
    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:open];
}

/**
 配置自建证书的Https请求, 参考链接: http://blog.csdn.net/syg90178aw/article/details/52839103
 */
+ (void)setSecurityPolicyWithCerPath:(NSString *)cerPath validatesDomainName:(BOOL)validatesDomainName
{
    NSData *cerData = [NSData dataWithContentsOfFile:cerPath];
    // 使用证书验证模式
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    // 如果需要验证自建证书(无效证书)，需要设置为YES
    securityPolicy.allowInvalidCertificates = YES;
    // 是否需要验证域名，默认为YES;
    securityPolicy.validatesDomainName = validatesDomainName;
    securityPolicy.pinnedCertificates = [[NSSet alloc] initWithObjects:cerData, nil];
    
    [_sessionManager setSecurityPolicy:securityPolicy];
}

#pragma mark - 下载

/**
 GET请求,无缓存
 */
+ (__kindof NSURLSessionTask *)GET:(NSString *)URL
                        parameters:(id)parameters
                           success:(DNHttpRequestSuccess)success
                           failure:(DNHttpRequestFailed)failure
{
    return [self GET:URL parameters:parameters responseCache:nil success:success failure:failure];
}

/**
 GET请求,自动缓存
 */
+ (__kindof NSURLSessionTask *)GET:(NSString *)URL
                        parameters:(id)parameters
                     responseCache:(DNHttpRequestCache)responseCache
                           success:(DNHttpRequestSuccess)success
                           failure:(DNHttpRequestFailed)failure
{
    NSString *URLString = URL;
    
    //读取缓存
    responseCache != nil ? responseCache([DNNetworkCache networkCacheForURLString:URL parameters:parameters]) : nil;
    
    NSURLSessionTask *sessionTask = [_sessionManager GET:URLString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (_isOpenLog) {DNLog(@"responseObject = %@",[self jsonToString:responseObject]);}
        [[[self class] allSessionTask] removeObject:task];
        success ? success(responseObject) : nil;
        //对数据进行异步缓存
        responseCache!=nil ? [DNNetworkCache setNetworkCacheURLString:URL parameters:parameters networkData:responseObject] : nil;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        [[DNReportManager sharedManager] catchNetworkError:error url:URL params:parameters type:DNReportTypeHTTP];
        if (_isOpenLog) {DNLog(@"error = %@",error);}
//        [[DNAPIConfig sharedInstance] registFailedPath:URL];
        
        [[[self class] allSessionTask] removeObject:task];
        failure ? failure(error) : nil;
    }];
    // 添加sessionTask到数组
    sessionTask ? [[[self class] allSessionTask] addObject:sessionTask] : nil ;
    
    return sessionTask;
}

/**
 POST请求,无缓存
 */
+ (__kindof NSURLSessionTask *)POST:(NSString *)URL
                         parameters:(id)parameters
                            success:(DNHttpRequestSuccess)success
                            failure:(DNHttpRequestFailed)failure
{
    return [self POST:URL parameters:parameters responseCache:nil success:success failure:failure];
}

/**
 POST请求,自动缓存
 */
+ (__kindof NSURLSessionTask *)POST:(NSString *)URL
                         parameters:(id)parameters
                      responseCache:(DNHttpRequestCache)responseCache
                            success:(DNHttpRequestSuccess)success
                            failure:(DNHttpRequestFailed)failure
{
    NSString *URLString = URL;
    
    //读取缓存
    responseCache != nil ? responseCache([DNNetworkCache networkCacheForURLString:URL parameters:parameters]) : nil;
    
    NSURLSessionTask *sessionTask = [_sessionManager POST:URLString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (_isOpenLog) {DNLog(@"responseObject = %@",[self jsonToString:responseObject]);}
        [[[self class] allSessionTask] removeObject:task];
        success ? success(responseObject) : nil;
        //对数据进行异步缓存
        responseCache != nil ? [DNNetworkCache setNetworkCacheURLString:URL parameters:parameters networkData:responseObject] : nil;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        
//        [[DNReportManager sharedManager] catchNetworkError:error url:URL params:parameters type:DNReportTypeHTTP];
        if (_isOpenLog) {DNLog(@"error = %@",error);}
//        [[DNAPIConfig sharedInstance] registFailedPath:URL];
        
        [[[self class] allSessionTask] removeObject:task];
        failure ? failure(error) : nil;
        
    }];
    
    // 添加最新的sessionTask到数组
    sessionTask ? [[[self class] allSessionTask] addObject:sessionTask] : nil ;
    return sessionTask;
    
}

/**
 POST请求,手动缓存，可对数据进行操作
 */
+ (__kindof NSURLSessionTask *)POSTManualCache:(NSString *)URL
                                    parameters:(id)parameters
                                 responseCache:(DNHttpRequestCache)responseCache
                                       success:(DNHttpRequestSuccess)success
                                       failure:(DNHttpRequestFailed)failure
{
    NSString *URLString = URL;
    //读取缓存
    responseCache != nil ? responseCache([DNNetworkCache networkCacheForURLString:URL parameters:parameters]) : nil;
    
    NSURLSessionTask *sessionTask = [_sessionManager POST:URLString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (_isOpenLog) {DNLog(@"responseObject = %@",[self jsonToString:responseObject]);}
        [[[self class] allSessionTask] removeObject:task];
        success ? success(responseObject) : nil;
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
//        [[DNReportManager sharedManager] catchNetworkError:error url:URL params:parameters type:DNReportTypeHTTP];
//        [[DNAPIConfig sharedInstance] registFailedPath:URL];
        if (_isOpenLog) {DNLog(@"error = %@",error);}
        [[[self class] allSessionTask] removeObject:task];
        failure ? failure(error) : nil;
        
    }];
    
    // 添加最新的sessionTask到数组
    sessionTask ? [[[self class] allSessionTask] addObject:sessionTask] : nil ;
    return sessionTask;
    
}

+ (__kindof NSURLSessionTask *)HEAD:(NSString *)URL
                         parameters:(id)parameters
                            success:(DNHttpRequestSuccess)success
                            failure:(DNHttpRequestFailed)failure{
    NSString *URLString = URL;
    NSURLSessionTask *sessionTask = [_sessionManager HEAD:URLString parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task) {
        //        if (_isOpenLog) {DNLog(@"responseObject = %@",[self jsonToString:responseObject]);}
        [[[self class] allSessionTask] removeObject:task];
        success ? success(task.response) : nil;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        [[DNReportManager sharedManager] catchNetworkError:error url:URL params:parameters type:DNReportTypeHTTP];
        if (_isOpenLog) {DNLog(@"error = %@",error);}
        [[[self class] allSessionTask] removeObject:task];
        failure ? failure(error) : nil;
    }];
    
    // 添加最新的sessionTask到数组
    //    sessionTask ? [[[self class] allSessionTask] addObject:sessionTask] : nil ;
    return sessionTask;
}
/**
 下载文件
 */
+ (__kindof NSURLSessionTask *)downloadWithURL:(NSString *)URL
                                       fileDir:(NSString *)fileDir
                                      progress:(DNHttpProgress)progress
                                       success:(void(^)(NSString *filePath))success
                                       failure:(DNHttpRequestFailed)failure
{
    NSString *URLString = URL;
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:URLString]];
    __block NSURLSessionDownloadTask *downloadTask = [_sessionManager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        //下载进度
        dispatch_sync(dispatch_get_main_queue(), ^{
            progress ? progress(downloadProgress) : nil;
        });
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        //拼接缓存目录
        NSString *downloadDir = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:fileDir ? fileDir : @"Download"];
        //打开文件管理器
        NSFileManager *fileManager = [NSFileManager defaultManager];
        //创建Download目录
        [fileManager createDirectoryAtPath:downloadDir withIntermediateDirectories:YES attributes:nil error:nil];
        //拼接文件路径
        NSString *filePath = [downloadDir stringByAppendingPathComponent:response.suggestedFilename];
        //返回文件位置的URL路径
        return [NSURL fileURLWithPath:filePath];
        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
//        [[DNReportManager sharedManager] catchNetworkError:error url:URL params:nil type:DNReportTypeHTTP];
        [[[self class] allSessionTask] removeObject:downloadTask];
        if(failure && error) {failure(error) ; return ;};
        success ? success(filePath.absoluteString /** NSURL->NSString*/) : nil;
        
    }];
    //开始下载
    [downloadTask resume];
    // 添加sessionTask到数组
    downloadTask ? [[[self class] allSessionTask] addObject:downloadTask] : nil ;
    
    return downloadTask;
    
}



#pragma mark - 上传

/**
 上传多张图片或者视频
 */
+ (__kindof NSURLSessionTask *)uploadFileWithURL:(NSString *)URL
                                      parameters:(id)parameters
                                           names:(NSArray *)names
                                       fileNames:(NSArray *)fileNames
                                       fileDatas:(NSArray *)fileDatas
                                       meteTypes:(NSArray *)meteTypes
                                        progress:(DNHttpProgress)progress
                                         success:(DNHttpRequestSuccess)success
                                         failure:(DNHttpRequestFailed)failure
{
    NSString *URLString = URL;
    [_sessionManager.requestSerializer setValue:@"*/*" forHTTPHeaderField:@"Accept"]; //需改告诉后台可以接受
    NSURLSessionTask *sessionTask = [_sessionManager POST:URLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        if (fileDatas.count) {
            for (NSUInteger i = 0; i < fileDatas.count; i++) {
                NSData *data = fileDatas[i];
                NSString *name = names[i];
                NSString *fileName = fileNames[i];
                NSString *meteType =meteTypes[i];
                
                [formData appendPartWithFileData:data name:name fileName:fileName mimeType:meteType];
            }
        }
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        //上传进度
        dispatch_sync(dispatch_get_main_queue(), ^{
            progress ? progress(uploadProgress) : nil;
        });
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (_isOpenLog) {DNLog(@"responseObject = %@",[self jsonToString:responseObject]);}
        [[[self class] allSessionTask] removeObject:task];
        success ? success(responseObject) : nil;
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        [[DNReportManager sharedManager] catchNetworkError:error url:URL params:parameters type:DNReportTypeHTTP];
        if (_isOpenLog) {DNLog(@"error = %@",error);}
        [[[self class] allSessionTask] removeObject:task];
        failure ? failure(error) : nil;
    }];
    
    // 添加sessionTask到数组
    sessionTask ? [[[self class] allSessionTask] addObject:sessionTask] : nil ;
    
    return sessionTask;
}


/**
 上传文件
 */
+ (__kindof NSURLSessionTask *)uploadFileWithURL:(NSString *)URL
                                      parameters:(id)parameters
                                            name:(NSString *)name
                                        filePath:(NSString *)filePath
                                        progress:(DNHttpProgress)progress
                                         success:(DNHttpRequestSuccess)success
                                         failure:(DNHttpRequestFailed)failure
{
    NSString *URLString = URL;
    NSURLSessionTask *sessionTask = [_sessionManager POST:URLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        NSError *error = nil;
        [formData appendPartWithFileURL:[NSURL URLWithString:filePath] name:name error:&error];
        (failure && error) ? failure(error) : nil;
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        //上传进度
        dispatch_sync(dispatch_get_main_queue(), ^{
            progress ? progress(uploadProgress) : nil;
        });
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (_isOpenLog) {DNLog(@"responseObject = %@",[self jsonToString:responseObject]);}
        [[[self class] allSessionTask] removeObject:task];
        success ? success(responseObject) : nil;
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        [[DNReportManager sharedManager] catchNetworkError:error url:URL params:parameters type:DNReportTypeHTTP];
        if (_isOpenLog) {DNLog(@"error = %@",error);}
        [[[self class] allSessionTask] removeObject:task];
        failure ? failure(error) : nil;
    }];
    
    // 添加sessionTask到数组
    sessionTask ? [[[self class] allSessionTask] addObject:sessionTask] : nil ;
    
    return sessionTask;
}

/**
 上传单/多张图片
 */
+ (__kindof NSURLSessionTask *)uploadImagesWithURL:(NSString *)URL
                                        parameters:(id)parameters
                                              name:(NSString *)name
                                            images:(NSArray<UIImage *> *)images
                                         fileNames:(NSArray<NSString *> *)fileNames
                                        imageScale:(CGFloat)imageScale
                                         imageType:(NSString *)imageType
                                          progress:(DNHttpProgress)progress
                                           success:(DNHttpRequestSuccess)success
                                           failure:(DNHttpRequestFailed)failure
{
    NSString *URLString = URL;
    NSURLSessionTask *sessionTask = [_sessionManager POST:URLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        for (NSUInteger i = 0; i < images.count; i++) {
            // 图片经过等比压缩后得到的二进制文件
            NSData *imageData = UIImageJPEGRepresentation(images[i], imageScale ?: 1.f);
            // 默认图片的文件名, 若fileNames为nil就使用
            
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            formatter.dateFormat = @"yyyyDNddHHDNss";
            NSString *str = [formatter stringFromDate:[NSDate date]];
            NSString *imageFileName = NSStringFormat(@"%@%ld.%@",str,i,imageType?:@"jpg");
            
            [formData appendPartWithFileData:imageData
                                        name:name
                                    fileName:fileNames ? NSStringFormat(@"%@.%@",fileNames[i],imageType?:@"jpg") : imageFileName
                                    mimeType:NSStringFormat(@"image/%@",imageType ?: @"jpg")];
        }
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        //上传进度
        dispatch_sync(dispatch_get_main_queue(), ^{
            progress ? progress(uploadProgress) : nil;
        });
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (_isOpenLog) {DNLog(@"responseObject = %@",[self jsonToString:responseObject]);}
        [[[self class] allSessionTask] removeObject:task];
        success ? success(responseObject) : nil;
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        [[DNReportManager sharedManager] catchNetworkError:error url:URL params:parameters type:DNReportTypeHTTP];
        if (_isOpenLog) {DNLog(@"error = %@",error);}
        [[[self class] allSessionTask] removeObject:task];
        failure ? failure(error) : nil;
    }];
    
    // 添加sessionTask到数组
    sessionTask ? [[[self class] allSessionTask] addObject:sessionTask] : nil ;
    
    return sessionTask;
    
}
#pragma mark - Private
/**
 存储着所有的请求task数组
 */
+ (NSMutableArray *)allSessionTask {
    
    if (!_allSessionTask) {
        _allSessionTask = [[NSMutableArray alloc] init];
    }
    return _allSessionTask;
}

/**
 *  json转字符串
 */
+ (NSString *)jsonToString:(id)data {
    if(data == nil) { return nil; }
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:data options:NSJSONWritingPrettyPrinted error:nil];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

@end


#pragma mark - NSDictionary,NSArray的分类
/*
 ************************************************************************************
 *新建NSDictionary与NSArray的分类, 控制台打印json数据中的中文
 ************************************************************************************
 */

#ifdef DEBUG
@implementation NSArray (DN)

- (NSString *)descriptionWithLocale:(id)locale {
    NSMutableString *strM = [NSMutableString stringWithString:@"(\n"];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [strM appendFormat:@"\t%@,\n", obj];
    }];
    [strM appendString:@")"];
    
    return strM;
}

@end

@implementation NSDictionary (DN)

- (NSString *)descriptionWithLocale:(id)locale {
    NSMutableString *strM = [NSMutableString stringWithString:@"{\n"];
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [strM appendFormat:@"\t%@ = %@;\n", key, obj];
    }];
    
    [strM appendString:@"}\n"];
    
    return strM;
}
@end
#endif
