//
//  ZFMColorManager.h
//  ZZFM
//
//  Created by donews on 2018/8/14.
//  Copyright © 2018年 donews. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <DDSkin/DDSkinStorage.h>

FOUNDATION_EXTERN NSString * const DNColorMainPage; // 主界面的颜色
FOUNDATION_EXTERN NSString * const DNColorButtonTitleNormal; // 按钮normal文字颜色
FOUNDATION_EXTERN NSString * const DNColorButtonBackground; // 按钮的背景色

FOUNDATION_EXTERN NSString * const DNImageNavBackIcon; // 返回按钮图标



@interface ZFMColorManager : DDSkinStorage

/// 占位背景色
@property (nonatomic, readonly, copy) UIColor *colorPlaceholder;
/// 主页面的背景色
@property (nonatomic, readonly, copy) UIColor *colorMainPage;
/// 导航的背景色
@property (nonatomic, readonly, copy) UIColor *colorNavBackground;
/// 导航条标题的颜色
@property (nonatomic, readonly, copy) UIColor *colorNavTitle;
/// tabbar的背景色
@property (nonatomic, readonly, copy) UIColor *colorTabBarBackground;
@property (nonatomic, readonly, copy) UIColor *colorTabBarItemNormal;
@property (nonatomic, readonly, copy) UIColor *colorTabBarItemSeleted;

/// PageScroll的seleted颜色
@property (nonatomic, readonly, copy) UIColor *colorPageScrollSelected;
/// PageScroll的normal颜色
@property (nonatomic, readonly, copy) UIColor *colorPageScrollNormal;
@property (nonatomic, readonly, copy) UIColor *colorBlack32;
@property (nonatomic, readonly, copy) UIColor *colorGray96;
/// 播放界面slider的颜色
@property (nonatomic, readonly, copy) UIColor *colorSliderProgress;

/// 底线的颜色
@property (nonatomic, readonly, copy) UIColor *colorLine;
/// 白色
@property (nonatomic, readonly, copy) UIColor *colorWhite;

+ (instancetype)manager;

@end
