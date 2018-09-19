//
//  NXTabBarController.m
//  NCube
//
//  Created by kepuna on 2016/11/27.
//  Copyright © 2016年 junjie.liu. All rights reserved.
//

#import "NXTabBarController.h"
#import "NXNavigationController.h"
#import "NXTabBarConfig.h"
#import "NavigationConfig.h"

@interface NXTabBarController ()

@property (nonatomic, strong) UITabBar *customTabBar;
@property (nonatomic, strong) NXTabBarConfig *config;
@property (nonatomic, strong) NavigationConfig *navConfig;

@end

@implementation NXTabBarController

- (instancetype)initWithCustomTabBar:(UITabBar *)tabBar {
    if (self == [super init]) {
        self.customTabBar = tabBar;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self p_setTabBarWithConfig:self.config];
//    [self p_setNavWithConfig:self.navConfig];
    
//    UITabBar *tabbar = [UITabBar appearance];
//    [tabbar setBackgroundImage:[UIImage new]];
//    [tabbar setShadowImage:[UIImage ls_imageWithColor:UIColorWithHex16_(0xf3f3f3) andHeight:0.5]];
}

- (void)addChildContollers:(NSArray<UIViewController *> *)controllers titles:(NSArray<NSString *> *)titles imagesNormal:(NSArray<NSString *> *)imagesNormal imagesSeleted:(NSArray<NSString *> *)imagesSeleted {
    
    [controllers enumerateObjectsUsingBlock:^(UIViewController *vc, NSUInteger idx, BOOL * _Nonnull stop) {

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

- (void)updateNavBarWithConfig:(void (^)(NavigationConfig *))configBlock {
    if (configBlock) {
        configBlock(self.navConfig);
    }
    [self p_setNavWithConfig:self.navConfig];
}

- (void)p_setNavWithConfig:(NavigationConfig *)config {
    
    if (self.childViewControllers) {
        for (UIViewController *vc in self.childViewControllers) {
            if ([vc isMemberOfClass:[NXNavigationController class]]) {
                NXNavigationController *nav = (NXNavigationController *)vc;
                if (config.globalBackgroundImage) {
                    [nav.navigationBar setBackgroundImage:config.globalBackgroundImage forBarMetrics:UIBarMetricsDefault];
                } else {
                    nav.navigationBar.barTintColor = config.globalBackgroundColor;
                }
                
                nav.navigationBar.tintColor = config.itemColor;
                NSMutableDictionary *attrDict = @{}.mutableCopy;
                if (config.titleFont) {
                    [attrDict setObject:config.titleFont forKey:NSFontAttributeName];
                }
                if (config.titleColor) {
                    [attrDict setObject:config.titleColor forKey:NSForegroundColorAttributeName];
                }
                [nav.navigationBar setTitleTextAttributes:attrDict.copy];
            }
        }
    }
    
    
   
//    [UINavigationBar appearance].tintColor = config.itemColor;
//    NSMutableDictionary *attrDict = @{}.mutableCopy;
//    if (config.titleFont) {
//        [attrDict setObject:config.titleFont forKey:NSFontAttributeName];
//    }
//    if (config.titleColor) {
//        [attrDict setObject:config.titleColor forKey:NSForegroundColorAttributeName];
//    }
    
//    [[UINavigationBar appearance] setTitleTextAttributes:attrDict.copy];
}


- (void)updateWithConfig: (void(^)(NXTabBarConfig *config))configBlock {
    if (configBlock) {
        configBlock(self.config);
    }
    
    [self p_setTabBarWithConfig:self.config];
}

- (void)p_setTabBarWithConfig:(NXTabBarConfig *)config {
    
    if (config.style == TabBarStyleCustom && self.customTabBar) {
        [self setValue:self.customTabBar forKey:@"tabBar"];
    }
    
    if (config.globalBackgroundImage) {
        [self.tabBar setBackgroundImage:config.globalBackgroundImage];
    } else {
        [self.tabBar setBarTintColor:config.globalBackgroundColor];
    }
   
    
    NSMutableDictionary *attrDictNormal = @{}.mutableCopy;
    NSMutableDictionary *attrDictSeleted = @{}.mutableCopy;
    
    if (config.font) {
        [attrDictNormal setObject:config.font forKey:NSFontAttributeName];
        [attrDictSeleted setObject:config.font forKey:NSFontAttributeName];
    }
    
    if (config.titleColorNormal) {
        [attrDictNormal setObject:config.titleColorNormal forKey:NSForegroundColorAttributeName];
    }
    
    if (config.titleColorSelected) {
        [attrDictSeleted setObject:config.titleColorSelected forKey:NSForegroundColorAttributeName];
    }
    
    if (self.tabBar.items) {
        for (UITabBarItem *item in self.tabBar.items) {
            [item setTitleTextAttributes:attrDictNormal forState:UIControlStateNormal];
            [item setTitleTextAttributes:attrDictSeleted forState:UIControlStateSelected];
        }
    } else {
        [[UITabBarItem appearance] setTitleTextAttributes:attrDictNormal forState:UIControlStateNormal];
        [[UITabBarItem appearance] setTitleTextAttributes:attrDictSeleted forState:UIControlStateSelected];
    }

   
     self.tabBar.translucent = NO;
    
}

- (NXTabBarConfig *)config {
    if (_config == nil) {
        _config = [NXTabBarConfig defaultConfig];
    }
    return _config;
}

- (NavigationConfig *)navConfig {
    if (_navConfig == nil) {
        _navConfig = [NavigationConfig sharedInstance];
    }
    return _navConfig;
}

@end
