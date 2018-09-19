//
//  DNNetworkMacro.h
//  DoNewsNetworking
//
//  Created by Ming on 2018/9/11.
//  Copyright © 2018 DoNews. All rights reserved.
//

#ifndef DNNetworkMacro_h
#define DNNetworkMacro_h

typedef NS_ENUM(NSUInteger, DNNetworkStatusType) {
    /** 未知网络*/
    DNNetworkStatusUnknown,
    /** 无网络*/
    DNNetworkStatusNotReachable,
    /** 手机网络*/
    DNNetworkStatusReachableViaWWAN,
    /** WIFI网络*/
    DNNetworkStatusReachableViaWiFi
};

typedef NS_ENUM(NSUInteger, DNRequestSerializer) {
    /** 设置请求数据为JSON格式*/
    DNRequestSerializerJSON,
    /** 设置请求数据为二进制格式*/
    DNRequestSerializerHTTP,
};

typedef NS_ENUM(NSUInteger, DNResponseSerializer) {
    /** 设置响应数据为JSON格式*/
    DNResponseSerializerJSON,
    /** 设置响应数据为二进制格式*/
    DNResponseSerializerHTTP,
};

/** 请求成功的Block */
typedef void(^DNHttpRequestSuccess)(id responseObject);

/** 请求失败的Block */
typedef void(^DNHttpRequestFailed)(NSError *error);

/** 缓存的Block */
typedef void(^DNHttpRequestCache)(id responseCache);

/** 上传或者下载的进度, Progress.completedUnitCount:当前大小 - Progress.totalUnitCount:总大小*/
typedef void (^DNHttpProgress)(NSProgress *progress);

/** 网络状态的Block*/
typedef void(^DNNetworkStatus)(DNNetworkStatusType status);

#endif /* DNNetworkMacro_h */
