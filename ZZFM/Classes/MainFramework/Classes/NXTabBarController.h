//
//  NXTabBarController.h
//  NCube
//
//  Created by kepuna on 2016/11/27.
//  Copyright © 2016年 junjie.liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NXTabBarConfig.h"

@interface NXTabBarController : UITabBarController

- (void)addChildContollers:(NSArray <UIViewController *> *)controllers titles:(NSArray <NSString *> *)titles imagesNormal:(NSArray <NSString *> *)imagesNormal imagesSeleted:(NSArray <NSString *> *)imagesSeleted;

- (void)addChildContollers:(NSArray <UIViewController *> *)controllers titles:(NSArray <NSString *> *)titles imagesNormal:(NSArray <NSString *> *)imagesNormal imagesSeleted:(NSArray <NSString *> *)imagesSeleted inBundle:(NSString *)bundle;

- (void)updateWithConfig: (void(^)(NXTabBarConfig *config))configBlock;

@end
