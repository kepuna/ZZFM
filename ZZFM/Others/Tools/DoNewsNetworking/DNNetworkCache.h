//
//  DNNetworkCache.h
//  DoNewsNetworking
//
//  Created by Ming on 2018/9/11.
//  Copyright © 2018 DoNews. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DNNetworkCache : NSObject

/**
 异步缓存网络数据,根据请求的 URL与parameters
 做KEY存储数据, 这样就能缓存多级页面的数据
 
 @param URLString 请求的URL地址
 @param parameters 请求的参数
 @param networkData 服务器返回的数据
 */
+ (void)setNetworkCacheURLString:(NSString *)URLString parameters:(NSDictionary *)parameters networkData:(id)networkData;

/**
 根据请求的 URL与parameters 取出缓存数据
 
 @param URLString 请求的URL
 @param parameters 请求的参数
 @return 缓存的服务器数据
 */
+ (id)networkCacheForURLString:(NSString *)URLString parameters:(NSDictionary *)parameters;

/**
 根据请求的 URL与parameters 异步取出缓存数据
 
 @param URLString 请求的URL
 @param parameters 请求的参数
 @param block 异步回调缓存的数据
 */
+ (void)networkCacheForURLString:(NSString *)URLString parameters:(NSDictionary *)parameters withBlock:(void(^)(id<NSCoding> object))block;

/**
 获取网络缓存的总大小 bytes(字节)
 
 @return 缓存总大小
 */
+ (NSInteger)getAllNetworkCacheSize;


/**
 删除所有网络缓存
 */
+ (void)removeAllNetworkCache;

//重新赋值视频缓存
+(void)assiGnmentVideoCache:(NSArray *)cacheArray;

@end
