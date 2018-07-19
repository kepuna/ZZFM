//
//  UITabBar+badge.h
//  NCube
//
//  Created by 邢媛媛 on 17/5/31.
//  Copyright © 2017年 junjie.liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBar (badge)

- (void)showBadgeOnItemIndex:(NSInteger)index; //显示小红点
- (void)hideBadgeOnItemIndex:(NSInteger)index;  //隐藏小红点

@end
