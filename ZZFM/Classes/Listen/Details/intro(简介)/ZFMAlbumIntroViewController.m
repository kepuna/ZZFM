//
//  ZFMAlbumIntroViewController.m
//  ZZFM
//
//  Created by donews on 2018/9/21.
//  Copyright © 2018年 donews. All rights reserved.
//  专辑简介

#import "ZFMAlbumIntroViewController.h"
#import "ZFMAlbumTrackListCell.h"
#import "DDTableViewSectionGroupComponent.h"
#import "ZFMAlbumIntroContentComponent.h"
#import "ZFMAlbumAnchorComponent.h"
#import "ZFMAlbumRelatedComponent.h"

@interface ZFMAlbumIntroViewController ()

@property (nonatomic, strong) DDTableViewRootComponent *rootComponent;
@property (nonatomic, strong) ZFMAlbumIntroContentComponent *introContentComponent; // 内容简介
@property (nonatomic, strong) ZFMAlbumAnchorComponent *anchorComponent; // 主播简介
@property (nonatomic, strong) ZFMAlbumRelatedComponent *relatedComponent; // 相关推荐

@end

@implementation ZFMAlbumIntroViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.rootComponent.subComponents = @[self.introContentComponent,self.anchorComponent, self.relatedComponent];
}

#pragma mark - Getters & Setters
- (DDTableViewRootComponent *)rootComponent {
    if (_rootComponent == nil) {
        _rootComponent = [[DDTableViewRootComponent alloc] initWithTableView:self.tableView bind:YES];
    }
    return _rootComponent;
}

- (ZFMAlbumIntroContentComponent *)introContentComponent {
    if (_introContentComponent == nil) {
        _introContentComponent = [[ZFMAlbumIntroContentComponent alloc] init];
    }
    return _introContentComponent;
}

- (ZFMAlbumAnchorComponent *)anchorComponent {
    if (_anchorComponent == nil) {
        _anchorComponent = [[ZFMAlbumAnchorComponent alloc] init];
    }
    return _anchorComponent;
}

- (ZFMAlbumRelatedComponent *)relatedComponent {
    if (_relatedComponent == nil) {
        _relatedComponent = [[ZFMAlbumRelatedComponent alloc] init];
    }
    return _relatedComponent;
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
