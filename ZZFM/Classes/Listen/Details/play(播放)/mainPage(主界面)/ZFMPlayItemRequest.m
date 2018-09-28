//
//  ZFMPlayItemRequest.m
//  ZZFM
//
//  Created by donews on 2018/9/26.
//  Copyright © 2018年 donews. All rights reserved.
//

#import "ZFMPlayItemRequest.h"

@implementation ZFMPlayItemRequest

- (NSString *)requestUrl {
    NSString *url = @"http://mobile.ximalaya.com/v1/track/ca/playpage";
    return [NSString stringWithFormat:@"%@/%@",url,self.trackUid];
}

- (ZFMRequestType)requestType {
    return ZFMRequestTypeGET;
}

@end
