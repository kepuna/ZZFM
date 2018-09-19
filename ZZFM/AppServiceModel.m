//
//  AppServiceModel.m
//  ZJDemo
//
//  Created by 邢媛媛 on 2018/6/26.
//  Copyright © 2018年 邢媛媛. All rights reserved.
//

#import "AppServiceModel.h"
#import "ZFMConsts.h"
#import "MainFrameworkAPI.h"
#import "ZFMHomeViewController.h"
#import "ZFMListenViewController.h"
#import "ZFMDiscoverViewController.h"
#import "ZFMMineViewController.h"
#import "ZFMPublic.h"
#import <DDSkin/DDSkinManager.h>
#import <DDSkin/UITabBar+DDSkin.h>
@implementation AppServiceModel

- (void)invokeThisMethodInDidFinishLaunching {
    
}

- (void)invokeThisMethodCreateMainControllers {
    
    ZFMHomeViewController *vc1 = [[ZFMHomeViewController alloc] init];
    vc1.title = @"首页";
    ZFMListenViewController *vc2 = [[ZFMListenViewController alloc] init];
    vc2.title = @"发现新资源";
    ZFMDiscoverViewController *vc3 = [[ZFMDiscoverViewController alloc] init];
    vc3.title = @"我听";
    ZFMMineViewController *vc4 = [[ZFMMineViewController alloc] init];
    vc4.title = @"更多";
    
    // 初始化子控制器
   [[MainFrameworkAPI sharedInstance] addChildContollers:@[vc1,vc2,vc3,vc4] titles:@[@"首页",@"发现",@"我的",@"更多"] imagesNormal:@[@"btnGnbHomeOff",@"btnGnbSearchOff",@"btnGnbHomeMyOff",@"btnGnbMoreOff"] imagesSeleted:@[@"btnGnbHomeOn",@"btnGnbSearchOn",@"btnGnbHomeMyOn",@"btnGnbMoreOn"] inBundle:ZFMResourceMain];
    
    // 更新abbar样式
    [[MainFrameworkAPI sharedInstance] updateTabBarWithConfig:^(NXTabBarConfig *config) {
        
        config.globalBackgroundColor = [ZFMColorManager manager].colorTabBarBackground;
        config.titleColorNormal = [ZFMColorManager manager].colorTabBarItemNormal;
        config.titleColorSelected = [ZFMColorManager manager].colorTabBarItemSeleted;
        config.font = [UIFont boldSystemFontOfSize:10];
    }];
    
    // 更新系统nav样式
    [[MainFrameworkAPI sharedInstance] updateNavWithConfig:^(NavigationConfig *config) {
        config.globalBackgroundColor = [ZFMColorManager manager].colorNavBackground;
        config.titleColor = [ZFMColorManager manager].colorNavTitle;
        config.titleFont = [UIFont boldSystemFontOfSize:18];
        config.backIcon = [UIImage zz_imageName:@"btnBackBold" inBundle:ZFMResourceMain];
    }];
    
}

- (UIViewController *)invokeThisMethodGetRootViewController {
    return [[MainFrameworkAPI sharedInstance] rootTabBarControllerAndCustomTabBar:nil];
}

@end
