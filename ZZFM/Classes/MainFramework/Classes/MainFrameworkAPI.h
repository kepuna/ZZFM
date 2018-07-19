//
//  MainFrameworkAPI.h
//  NCube
//
//  Created by kepuna on 2017/11/11.
//  Copyright © 2017年 junjie.liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NXTabBarConfig.h"
#import "NavigationView.h"

@interface MainFrameworkAPI : NSObject

+ (instancetype)sharedInstance;

/**
 获取根控制器
 */
- (UITabBarController *)rootTabBarController;

/**
 设置Tabbarcontroller需要的数组

 @param controllers 子控制器数组
 @param titles 标题数组
 @param imagesNormal 普通状态图标数组
 @param imagesSeleted 选中状态图标数组
 */
- (void)addChildContollers:(NSArray <UIViewController *> *)controllers titles:(NSArray <NSString *> *)titles imagesNormal:(NSArray <NSString *> *)imagesNormal imagesSeleted:(NSArray <NSString *> *)imagesSeleted;

- (void)addChildContollers:(NSArray <UIViewController *> *)controllers titles:(NSArray <NSString *> *)titles imagesNormal:(NSArray <NSString *> *)imagesNormal imagesSeleted:(NSArray <NSString *> *)imagesSeleted inBundle:(NSString *)bundle;

/**
 更新tabbar的配置信息
 */
- (void)updateTabBarWithConfig:(void(^)(NXTabBarConfig *config))configBlock;

/**
 更新tabbar的配置信息
 */
- (void)updateNavWithConfig:(void(^)(NavigationConfig *config))configBlock;

@end
