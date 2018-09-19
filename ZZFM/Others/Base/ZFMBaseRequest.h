//
//  ZFMBaseRequest.h
//  ZZFM
//
//  Created by donews on 2018/9/18.
//  Copyright © 2018年 donews. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZFMResponseModel.h"

typedef NS_ENUM(NSInteger, ZFMRequestType) {
    ZFMRequestTypePOST,
    ZFMRequestTypeGET
};


@interface ZFMBaseRequest : NSObject

///-----------
/// 基本参数
///-----------
@property (nonatomic, copy) NSString *device;

/// 请求的url路径
@property (nonatomic, copy) NSString *requestUrl;
/// 请求方式 默认是POST
@property (nonatomic, assign) ZFMRequestType requestType;
/// 是否缓存接口
@property (nonatomic, assign) BOOL isCache;
/// 是否打印返回结果 默认不打印
@property (nonatomic, assign) BOOL isLoger;

/// model转换成字典
- (NSDictionary *)toJSONData;

/**
 请求数据方法
 
 @param completionBlock isSuccess 字段标识response 是否为1000
 */
- (void)requestData:(void(^)(BOOL isSuccess, ZFMResponseModel *responseModel, NSError *error))completionBlock;

@end
