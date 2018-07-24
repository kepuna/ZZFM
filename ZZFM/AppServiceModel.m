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

@implementation AppServiceModel

+ (void)invokeThisMethodInDidFinishLaunching {
    
}

+ (void)invokeThisMethodCreateMainControllers {
    
    ZFMHomeViewController *vc1 = [[ZFMHomeViewController alloc] init];
    ZFMListenViewController *vc2 = [[ZFMListenViewController alloc] init];
    ZFMDiscoverViewController *vc3 = [[ZFMDiscoverViewController alloc] init];
    ZFMMineViewController *vc4 = [[ZFMMineViewController alloc] init];
    
   [[MainFrameworkAPI sharedInstance] addChildContollers:@[vc1,vc2,vc3,vc4] titles:nil imagesNormal:@[@"tabbar_icon_homepage_normal",@"tabbar_icon_hear_normal",@"tabbar_icon_find_normal",@"tabbar_icon_my_normal"] imagesSeleted:@[@"tabbar_icon_homepage_pressed",@"tabbar_icon_hear_pressed",@"tabbar_icon_find_pressed",@"tabbar_icon_my_pressed"] inBundle:ZFMBundleMainFramework];
    
}

+ (UIViewController *)invokeThisMethodGetRootViewController {
    return [[MainFrameworkAPI sharedInstance] rootTabBarController];
}

@end
