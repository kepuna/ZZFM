//
//  NXTabBarConfig.m
//  OAManager
//
//  Created by 郑佳 on 2017/12/3.
//  Copyright © 2017年 kepuna. All rights reserved.
//

#import "NXTabBarConfig.h"

@implementation NXTabBarConfig

+ (instancetype)defaultConfig {

    NXTabBarConfig *config = [[NXTabBarConfig alloc] init];
    config.style = TabBarStyleDefault;
    return config;
}

@end
