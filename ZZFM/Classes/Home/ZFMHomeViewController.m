//
//  ZFMHomeViewController.m
//  ZZFM
//
//  Created by donews on 2018/7/19.
//  Copyright © 2018年 donews. All rights reserved.
//  

#import "ZFMHomeViewController.h"
#import "ZFMHomeAPIManager.h"
#import "ZFMHotGuessAPIManager.h"
#import "ZFMPublic.h"
// View
#import "DNPageScrollView.h"
#import "DNPageChannelStyle.h"

#import "ZFMHomeViewModel.h"

@interface ZFMHomeViewController () <CTAPIManagerCallBackDelegate, DNPageScrollViewDelegate,UINavigationControllerDelegate,DNPageScrollViewChildViewControllerDelegate>

@property (nonatomic, strong) UIButton *startRequestButton;
@property (nonatomic, strong) ZFMHomeAPIManager *homeAPIManager;
@property (nonatomic, strong) ZFMHotGuessAPIManager *hotAPIManager;

@property (nonatomic, strong) DNPageScrollView *pageScrollView;
@property (nonatomic, strong) DNPageChannelStyle *pageStyle;
@property (nonatomic, strong) ZFMHomeViewModel *viewModel;

@end

@implementation ZFMHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.startRequestButton.center = self.view.center;
//    [self.startRequestButton sizeToFit];
//    [self.view addSubview:self.startRequestButton];
    
     [self.view addSubview:self.pageScrollView];
}


- (void)didTappedStartButton:(UIButton *)sender {
//    [self.homeAPIManager loadData];
    [self.hotAPIManager loadData];
}

#pragma mark - CTAPIManagerCallBackDelegate
- (void)managerCallAPIDidSuccess:(CTAPIBaseManager *)manager
{
    NSLog(@"SSS%@", [manager fetchDataWithReformer:nil]);
}

- (void)managerCallAPIDidFailed:(CTAPIBaseManager *)manager
{
    NSLog(@"EEEE%@", [manager fetchDataWithReformer:nil]);
}

#pragma mark - DNPageScrollViewDelegate
- (NSInteger)numberOfChildViewControllers {
    return self.viewModel.scrollTitles.count;
}

- (UIViewController<DNPageScrollViewChildViewControllerDelegate> *)childViewController:(UIViewController<DNPageScrollViewChildViewControllerDelegate> *)reuseViewController forIndex:(NSInteger)index {
    
    if(index == NSNotFound || index > self.viewModel.childControllers.count - 1) {
        return nil;
    }
    return self.viewModel.childControllers[index];
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods {
    return NO;
}

#pragma mark - Getters & Setters
- (DNPageScrollView *)pageScrollView {
    if (_pageScrollView == nil) {
        _pageScrollView = [[DNPageScrollView alloc] initWithFrame:CGRectMake(0, kNavH, SCREEN_WIDTH, SCREEN_HEIGHT) style:self.pageStyle channelNames:self.viewModel.scrollTitles parentViewController:self delegate:self];
        _pageScrollView.contentView.backgroundColor = [UIColor whiteColor];
        _pageScrollView.channelView.backgroundColor = [UIColor whiteColor];
    }
    return _pageScrollView;
}

- (DNPageChannelStyle *)pageStyle {
    if (_pageStyle == nil) {
        _pageStyle = [DNPageChannelStyle new];
        _pageStyle.showLine = YES;
        _pageStyle.scrollLineHeight = kHPercentage(3);
        _pageStyle.scrollLineWidth = kHPercentage(15);
        _pageStyle.scrollLinecornerRadius = kHPercentage(1.5);
        _pageStyle.titleMargin = kHPercentage(30);
        _pageStyle.scrollLineColor = [UIColor orangeColor];
        _pageStyle.titleFont = [ZFMFontManager manager].size16PingFangSC_Medium;
        _pageStyle.titleBigScale = 1.3;
        _pageStyle.normalTitleColor = [ZFMColorManager manager].colorPageScrollNormal;
        _pageStyle.selectedTitleColor = [ZFMColorManager manager].colorPageScrollSelected;
        _pageStyle.shadowCover = YES;
        _pageStyle.shadowCoverImageName = @"icon_pagescroll";
    }
    return _pageStyle;
}

- (ZFMHomeViewModel *)viewModel {
    if (_viewModel == nil) {
        _viewModel = [[ZFMHomeViewModel alloc] init];
    }
    return _viewModel;
}

- (ZFMHomeAPIManager *)homeAPIManager {
    if (_homeAPIManager == nil) {
        _homeAPIManager = [[ZFMHomeAPIManager alloc] init];
        _homeAPIManager.delegate = self;
    }
    return _homeAPIManager;
}

- (ZFMHotGuessAPIManager *)hotAPIManager {
    if (_hotAPIManager == nil) {
        _hotAPIManager = [[ZFMHotGuessAPIManager alloc] init];
        _hotAPIManager.delegate = self;
    }
    return _hotAPIManager;
}

- (UIButton *)startRequestButton {
    if (_startRequestButton == nil) {
        _startRequestButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_startRequestButton setTitle:@"send request" forState:UIControlStateNormal];
        [_startRequestButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_startRequestButton addTarget:self action:@selector(didTappedStartButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _startRequestButton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
