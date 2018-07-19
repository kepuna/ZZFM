
//  NXTabBarController.m
//  NCube
//
//  Created by kepuna on 2016/11/27.
//  Copyright © 2016年 junjie.liu. All rights reserved.
//

#import "NXTabBarController.h"
#import "NXNavigationController.h"
#import "NXTabBar.h"
#import "LSTabBar.h"
#import "UITabBar+badge.h"
#import <Accelerate/Accelerate.h>

@interface NXTabBarController ()

@property (nonatomic, strong) NXTabBar *customTabBar;
@property (nonatomic, strong) NXTabBarConfig *config;

@end

@implementation NXTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self p_setTabBarWithConfig:self.config];
    
    UITabBar *tabbar = [UITabBar appearance];
//    [tabbar setShadowImage:[UIImage ls_imageWithColor:UIColorWithHex16_(0xf3f3f3) andHeight:0.5]];
    [tabbar setShadowImage:[UIImage new]];
//    tabbar.translucent = YES;
}

- (void)addChildContollers:(NSArray<UIViewController *> *)controllers titles:(NSArray<NSString *> *)titles imagesNormal:(NSArray<NSString *> *)imagesNormal imagesSeleted:(NSArray<NSString *> *)imagesSeleted {
    
    [controllers enumerateObjectsUsingBlock:^(UIViewController *vc, NSUInteger idx, BOOL * _Nonnull stop) {
        
//        UIViewController *vc = [[NSClassFromString(vcStr) alloc] init];
        UIImage *imageN = [UIImage imageNamed:imagesNormal[idx]];
        UIImage *imageS = [UIImage imageNamed:imagesSeleted[idx]];
        imageN = [imageN imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        imageS = [imageS imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        vc.tabBarItem.title = titles[idx];
        vc.tabBarItem.image = imageN;
        vc.tabBarItem.selectedImage = imageS;
        NXNavigationController *nav = [[NXNavigationController alloc]initWithRootViewController:vc];
        [self addChildViewController:nav];
    }];
}

- (void)addChildContollers:(NSArray<UIViewController *> *)controllers titles:(NSArray<NSString *> *)titles imagesNormal:(NSArray<NSString *> *)imagesNormal imagesSeleted:(NSArray<NSString *> *)imagesSeleted inBundle:(NSString *)bundle {
    
    [controllers enumerateObjectsUsingBlock:^(UIViewController *vc, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSString *imgBundlePath = [[NSBundle mainBundle] pathForResource:bundle ofType:@"bundle"];
        NSBundle *imgBundle = [NSBundle bundleWithPath:imgBundlePath];
        UIImage *imageN = nil;
        UIImage *imageS = nil;
        if (imgBundle) {
            imageN = [UIImage imageNamed:imagesNormal[idx] inBundle:imgBundle compatibleWithTraitCollection:nil];
            imageS = [UIImage imageNamed:imagesSeleted[idx] inBundle:imgBundle compatibleWithTraitCollection:nil];
        } else {
            imageN = [UIImage imageNamed:imagesNormal[idx]];
            imageS = [UIImage imageNamed:imagesSeleted[idx]];
        }
        
        imageN = [imageN imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        imageS = [imageS imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        vc.tabBarItem.title = titles[idx];
        vc.tabBarItem.image = imageN;
        vc.tabBarItem.selectedImage = imageS;
        NXNavigationController *nav = [[NXNavigationController alloc]initWithRootViewController:vc];
        [self addChildViewController:nav];
    }];

    
   
    
}

- (void)updateWithConfig: (void(^)(NXTabBarConfig *config))configBlock {
    if (configBlock) {
        configBlock(self.config);
    }
    
    [self p_setTabBarWithConfig:self.config];
}

- (void)p_setTabBarWithConfig:(NXTabBarConfig *)config {
    
    if (config.style == TabBarStyleCenterIcon) {
        [self setValue:self.customTabBar forKey:@"tabBar"];
        [self.customTabBar setCenterIcon:config.centerIcon];
        self.customTabBar.centerIconClickBlock = config.centerIconClickBlock;
    }else {
        LSTabBar *tabBar = [[LSTabBar alloc] init];
        [self setValue:tabBar forKey:@"tabBar"];
    }
    


    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName : config.font, NSForegroundColorAttributeName : config.titleColorNormal} forState:UIControlStateNormal];
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName : config.font, NSForegroundColorAttributeName : config.titleColorSelected} forState:UIControlStateSelected];
}

#pragma mark - getters & settters
- (NXTabBar *)customTabBar {
    if (_customTabBar == nil) {
        _customTabBar = [[NXTabBar alloc]init];
        _customTabBar.barStyle = UIBarStyleBlackTranslucent;
    }
    return _customTabBar;
}

- (NXTabBarConfig *)config {
    if (_config == nil) {
        _config = [NXTabBarConfig defaultConfig];
    }
    return _config;
}

@end
