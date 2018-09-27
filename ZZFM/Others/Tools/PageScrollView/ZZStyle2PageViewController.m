//
//  ZZStyle2PageViewController.m
//  ZZFM
//
//  Created by donews on 2018/9/25.
//  Copyright © 2018年 donews. All rights reserved.
//

#import "ZZStyle2PageViewController.h"
#import "ZZStyle2PageBaseViewController.h"
#import "UINavigationController+NavAlpha.h"
#import "ZZHeaderView.h"
#import "SPPageMenu.h"
#import "ZFMColorManager.h"

#import "ThirdViewController.h"
#import "FourViewController.h"
#import "ZFM5ViewController.h"

//#define kScrollViewBeginTopInset (kHeaderViewH+kPageMenuH)
//#define kHeaderViewH 240
#define kPageMenuH 40
#define kNaviH (isIPhoneX ? 84 : 64)

#define isIPhoneX kScreenH==812

#define bottomMargin (isIPhoneX ? 34 : 0)

@interface ZZStyle2PageViewController () <SPPageMenuDelegate,UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
//@property (nonatomic, strong) ZZHeaderView *headerView;
@property (nonatomic, strong) SPPageMenu *pageMenu;
@property (nonatomic, assign) CGFloat lastPageMenuY;
@property (nonatomic, assign) CGPoint lastPoint;

@property (nonatomic, copy) NSArray *itemTitles;
@property (nonatomic, copy) NSArray *controllers;
@property (nonatomic, assign) CGFloat headerViewH;
@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, assign) CGFloat scrollViewBeginTopInset;

@end

@implementation ZZStyle2PageViewController

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (instancetype)initWithItemTitles:(NSArray<NSString *> *)titles controllers:(NSArray<UIViewController *> *)controllers headerView:(UIView *)headerView {
    if (self == [super init]) {
        self.itemTitles = titles;
        self.controllers = controllers;
        
        self.headerViewH = headerView.bounds.size.height;
        self.headerView = headerView;
        self.scrollViewBeginTopInset = self.headerViewH + kPageMenuH;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (@available(iOS 11.0, *)) {
        self.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        // Fallback on earlier versions
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    self.navBarTintColor = self.navBackgroundColor;
    self.navAlpha = 0;
    self.navTitleColor = [UIColor clearColor];
    
    self.lastPageMenuY = self.headerViewH;
    
    [self.view addSubview:self.scrollView];// 添加一个全屏的scrollView
    [self.view addSubview:self.headerView];// 添加头部视图
    [self.view addSubview:self.pageMenu];// 添加分页菜单
    
    for (ZZStyle2PageBaseViewController *controller in self.controllers) {
         controller.scrollViewBeginTopInset = self.scrollViewBeginTopInset;
        [self addChildViewController:controller];
    }
    
    // 先将第一个子控制的view添加到scrollView上去
    [self.scrollView addSubview:self.childViewControllers[0].view];
    
    // 监听子控制器发出的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(subScrollViewDidScroll:) name:ChildScrollViewDidScrollNSNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshState:) name:ChildScrollViewRefreshStateNSNotification object:nil];
}

#pragma mark - 通知

// 子控制器上的scrollView已经滑动的代理方法所发出的通知(核心)
- (void)subScrollViewDidScroll:(NSNotification *)noti {

    // 取出当前正在滑动的tableView
    UIScrollView *scrollingScrollView = noti.userInfo[@"scrollingScrollView"];
    CGFloat offsetDifference = [noti.userInfo[@"offsetDifference"] floatValue];
    
    CGFloat distanceY;
    
    // 取出的scrollingScrollView并非是唯一的，当有多个子控制器上的scrollView同时滑动时都会发出通知来到这个方法，所以要过滤
    ZZStyle2PageBaseViewController *baseVc = self.childViewControllers[self.pageMenu.selectedItemIndex];
    if (scrollingScrollView == baseVc.scrollView && baseVc.isFirstViewLoaded == NO) {
        
        // 让分页菜单跟随scrollView滑动
        CGRect pageMenuFrame = self.pageMenu.frame;
        
        if (pageMenuFrame.origin.y >= kNaviH) {
            // 往上移
            if (offsetDifference > 0 && scrollingScrollView.contentOffset.y+self.scrollViewBeginTopInset > 0) {
                
                if (((scrollingScrollView.contentOffset.y+self.scrollViewBeginTopInset+self.pageMenu.frame.origin.y)>=self.headerViewH) || scrollingScrollView.contentOffset.y+self.scrollViewBeginTopInset < 0) {
                    // 分页菜单的y值等于当前正在滑动且显示在屏幕范围内的的scrollView的contentOffset.y的改变量(这是最难的点)
                    pageMenuFrame.origin.y += -offsetDifference;
                    if (pageMenuFrame.origin.y <= kNaviH) {
                        pageMenuFrame.origin.y = kNaviH;
                    }
                }
            } else { // 往下移
                if ((scrollingScrollView.contentOffset.y+self.scrollViewBeginTopInset+self.pageMenu.frame.origin.y)<self.headerViewH) {
                    pageMenuFrame.origin.y = -scrollingScrollView.contentOffset.y-self.scrollViewBeginTopInset+self.headerViewH;
                    if (pageMenuFrame.origin.y >= self.headerViewH) {
                        pageMenuFrame.origin.y = self.headerViewH;
                    }
                }
            }
        }
        self.pageMenu.frame = pageMenuFrame;
        
        CGRect headerFrame = self.headerView.frame;
        headerFrame.origin.y = self.pageMenu.frame.origin.y-self.headerViewH;
        self.headerView.frame = headerFrame;
        
        // 记录分页菜单的y值改变量
        distanceY = pageMenuFrame.origin.y - self.lastPageMenuY;
        self.lastPageMenuY = self.pageMenu.frame.origin.y;
        
        // 让其余控制器的scrollView跟随当前正在滑动的scrollView滑动
        [self followScrollingScrollView:scrollingScrollView distanceY:distanceY];
        
        [self changeColorWithOffsetY:-self.pageMenu.frame.origin.y+self.headerViewH];
    }
    baseVc.isFirstViewLoaded = NO;
}

- (void)followScrollingScrollView:(UIScrollView *)scrollingScrollView distanceY:(CGFloat)distanceY{
//    NSLog(@"##### %s ##### ",__func__);
    ZZStyle2PageBaseViewController *baseVc = nil;
    for (int i = 0; i < self.childViewControllers.count; i++) {
        baseVc = self.childViewControllers[i];
        if (baseVc.scrollView == scrollingScrollView) {
            continue;
        } else {
            CGPoint contentOffSet = baseVc.scrollView.contentOffset;
            contentOffSet.y += -distanceY;
            baseVc.scrollView.contentOffset = contentOffSet;
        }
    }
}

- (void)refreshState:(NSNotification *)noti {
    BOOL state = [noti.userInfo[@"isRefreshing"] boolValue];
    // 正在刷新时禁止self.scrollView滑动
    self.scrollView.scrollEnabled = !state;
}


#pragma mark - ScrollView Delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    NSLog(@"##### %s ##### ",__func__);
    ZZStyle2PageBaseViewController *baseVc = self.childViewControllers[self.pageMenu.selectedItemIndex];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (baseVc.scrollView.contentSize.height < kScreenH && [baseVc isViewLoaded]) {
            [baseVc.scrollView setContentOffset:CGPointMake(0, -self.scrollViewBeginTopInset) animated:YES];
        }
    });
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
//    NSLog(@"##### %s ##### ",__func__);
    ZZStyle2PageBaseViewController *baseVc = self.childViewControllers[self.pageMenu.selectedItemIndex];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (baseVc.scrollView.contentSize.height < kScreenH && [baseVc isViewLoaded]) {
            [baseVc.scrollView setContentOffset:CGPointMake(0, -self.scrollViewBeginTopInset) animated:YES];
        }
    });
}

#pragma mark - SPPageMenuDelegate
- (void)pageMenu:(SPPageMenu *)pageMenu itemSelectedFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex {
//    NSLog(@"##### %s ##### ",__func__);
    if (!self.childViewControllers.count) { return;}
    // 如果上一次点击的button下标与当前点击的buton下标之差大于等于2,说明跨界面移动了,此时不动画.
    if (labs(toIndex - fromIndex) >= 2) {
        [self.scrollView setContentOffset:CGPointMake(_scrollView.frame.size.width * toIndex, 0) animated:NO];
    } else {
        [self.scrollView setContentOffset:CGPointMake(_scrollView.frame.size.width * toIndex, 0) animated:YES];
    }
    
    ZZStyle2PageBaseViewController *targetViewController = self.childViewControllers[toIndex];
    // 如果已经加载过，就不再加载
    if ([targetViewController isViewLoaded]) return;
    
    // 来到这里必然是第一次加载控制器的view，这个属性是为了防止下面的偏移量的改变导致走scrollViewDidScroll
    targetViewController.isFirstViewLoaded = YES;
    
    targetViewController.view.frame = CGRectMake(kScreenW*toIndex, 0, kScreenW, kScreenH);
    UIScrollView *s = targetViewController.scrollView;
    CGPoint contentOffset = s.contentOffset;
    contentOffset.y = -self.headerView.frame.origin.y-self.scrollViewBeginTopInset;
    if (contentOffset.y + self.scrollViewBeginTopInset >= self.headerViewH) {
        contentOffset.y =self.headerViewH-self.scrollViewBeginTopInset;
    }
    s.contentOffset = contentOffset;
    [self.scrollView addSubview:targetViewController.view];
}


- (void)panGestureRecognizerAction:(UIPanGestureRecognizer *)pan {
    if (pan.state == UIGestureRecognizerStateBegan) {
        
    } else if (pan.state == UIGestureRecognizerStateChanged) {
        CGPoint currenrPoint = [pan translationInView:pan.view];
        CGFloat distanceY = currenrPoint.y - self.lastPoint.y;
        self.lastPoint = currenrPoint;
        
        ZZStyle2PageBaseViewController *baseVc = self.childViewControllers[self.pageMenu.selectedItemIndex];
        CGPoint offset = baseVc.scrollView.contentOffset;
        offset.y += -distanceY;
        if (offset.y <= -self.scrollViewBeginTopInset) {
            offset.y = -self.scrollViewBeginTopInset;
        }
        baseVc.scrollView.contentOffset = offset;
    } else {
        [pan setTranslation:CGPointZero inView:pan.view];
        self.lastPoint = CGPointZero;
    }
    
}

- (void)changeColorWithOffsetY:(CGFloat)offsetY {
    // 滑出20偏移时开始发生渐变,(kHeaderViewH - 20 - 64)决定渐变时间长度
    if (offsetY >= 0) {
        self.navigationController.navigationBar.hidden = NO;
        CGFloat alpha = (offsetY)/(self.headerViewH-64);
        // 该属性是设置导航栏背景渐变
        self.navAlpha = alpha;
        self.navTitleColor = [self _colorWithHexString:self.navTitleHexColorString alpha:alpha];
        
    } else {
        self.navAlpha = 0;
        
    }
}

#pragma mark - Private Methods
- (UIColor *)_colorWithHexString:(NSString *)hexString {
    
    NSString *colorString = [[hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    if (colorString.length < 6) {
        return [UIColor clearColor];
    }
    
    if ([colorString hasPrefix:@"0X"]) {
        colorString = [colorString substringFromIndex:2];
    }
    
    if ([colorString hasPrefix:@"#"]) {
        colorString = [colorString substringFromIndex:1];
    }
    
    if (colorString.length != 6) {
        return [UIColor clearColor];
    }
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    // r
    NSString *rString = [colorString substringWithRange:range];
    
    // g
    range.location = 2;
    NSString *gString = [colorString substringWithRange:range];
    
    // b
    range.location = 4;
    NSString *bString = [colorString substringWithRange:range];
    
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:(float)r / 255.0 green:(float)g / 255.0 blue:(float)b / 255.0 alpha:1.0];
}

- (UIColor *)_colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha{
    return [[self _colorWithHexString:hexString] colorWithAlphaComponent:alpha];
}

#pragma mark - Getters & Setters 
- (UIScrollView *)scrollView {
    
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.frame = CGRectMake(0, 0, kScreenW, kScreenH-bottomMargin);
        _scrollView.delegate = self;
        _scrollView.pagingEnabled = YES;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.contentSize = CGSizeMake(kScreenW*self.itemTitles.count, 0);
        _scrollView.backgroundColor = [UIColor colorWithWhite:1 alpha:0];
    }
    return _scrollView;
}

- (SPPageMenu *)pageMenu {
    
    if (!_pageMenu) {
        _pageMenu = [SPPageMenu pageMenuWithFrame:CGRectMake(0, CGRectGetMaxY(self.headerView.frame), kScreenW, kPageMenuH) trackerStyle:SPPageMenuTrackerStyleLineLongerThanItem];
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
