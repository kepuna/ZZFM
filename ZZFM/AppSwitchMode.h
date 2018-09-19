//
//  AppSwitchMode.h
//  ZZFM
//
//  Created by donews on 2018/9/12.
//  Copyright © 2018年 donews. All rights reserved.
//  切换App的黑白模式

#import <Foundation/Foundation.h>

FOUNDATION_EXTERN NSString * const DNNotificationSwitchMode; // 转换模式的通知
FOUNDATION_EXTERN NSString * const DNNotificationSwitchModeKey; // 传递的字典模式的key
FOUNDATION_EXTERN NSString * const DNNotificationSwitchModeValueDay; // 白天模式
FOUNDATION_EXTERN NSString * const DNNotificationSwitchModeValueNight; // 夜间模式

@interface AppSwitchMode : NSObject

/// 注册监听模式切换的通知
- (void)registerNotificationSwitchModel;
/// 移除模式切换的通知
- (void)removeNotificationSwitchModel;
/// 监听到通知
@property (nonatomic, copy) void (^addObserverNotificationBlock)(void);

@end
