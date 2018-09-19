//
//  AppServiceModel.h
//  ZJDemo
//
//  Created by 邢媛媛 on 2018/6/26.
//  Copyright © 2018年 邢媛媛. All rights reserved.
//  提供APP 服务的类

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AppServiceModel : NSObject

/*!
 *  入口胶水函数：初始化入口函数
 *
 *  程序完成启动，在appdelegate中的 `-[AppDelegate didFinishLaunchingWithOptions:]`
 * 一开始的地方调用.
 */
- (void)invokeThisMethodInDidFinishLaunching;

- (void)invokeThisMethodCreateMainControllers;

- (UIViewController *)invokeThisMethodGetRootViewController;
/// 更新MainFramework 样式
- (void)invokeThisMethodUpdateMainFrameworkStyle;

@end
