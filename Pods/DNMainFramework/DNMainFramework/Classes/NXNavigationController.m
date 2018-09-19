//
//  NXNavigationController.m
//  NCube
//
//  Created by kepuna on 2016/11/27.
//  Copyright © 2016年 junjie.liu. All rights reserved.
//

#import "NXNavigationController.h"
#import "NavigationConfig.h"

#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScale  ScreenWidth/375.0

@interface NXNavigationController ()<UIGestureRecognizerDelegate>

@property (nonatomic, strong) NSMutableArray *blackList;
@property (nonatomic, strong) NavigationConfig *config;

@end

@implementation NXNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self p_setNavWithConfig:self.config];
    self.blackList = @[].mutableCopy;
    id target = self.interactivePopGestureRecognizer.delegate;
    SEL handler = NSSelectorFromString(@"handleNavigationTransition:");
    // 获取添加系统边缘触发手势的View
    UIView *targetView = self.interactivePopGestureRecognizer.view;
    
    UIPanGestureRecognizer *fullScreenGes = [[UIPanGestureRecognizer alloc]initWithTarget:target action:handler];
    fullScreenGes.delegate = self;
    [targetView addGestureRecognizer:fullScreenGes];
    
    // 关闭边缘触发手势 防止和原有边缘手势冲突
    [self.interactivePopGestureRecognizer setEnabled:NO];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count) {
        viewController.hidesBottomBarWhenPushed = YES;
        self.interactivePopGestureRecognizer.delegate = nil; //设置后退的手势
        if (![NavigationConfig sharedInstance].backIcon) {
            NSAssert([NavigationConfig sharedInstance].backIcon, @"请设置返回icon");
        } else {
            UIBarButtonItem *back = [[UIBarButtonItem alloc]initWithImage:[NavigationConfig sharedInstance].backIcon style:UIBarButtonItemStylePlain target:self action:@selector(__backClickEvent)];
            viewController.navigationItem.leftBarButtonItem = back;
        }
    }else{
        viewController.hidesBottomBarWhenPushed = NO;
    }
    [super pushViewController:viewController animated:animated];
}

- (void)__backClickEvent{
    
    if (self.presentingViewController != nil){
        [self dismissViewControllerAnimated:NO completion:nil];
    } else{
        [self popViewControllerAnimated:YES];
    }
    
}

#pragma mark - public method
- (void)addFullScreenPopBlackListItem:(UIViewController *)viewController {
    if (!viewController) {
        return ;
    }
    [self.blackList addObject:viewController];
}

- (void)removeFromFullScreenPopBlackList:(UIViewController *)viewController {
    for (UIViewController *vc in self.blackList) {
        if (vc == viewController) {
            [self.blackList removeObject:vc];
        }
    }
}

#pragma mark - UIGestureRecognizerDelegate
//  防止导航控制器只有一个rootViewcontroller时触发手势
- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureRecognizer {
    // 根据具体控制器对象决定是否开启全屏右滑返回
    for (UIViewController *viewController in self.blackList) {
        if ([self topViewController] == viewController) {
            return NO;
        }
    }
    
    // 解决右滑和UITableView左滑删除的冲突
    CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view];
    if (translation.x <= 0) {
        return NO;
    }
    return self.childViewControllers.count == 1 ? NO : YES;
}

@end
