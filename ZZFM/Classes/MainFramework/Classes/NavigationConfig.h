//
//  NavigationConfig.h
//  OAManager
//
//  Created by 郑佳 on 2017/12/3.
//  Copyright © 2017年 kepuna. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NavigationConfig : NSObject

+ (instancetype)sharedInstance;

/**
 设置nav的背景图片
 */
@property (nonatomic, strong) UIImage *globalBackgroundImage;

/**
 设置nav背景颜色
 */
@property (nonatomic, strong) UIColor *globalBackgroundColor;

/**
 设置文字的颜色
 */
@property (nonatomic, strong) UIColor *titleColor;


/**
 设置nav的font信息
 */
@property (nonatomic, strong) UIFont *font;

/**
 设置nav底部线条颜色
 */
@property (nonatomic, strong) UIColor *bottomLineColor;


@property (nonatomic, strong) UIImage *backIcon;

- (void)updateNavWithConfig:(void(^)(NavigationConfig *config))configBlock;

@end
