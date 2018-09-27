//
//  ZFMMineViewController.m
//  ZZFM
//
//  Created by donews on 2018/7/19.
//  Copyright © 2018年 donews. All rights reserved.
//  我的 控制器

#import "ZFMMineViewController.h"
#import "ZFMPublic.h"
#import "AppSwitchMode.h"
#import <DDSkin/UIButton+DDSkin.h>
#import "ZFMSettingViewController.h"
#import "ZZStyle2PageViewController.h"

#import "ZFM5ViewController.h"
#import "ThirdViewController.h"
#import "FourViewController.h"

@interface ZFMMineViewController ()

@property (nonatomic, assign) BOOL isNight;
@property (nonatomic, strong) UIButton *testButton;

@end

@implementation ZFMMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.alpha = 1;
    [self.view addSubview:self.testButton];
    self.testButton.frame = CGRectMake(100, 100, 60, 40);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    self.isNight = !self.isNight;
    
    NSString *value = self.isNight ? DNNotificationSwitchModeValueNight : DNNotificationSwitchModeValueDay;
    [[NSNotificationCenter defaultCenter] postNotificationName:DNNotificationSwitchMode object:nil userInfo:@{DNNotificationSwitchModeKey:value}];
}

- (void)s_buttonClickEvent {
    
    
    NSArray *titles = @[@"简介",@"节目",@"找相似"];
    NSArray *controllers = @[[[ZFM5ViewController alloc] init],[[ZFM5ViewController alloc] init],[[ZFM5ViewController alloc] init],[[ZFM5ViewController alloc] init]];
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 200)];
    headerView.backgroundColor = [UIColor yellowColor];
    ZZStyle2PageViewController *vc = [[ZZStyle2PageViewController alloc] initWithItemTitles:titles controllers:controllers headerView:headerView];
    [self.navigationController pushViewController:vc animated:YES];
}

- (UIButton *)testButton {
    if (_testButton == nil) {
        _testButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_testButton setTitle:@"跳转" forState:UIControlStateNormal];
        _testButton.backgroundColor = [UIColor greenColor];
        [_testButton addTarget:self action:@selector(s_buttonClickEvent) forControlEvents:UIControlEventTouchUpInside];
    }
    return _testButton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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
