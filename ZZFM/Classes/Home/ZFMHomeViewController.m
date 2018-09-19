//
//  ZFMHomeViewController.m
//  ZZFM
//
//  Created by donews on 2018/7/19.
//  Copyright © 2018年 donews. All rights reserved.
//  

#import "ZFMHomeViewController.h"
#import "ZFMPublic.h"
// View
#import "DNPageScrollView.h"
#import "DNPageChannelStyle.h"

#import "ZFMHomeViewModel.h"

@interface ZFMHomeViewController () < DNPageScrollViewDelegate,UINavigationControllerDelegate,DNPageScrollViewChildViewControllerDelegate>

@property (nonatomic, strong) DNPageScrollView *pageScrollView;
@property (nonatomic, strong) DNPageChannelStyle *pageStyle;
@property (nonatomic, strong) ZFMHomeViewModel *viewModel;

@end

@implementation ZFMHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     [self.view addSubview:self.pageScrollView];
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
        _pageScrollView.contentView.backgroundColorSkinKey = DNColorMainPage;
        _pageScrollView.channelView.backgroundColorSkinKey = DNColorMainPage;
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
        _pageStyle.scrollLineColor = [ZFMColorManager manager].colorPageScrollSelected;
        _pageStyle.titleFont = [ZFMFontManager manager].size16PingFangSC_Medium;
        _pageStyle.titleBigScale = 1.3;
        _pageStyle.normalTitleColor = [ZFMColorManager manager].colorPageScrollNormal;
        _pageStyle.selectedTitleColor = [UIColor colorWithRed:9 / 255.0 green:165 / 255.0 blue:90 / 255.0 alpha:1]; //[ZFMColorManager manager].colorPageScrollSelected;
        _pageStyle.shadowCover = YES;
        _pageStyle.shadowCoverImageName = @"icon_pagescroll";
        _pageStyle.bottomLineHeight = 0.5;
        _pageStyle.bottomLineBackgroundColor = [ZFMColorManager manager].colorLine;
    }
    return _pageStyle;
}

- (ZFMHomeViewModel *)viewModel {
    if (_viewModel == nil) {
        _viewModel = [[ZFMHomeViewModel alloc] init];
    }
    return _viewModel;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
