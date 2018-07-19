//
//  NXNavigationController.h
//  NCube
//
//  Created by kepuna on 2016/11/27.
//  Copyright © 2016年 junjie.liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NXNavigationController : UINavigationController

/**
 * 添加不需要全屏手势的控制器
 */
- (void)addFullScreenPopBlackListItem:(UIViewController *)viewController;

/**
 从BlackList数组里移除全屏手势

 @param viewController vc
 */
- (void)removeFromFullScreenPopBlackList:(UIViewController *)viewController;

@end
