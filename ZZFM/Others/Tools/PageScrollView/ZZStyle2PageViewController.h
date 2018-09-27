//
//  ZZStyle2PageViewController.h
//  ZZFM
//
//  Created by donews on 2018/9/25.
//  Copyright © 2018年 donews. All rights reserved.
//

#import <UIKit/UIKit.h>

UIKIT_EXTERN NSNotificationName const ChildScrollViewDidScrollNSNotification;
UIKIT_EXTERN NSNotificationName const ChildScrollViewRefreshStateNSNotification;

@interface ZZStyle2PageViewController : UIViewController

/// 导航标题文字颜色十六进制字符串
@property (nonatomic, copy) NSString *navTitleHexColorString;
@property (nonatomic, strong) UIColor *navBackgroundColor;

- (instancetype)initWithItemTitles:(NSArray <NSString *>*)titles controllers:(NSArray<UIViewController *> *)controllers headerView:(UIView *)headerView;


@end
