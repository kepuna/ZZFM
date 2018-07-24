//
//  ZFMHomeViewController.m
//  ZZFM
//
//  Created by donews on 2018/7/19.
//  Copyright © 2018年 donews. All rights reserved.
//  

#import "ZFMHomeViewController.h"
#import "ZFMHomeAPIManager.h"

@interface ZFMHomeViewController () <CTAPIManagerCallBackDelegate>

@property (nonatomic, strong) UIButton *startRequestButton;
@property (nonatomic, strong) ZFMHomeAPIManager *homeAPIManager;

@end

@implementation ZFMHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.startRequestButton.center = self.view.center;
    [self.startRequestButton sizeToFit];
    [self.view addSubview:self.startRequestButton];
}


- (void)didTappedStartButton:(UIButton *)sender {
    [self.homeAPIManager loadData];
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
- (ZFMHomeAPIManager *)homeAPIManager
{
    if (_homeAPIManager == nil) {
        _homeAPIManager = [[ZFMHomeAPIManager alloc] init];
        _homeAPIManager.delegate = self;
    }
    return _homeAPIManager;
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
