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
    config.font = [UIFont systemFontOfSize:12];
    config.titleColorNormal = [UIColor blueColor];
    config.titleColorSelected = [UIColor redColor];
    config.tintColor = [UIColor yellowColor];
    return config;
}

@end
