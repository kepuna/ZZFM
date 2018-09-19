//
//  MainFrameworkAPI.h
//  NCube
//
//  Created by kepuna on 2017/11/11.
//  Copyright © 2017年 junjie.liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NXTabBarConfig.h"
#import "NavigationConfig.h"

@interface MainFrameworkAPI : NSObject

+ (instancetype)sharedInstance;

/**
 获取根控制器
 */
- (UITabBarController *)rootTabBarController;

/**
 获取根控制器 & 自定义tabbar
 */
- (UITabBarController *)rootTabBarControllerAndCustomTabBar:(UITabBar *)customBar;

/**
 设置Tabbarcontroller需要的数组

 @param controllers 子控制器数组
 @param titles 标题数组
 @param imagesNormal 普通状态图标数组
 @param imagesSeleted 选中状态图标数组
 */
- (void)addChildContollers:(NSArray <UIViewController *> *)controllers titles:(NSArray <NSString *> *)titles imagesNormal:(NSArray <NSString *> *)imagesNormal imagesSeleted:(NSArray <NSString *> *)imagesSeleted;


/**
 设置Tabbarcontroller需要的数组

 @param controllers 子控制器数组
 @param titles 标题数组
 @param imagesNormal 普通状态图标数组
 @param imagesSeleted 选中状态图标数组
 @param bundle 资源的bundle
 */
- (void)addChildContollers:(NSArray <UIViewController *> *)controllers titles:(NSArray <NSString *> *)titles imagesNormal:(NSArray <NSString *> *)imagesNormal imagesSeleted:(NSArray <NSString *> *)imagesSeleted inBundle:(NSString *)bundle;

/**
 更新tabbar的默认配置信息
 */
- (void)updateTabBarWithConfig:(void(^)(NXTabBarConfig *config))configBlock;

/**
 切换模式是更新tabbar信息
 */
- (void)updateTabBarWithConfigWhenSwitchMode:(void(^)(NXTabBarConfig *config))configBlock;

/**
 更新nav的默认配置信息
 */
- (void)updateNavWithConfig:(void(^)(NavigationConfig *config))configBlock;

/**
 切换模式是更新Nav信息
 */
- (void)updateNavBarWithConfigWhenSwitchMode:(void(^)(NavigationConfig *config))configBlock;

@end
