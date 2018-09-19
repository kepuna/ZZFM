//
//  NXTabBarConfig.h
//  OAManager
//
//  Created by 郑佳 on 2017/12/3.
//  Copyright © 2017年 kepuna. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, TabBarStyle) {
    TabBarStyleDefault, // 默认的系统
    TabBarStyleCustom // 自定义的tabbar
};

@interface NXTabBarConfig : NSObject

+ (instancetype)defaultConfig;

/**
 tabbar的样式
 */
@property (nonatomic, assign) TabBarStyle style;

/**
 设置tabbar的背景图片
 */
@property (nonatomic, strong) UIImage *globalBackgroundImage;

/**
 设置tabbar背景颜色
 */
@property (nonatomic, strong) UIColor *globalBackgroundColor;

/**
 设置文字普通状态的颜色
 */
@property (nonatomic, strong) UIColor *titleColorNormal;

/**
 设置文字选中状态的颜色
 */
@property (nonatomic, strong) UIColor *titleColorSelected;

/**
 设置tabbar文字
 */
@property (nonatomic, strong) UIFont *font;

/**
 设置tabbar的tintColor
 */
@property (nonatomic, strong) UIColor *tintColor;

/**
 tabbar中间的icon
 */
@property (nonatomic, strong) UIImage *centerIcon;

/**
 tabbar中间的icon点击事件回调
 */
@property (nonatomic, copy) void(^centerIconClickBlock)();

@end
