//
//  NavigationConfig.m
//  OAManager
//
//  Created by 郑佳 on 2017/12/3.
//  Copyright © 2017年 kepuna. All rights reserved.
//

#import "NavigationConfig.h"

@implementation NavigationConfig

+ (instancetype)sharedInstance {
    static NavigationConfig *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [NavigationConfig defaultConfig];
    });
    return _instance;
}

+ (instancetype)defaultConfig {

    NavigationConfig *config = [[NavigationConfig alloc] init];
    config.globalBackgroundColor = [UIColor whiteColor];
    config.font = [UIFont systemFontOfSize:18];
    config.titleColor = [UIColor blackColor];
    config.bottomLineColor = [UIColor grayColor];
    return config;
}

- (void)updateNavWithConfig:(void (^)(NavigationConfig *))configBlock {
    if (configBlock) {
        configBlock(self);
    }
}

@end
