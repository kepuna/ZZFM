//
//  ZZStyle2PageBaseViewController.h
//  ZZFM
//
//  Created by donews on 2018/9/25.
//  Copyright © 2018年 donews. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height

#define isIPhoneX kScreenH==812
#define bottomMargin (isIPhoneX ? 34 : 0)

UIKIT_EXTERN NSNotificationName const ChildScrollViewDidScrollNSNotification;
UIKIT_EXTERN NSNotificationName const ChildScrollViewRefreshStateNSNotification;

@interface ZZStyle2PageBaseViewController : UIViewController

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, assign) CGPoint lastContentOffset;
@property (nonatomic, assign) BOOL isFirstViewLoaded;
@property (nonatomic, assign) BOOL refreshState;
@property (nonatomic, assign) CGFloat scrollViewBeginTopInset;

@end
