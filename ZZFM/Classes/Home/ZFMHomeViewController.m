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

@interface ZFMHomeViewController () <CTAPIManagerCallBackDelegate>

@property (nonatomic, strong) UIButton *startRequestButton;
@property (nonatomic, strong) ZFMHomeAPIManager *homeAPIManager;
@property (nonatomic, strong) ZFMHotGuessAPIManager *hotAPIManager;

@end

@implementation ZFMHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.startRequestButton.center = self.view.center;
    [self.startRequestButton sizeToFit];
    [self.view addSubview:self.startRequestButton];
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

#pragma mark - Getters & Setters
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
