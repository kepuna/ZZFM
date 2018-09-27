//
//  ZFMSettingViewController.h
//  ZZFM
//
//  Created by donews on 2018/9/13.
//  Copyright © 2018年 donews. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZFMSettingViewController : UIViewController

- (instancetype)initWithItemTitles:(NSArray <NSString *>*)titles controllers:(NSArray<UIViewController *> *)controllers headerView:(UIView *)headerView;

@end
