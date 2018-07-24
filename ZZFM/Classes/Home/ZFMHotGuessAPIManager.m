//
//  ZFMHotGuessAPIManager.m
//  ZZFM
//
//  Created by donews on 2018/7/24.
//  Copyright © 2018年 donews. All rights reserved.
//

#import "ZFMHotGuessAPIManager.h"
#import "Target_ZFMRequestService.h"

@interface ZFMHotGuessAPIManager() <CTAPIManagerValidator, CTAPIManagerParamSource>

@end

@implementation ZFMHotGuessAPIManager

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
    return @"http://mobile.ximalaya.com/mobile/discovery/v2/recommend/hotAndGuess?code=43_110000_1100&device=iPhone&version=5.4.21";
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
