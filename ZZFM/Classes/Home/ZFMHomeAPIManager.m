//
//  ZFMHomeAPIManager.m
//  ZZFM
//
//  Created by donews on 2018/7/24.
//  Copyright © 2018年 donews. All rights reserved.
//

#import "ZFMHomeAPIManager.h"
#import "Target_ZFMRequestService.h"

@interface ZFMHomeAPIManager() <CTAPIManagerValidator, CTAPIManagerParamSource>

@end

@implementation ZFMHomeAPIManager

#pragma mark - life cycle
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.paramSource = self;
        self.validator = self;
    }
    return self;
}

#pragma mark - CTAPIManager
- (NSString *_Nonnull)methodName
{
//    return @"public/characters";
    return @"http://mobile.ximalaya.com/mobile/discovery/v4/recommends?channel=ios-b1&device=iPhone&includeActivity=true&includeSpecial=true&scale=2&version=5.4.21";
}

- (NSString *_Nonnull)serviceIdentifier
{
    return ZFMRequestServiceIdentifier;
}

- (CTAPIManagerRequestType)requestType
{
    return CTAPIManagerRequestTypeGet;
}

#pragma mark - CTAPIManagerParamSource
- (NSDictionary *)paramsForApi:(CTAPIBaseManager *)manager
{
    return nil;
}

#pragma mark - CTAPIManagerValidator
- (CTAPIManagerErrorType)manager:(CTAPIBaseManager *)manager isCorrectWithParamsData:(NSDictionary *)data
{
    return CTAPIManagerErrorTypeNoError;
}

- (CTAPIManagerErrorType)manager:(CTAPIBaseManager *)manager isCorrectWithCallBackData:(NSDictionary *)data
{
    return CTAPIManagerErrorTypeNoError;
}


@end
