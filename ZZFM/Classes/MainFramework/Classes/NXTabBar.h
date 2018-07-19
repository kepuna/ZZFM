//
//  NXTabBar.h
//  NCube
//
//  Created by kepuna on 2016/11/27.
//  Copyright © 2016年 junjie.liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NXTabBar: UITabBar


/**
 设置tabbar中间按钮图片

 @param icon 图片
 */
- (void)setCenterIcon:(UIImage *)icon;

/**
 点击中间按钮执行block
 */
@property (nonatomic, copy) void(^centerIconClickBlock)();

@end

