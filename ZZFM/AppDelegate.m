//
//  AppDelegate.m
//  ZZFM
//
//  Created by donews on 2018/7/19.
//  Copyright © 2018年 donews. All rights reserved.
//

#import "AppDelegate.h"
#import "AppServiceModel.h"
#import "AppSwitchMode.h"
#import "ZFMMacro.h"

@interface AppDelegate ()

@property (nonatomic, strong) AppServiceModel *appServiceModel;
@property (nonatomic, strong) AppSwitchMode *switchMode;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self.appServiceModel invokeThisMethodInDidFinishLaunching];
    [self.appServiceModel invokeThisMethodCreateMainControllers];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [self.appServiceModel invokeThisMethodGetRootViewController];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;

}

- (AppSwitchMode *)switchMode {
    if (_switchMode == nil) {
        _switchMode = [[AppSwitchMode alloc] init];
    }
    return _switchMode;
}

- (AppServiceModel *)appServiceModel {
    if (_appServiceModel == nil) {
        _appServiceModel = [[AppServiceModel alloc] init];
    }
    return _appServiceModel;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    [self.switchMode removeNotificationSwitchModel];
}


@end
