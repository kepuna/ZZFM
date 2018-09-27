//
//  ZZPageBaseViewController.h
//  ZZFM
//
//  Created by donews on 2018/9/20.
//  Copyright © 2018年 donews. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJRefresh.h"

#define PageMenuH 40
#define NaviH 64

#define isIPhoneX kScreenH==812
#define insert (isIPhoneX ? (84+34+PageMenuH) : 0)

@interface ZZPageBaseViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end
