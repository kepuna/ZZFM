//
//  ZFMBaseRequest.m
//  ZZFM
//
//  Created by donews on 2018/9/18.
//  Copyright © 2018年 donews. All rights reserved.
//

#import "ZFMBaseRequest.h"
#import <YYModel.h>
#import "DNNetworkManager.h"
#import "ZFMResponseModel.h"

@implementation ZFMBaseRequest

- (instancetype)init {
    if (self = [super init]) {
        self.device = @"iPhone";
    }
    return self;
}

+ (nullable NSArray<NSString *> *)modelPropertyBlacklist {
    return @[@"requestType",@"requestUrl",@"isLoger"];
}

- (NSDictionary *)toJSONData {
    return [NSJSONSerialization JSONObjectWithData:self.yy_modelToJSONData options:NSJSONReadingMutableLeaves error:nil];
}

- (void)requestData:(void (^)(BOOL, ZFMResponseModel *, NSError *))completionBlock {
    
    if (!self.requestUrl) {
        return;
    }
    
    if (self.isLoger) {
        [DNNetworkManager openLog];
    }
    
    NSDictionary *params = self.toJSONData ?:nil;    
    if (self.requestType == ZFMRequestTypeGET) {
        [DNNetworkManager GET:self.requestUrl  parameters:params success:^(id responseObject) {
            
            ZFMResponseModel *responseModel = [ZFMResponseModel yy_modelWithDictionary:responseObject];
            if (responseModel.ret == 0) {
                completionBlock(YES,responseModel, nil);
            } else {
                completionBlock(NO,responseObject, nil);
            }
        } failure:^(NSError *error) {
             completionBlock(NO,nil,error);
        }];
        
    } else {
        
        [DNNetworkManager POST:self.requestUrl parameters:self.toJSONData success:^(id responseObject) {
            
            ZFMResponseModel *responseModel = [ZFMResponseModel yy_modelWithDictionary:responseObject];
            if (responseModel.ret == 0) {
                completionBlock(YES,responseModel, nil);
            } else {
                completionBlock(NO,responseObject, nil);
            }
        } failure:^(NSError *error) {
            completionBlock(NO,nil,error);
        }];
    }
    
}

@end
