//
//  MainFrameworkAPI.m
//  NCube
//
//  Created by kepuna on 2017/11/11.
//  Copyright © 2017年 junjie.liu. All rights reserved.
//

#import "MainFrameworkAPI.h"
#import "NXTabBarController.h"

@interface MainFrameworkAPI ()

@property (nonatomic, copy) NSArray *controllers;
@property (nonatomic, copy) NSArray *titles;
@property (nonatomic, copy) NSArray *imagesNormal;
@property (nonatomic, copy) NSArray *imagesSeleted;
@property (nonatomic, copy) NSString *bundle;
@property (nonatomic, copy) void (^configTabBarBlock)(NXTabBarConfig *config);
@property (nonatomic, copy) void (^configNavBarBlock)(NavigationConfig *config);
//@property (nonatomic, strong) NavigationConfig *config;
@property (nonatomic, strong) NXTabBarController *tabVC;

@end

@implementation MainFrameworkAPI

+ (instancetype)sharedInstance {
    static MainFrameworkAPI *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[MainFrameworkAPI alloc] init];
    });
    return _instance;
}

- (void)addChildContollers:(NSArray<UIViewController *> *)controllers titles:(NSArray<NSString *> *)titles imagesNormal:(NSArray<NSString *> *)imagesNormal imagesSeleted:(NSArray<NSString *> *)imagesSeleted {
    
    self.controllers = controllers;
    self.titles = titles;
    self.imagesNormal = imagesNormal;
    self.imagesSeleted = imagesSeleted;
}

- (void)addChildContollers:(NSArray<UIViewController *> *)controllers titles:(NSArray<NSString *> *)titles imagesNormal:(NSArray<NSString *> *)imagesNormal imagesSeleted:(NSArray<NSString *> *)imagesSeleted inBundle:(NSString *)bundle {
    [self addChildContollers:controllers titles:titles imagesNormal:imagesNormal imagesSeleted:imagesSeleted];
    self.bundle = bundle;
}

- (UITabBarController *)rootTabBarController {
    return [self rootTabBarControllerAndCustomTabBar:nil];
}


- (UITabBarController *)rootTabBarControllerAndCustomTabBar:(UITabBar *)customBar {
    NXTabBarController *tab = [[NXTabBarController alloc] initWithCustomTabBar:customBar];
    self.tabVC = tab;
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:self.bundle ofType:@"bundle"];
    
    if(bundlePath) {
        [tab addChildContollers:self.controllers titles:self.titles imagesNormal:self.imagesNormal imagesSeleted:self.imagesSeleted inBundle:self.bundle];
    } else {
        [tab addChildContollers:self.controllers titles:self.titles imagesNormal:self.imagesNormal imagesSeleted:self.imagesSeleted];
    }
    
    [tab updateWithConfig:self.configTabBarBlock];
    [tab updateNavBarWithConfig:self.configNavBarBlock];
    
    return tab;
}

- (void)updateTabBarWithConfig:(void (^)(NXTabBarConfig *))configBlock {
    if (configBlock) {
        self.configTabBarBlock = configBlock;
    }
}

- (void)updateTabBarWithConfigWhenSwitchMode:(void (^)(NXTabBarConfig *))configBlock {
    if (configBlock) {
         [self.tabVC updateWithConfig:configBlock];
    }
}

- (void)updateNavWithConfig:(void (^)(NavigationConfig *))configBlock {
    if (configBlock) {
        self.configNavBarBlock = configBlock;
    }
}

- (void)updateNavBarWithConfigWhenSwitchMode:(void (^)(NavigationConfig *))configBlock {
    if (configBlock) {
        [self.tabVC updateNavBarWithConfig:configBlock];
    }
}

@end
