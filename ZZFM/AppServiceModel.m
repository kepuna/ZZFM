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
    
   [[MainFrameworkAPI sharedInstance] addChildContollers:@[vc1,vc2,vc3,vc4] titles:@[@"首页",@"我听",@"发现",@"我的"] imagesNormal:@[@"tabbar_download_n",@"tabbar_find_n",@"tabbar_sound_n",@"tabbar_me_n"] imagesSeleted:@[@"tabbar_download_h",@"tabbar_find_h",@"tabbar_sound_h",@"tabbar_me_h"] inBundle:ZFMBundleMainFramework];
    
}

+ (UIViewController *)invokeThisMethodGetRootViewController {
    return [[MainFrameworkAPI sharedInstance] rootTabBarController];
}

@end
