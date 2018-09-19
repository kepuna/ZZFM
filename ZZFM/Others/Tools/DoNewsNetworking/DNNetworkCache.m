//
//  DNNetworkCache.m
//  DoNewsNetworking
//
//  Created by Ming on 2018/9/11.
//  Copyright © 2018 DoNews. All rights reserved.
//

#import "DNNetworkCache.h"
#import "YYCache.h"

@implementation DNNetworkCache

static NSString *const NetworkResponseCache = @"DNNetworkResponseCache";
static YYCache *_dataCache;

#pragma mark - Override
+ (void)initialize {
    _dataCache = [YYCache cacheWithName:NetworkResponseCache];
    _dataCache.diskCache.ageLimit = 12 * 60 * 60;//缓存时长为12小时 12 * 60 * 60;
}

#pragma mark - Public

/**
 异步缓存网络数据,根据请求的 URL与parameters
 */
+ (void)setNetworkCacheURLString:(NSString *)URLString parameters:(NSDictionary *)parameters networkData:(id)networkData
{
    NSString *cacheKey = [self cacheKeyWithURL:URLString parameters:parameters];
    //异步缓存,不会阻塞主线程
    [_dataCache setObject:networkData forKey:cacheKey withBlock:nil];
}

/**
 根据请求的 URL与parameters 取出缓存数据
 */
+ (id)networkCacheForURLString:(NSString *)URLString parameters:(NSDictionary *)parameters
{
    NSString *cacheKey = [self cacheKeyWithURL:URLString parameters:parameters];
    
    
    return [_dataCache objectForKey:cacheKey];
}
+(void)assiGnmentVideoCache:(NSArray *)cacheArray{
    //    NSDictionary * dic=@{@"cityid":@""}
    //    NSString *string =@""
    //    NSString *cachekey =[NSString stringWithFormat:@"%@",]
    
    
}
/**
 根据请求的 URL与parameters 异步取出缓存数据
 */
+ (void)networkCacheForURLString:(NSString *)URLString parameters:(NSDictionary *)parameters withBlock:(void(^)(id<NSCoding> object))block
{
    NSString *cacheKey = [self cacheKeyWithURL:URLString parameters:parameters];
    [_dataCache objectForKey:cacheKey withBlock:^(NSString * _Nonnull key, id<NSCoding>  _Nonnull object) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (block) {
                block(object);
            }
        });
    }];
}

/**
 获取网络缓存的总大小 bytes(字节)
 */
+ (NSInteger)getAllNetworkCacheSize
{
    return [_dataCache.diskCache totalCost];
}

/**
 删除所有网络缓存
 */
+ (void)removeAllNetworkCache
{
    [_dataCache.diskCache removeAllObjects];
}

#pragma mark - Private
+ (NSString *)cacheKeyWithURL:(NSString *)URL parameters:(NSDictionary *)parameters {
    if(!parameters){return URL;};
    // 将参数字典转换成字符串
    NSData *stringData = [NSJSONSerialization dataWithJSONObject:parameters options:0 error:nil];
    NSString *paraString = [[NSString alloc] initWithData:stringData encoding:NSUTF8StringEncoding];
    
    // 将URL与转换好的参数字符串拼接在一起,成为最终存储的KEY值
    NSString *cacheKey = [NSString stringWithFormat:@"%@%@",URL,paraString];
    
    return cacheKey;
}
@end
