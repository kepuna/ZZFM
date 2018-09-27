//
//  ZFMSettingViewController.m
//  ZZFM
//
//  Created by donews on 2018/9/13.
//  Copyright © 2018年 donews. All rights reserved.
//

#import "ZFMSettingViewController.h"
#import "ZFMPublic.h"
#import "ZZTableView.h"
#import "ZZHeaderView.h"
#import "SPPageMenu.h"
#import "ZZPageBaseViewController.h"

#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height
//#define HeaderViewH 200

@interface ZFMSettingViewController ()<SPPageMenuDelegate,UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIScrollView *childVCScrollView;
@property (nonatomic, assign) CGPoint lastPoint;
@property (nonatomic, assign) BOOL headerScrollViewScrolling;
@property (nonatomic, assign) BOOL other;

@property (nonatomic, strong) ZZTableView *tableView;
@property (nonatomic, strong) SPPageMenu *pageMenu;

@property (nonatomic, copy) NSArray *itemTitles;
@property (nonatomic, copy) NSArray *controllers;
@property (nonatomic, assign) CGFloat headerViewH;
@property (nonatomic, strong) UIView *headerView;

@end

@implementation ZFMSettingViewController

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (instancetype)initWithItemTitles:(NSArray<NSString *> *)titles controllers:(NSArray<UIViewController *> *)controllers headerView:(UIView *)headerView {
    if (self == [super init]) {
        self.itemTitles = titles;
        self.controllers = controllers;
        self.headerViewH = headerView.bounds.size.height;
        self.headerView = headerView;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    
    for (UIViewController *controller in self.controllers) {
        [self addChildViewController:controller];
    }
    
    // 先将第一个子控制的view添加到scrollView上去
    [self.scrollView addSubview:self.childViewControllers[0].view];
    // 添加头部视图
    self.tableView.tableHeaderView = self.headerView;
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        // 下拉刷新
        [self __downPullUpdateData];
    }];
    
    // 监听子控制器发出的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(s_subTableViewDidScroll:) name:@"SubTableViewDidScroll" object:nil];
    
}


#pragma mark - Response Event
// 下拉刷新
- (void)__downPullUpdateData {
    // 模拟网络请求，1秒后结束刷新
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView.mj_header endRefreshing];
    });
}

- (void)s_subTableViewDidScroll:(NSNotification *)noti {
    UIScrollView *scrollView = noti.object;
    self.childVCScrollView = scrollView;
    if (self.tableView.contentOffset.y < self.headerViewH) {
        scrollView.contentOffset = CGPointZero;
        scrollView.showsVerticalScrollIndicator = NO;
        
    } else {
        //        self.tableView.contentOffset = CGPointMake(0, HeaderViewH);
        scrollView.showsVerticalScrollIndicator = YES;
    }
}

- (void)btnAction:(UIButton *)sender {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"我很愉快地\n接受到了你的点击事件" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"退下吧" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertController addAction:action];
    [self presentViewController:alertController animated:YES completion:nil];
}

#pragma mark - tableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    // 添加分页菜单
    [cell.contentView addSubview:self.pageMenu];
    [cell.contentView addSubview:self.scrollView];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kScreenH;
}

#pragma mark - scrollView delegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (self.tableView == scrollView) {
        if ((self.childVCScrollView && _childVCScrollView.contentOffset.y > 0) || (scrollView.contentOffset.y > self.headerViewH)) {
            self.tableView.contentOffset = CGPointMake(0, self.headerViewH);
        }
        CGFloat offSetY = scrollView.contentOffset.y;
        
        if (offSetY < self.headerViewH) {
            // 发送通知
            [[NSNotificationCenter defaultCenter] postNotificationName:@"headerViewToTop" object:nil];
        }
    } else if (scrollView == self.scrollView) {
        
    }
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
}

#pragma mark - SPPageMenuDelegate
- (void)pageMenu:(SPPageMenu *)pageMenu itemSelectedFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex {
    if (!self.childViewControllers.count) { return;}
    // 如果上一次点击的button下标与当前点击的buton下标之差大于等于2,说明跨界面移动了,此时不动画.
    if (labs(toIndex - fromIndex) >= 2) {
        [self.scrollView setContentOffset:CGPointMake(_scrollView.frame.size.width * toIndex, 0) animated:NO];
    } else {
        [self.scrollView setContentOffset:CGPointMake(_scrollView.frame.size.width * toIndex, 0) animated:YES];
    }
    
    UIViewController *targetViewController = self.childViewControllers[toIndex];
    // 如果已经加载过，就不再加载
    if ([targetViewController isViewLoaded]) return;
    
    targetViewController.view.frame = CGRectMake(kScreenW*toIndex, 0, kScreenW, kScreenH-insert);
    UIScrollView *s = targetViewController.view.subviews[0];
    CGPoint contentOffset = s.contentOffset;
    if (contentOffset.y >= self.headerViewH) {
        contentOffset.y = self.headerViewH;
    }
    s.contentOffset = contentOffset;
    [self.scrollView addSubview:targetViewController.view];
}

#pragma mark - Getters & Setters
- (UIScrollView *)scrollView {
    
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.frame = CGRectMake(0, PageMenuH, kScreenW, kScreenH-insert);
        _scrollView.delegate = self;
        _scrollView.pagingEnabled = YES;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.contentSize = CGSizeMake(kScreenW*4, 0);
        _scrollView.backgroundColor = [UIColor colorWithWhite:1 alpha:0];
    }
    return _scrollView;
}

- (ZZTableView *)tableView {
    
    if (!_tableView) {
        _tableView = [[ZZTableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.showsVerticalScrollIndicator = NO;
        //_tableView.sectionHeaderHeight = PageMenuH;
    }
    return _tableView;
}

//- (ZZHeaderView *)headerView {
//
//    if (!_headerView) {
//        _headerView = [[ZZHeaderView alloc] init];
//        _headerView.frame = CGRectMake(0, 0, kScreenW, self.headerViewH);
//        _headerView.backgroundColor = [UIColor clearColor];
//        _headerView.layer.masksToBounds = NO;
//
//        UIView *contentView = [[UIView alloc] initWithFrame:_headerView.bounds];
//        contentView.backgroundColor = [UIColor greenColor];
//        [_headerView addSubview:contentView];
//
//        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//        btn.frame = CGRectMake(0, 0, 60, 30);
//        btn.center = CGPointMake(_headerView.center.x, _headerView.center.y);
//        btn.backgroundColor = [UIColor yellowColor];
//        [btn setTitle:@"点我" forState:UIControlStateNormal];
//        [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
//        [_headerView addSubview:btn];
//
//    }
//    return _headerView;
//}

- (SPPageMenu *)pageMenu {
    
    if (!_pageMenu) {
        _pageMenu = [SPPageMenu pageMenuWithFrame:CGRectMake(0, 0, kScreenW, PageMenuH) trackerStyle:SPPageMenuTrackerStyleLineAttachment];
        [_pageMenu setItems:self.itemTitles selectedItemIndex:0];
        _pageMenu.delegate = self;
        _pageMenu.itemTitleFont = [UIFont systemFontOfSize:16];
        _pageMenu.selectedItemTitleColor = [UIColor blackColor];
        _pageMenu.unSelectedItemTitleColor = [UIColor colorWithWhite:0 alpha:0.6];
        _pageMenu.tracker.backgroundColor = [UIColor orangeColor];
        _pageMenu.permutationWay = SPPageMenuPermutationWayNotScrollEqualWidths;
        _pageMenu.bridgeScrollView = self.scrollView;
    }
    return _pageMenu;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
