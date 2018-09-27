//
//  ZFMAlbumDetailViewController.m
//  ZZFM
//
//  Created by donews on 2018/9/4.
//  Copyright © 2018年 donews. All rights reserved.
//

#import "ZFMAlbumDetailViewController.h"
#import "ZFMPublic.h"
#import "ZFMAlbumDetailRequest.h"
#import "ZFMAlbumDetailViewModel.h"
//#import "ZFMSettingViewController.h"
#import "ZZStyle2PageViewController.h"
#import "ZFMAlbumIntroViewController.h"
#import "ZFMAlbumTrackListViewController.h"
#import "ThirdViewController.h"
#import "FourViewController.h"
#import "ZFMAlbumHeaderView.h"

#import "ZFMAlbumHeaderFrameModel.h"
#import "ZFMAlbumDetailModel.h"


@interface ZFMAlbumDetailViewController ()

@property (nonatomic, strong) ZFMAlbumDetailRequest *detailRequest; // 详情的request
@property (nonatomic, strong) ZFMAlbumDetailRequest *trackListRequest; // 专辑里面的分集列表
@property (nonatomic, strong) ZFMAlbumDetailViewModel *viewModel;
@property (nonatomic, strong) ZFMAlbumHeaderView *headerView;

@property (nonatomic, strong) ZFMAlbumTrackListViewController *trackListVC; // 分集列表

@end

@implementation ZFMAlbumDetailViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (ZFMAlbumHeaderView *)headerView {
    if (_headerView == nil) {
        _headerView = [[ZFMAlbumHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 240)];
        _headerView.backgroundColor = [ZFMColorManager manager].colorMainPage;
     
    }
    return _headerView;
}

- (ZFMAlbumDetailViewModel *)viewModel {
    if (_viewModel == nil) {
        _viewModel = [[ZFMAlbumDetailViewModel alloc] init];
    }
    return _viewModel;
}

- (ZFMAlbumTrackListViewController *)trackListVC{
    if (_trackListVC == nil) {
        _trackListVC = [[ZFMAlbumTrackListViewController alloc] init];
    }
    return _trackListVC;
}

- (void)__setupChildControllers {
    
    NSArray *titles = @[@"简介",@"节目",@"找相似"];
    NSArray *controllers = @[[[ZFMAlbumIntroViewController alloc] init],self.trackListVC,[[ThirdViewController alloc] init],[[FourViewController alloc] init]];
    ZZStyle2PageViewController *controller = [[ZZStyle2PageViewController alloc] initWithItemTitles:titles controllers:controllers headerView:self.headerView];
    controller.navBackgroundColor = [ZFMColorManager manager].colorNavBackground;
    controller.navTitleHexColorString = @"FFFF00";
    [self.view addSubview:controller.view];
    [self addChildViewController:controller];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [ZFMColorManager manager].colorMainPage;
    self.title = @"详情页";
    [self __setupChildControllers];
    
    RACSignal *signalList = [self.viewModel requestAlbumTrackList:self.trackListRequest];
    RACSignal *signalDetail = [self.viewModel requestAlbumDetail:self.detailRequest];
    
    @weakify(self)
    [[RACSignal combineLatest:@[signalList,signalDetail]] subscribeNext:^(id x) {
        @strongify(self);
        ZFMAlbumDetailModel *model = [x objectAtIndexedSubscript:0];
        ZFMAlbumDetailModel *model1 = [x objectAtIndexedSubscript:1];
        ZFMAlbumHeaderFrameModel *frameModel = [[ZFMAlbumHeaderFrameModel alloc] initWithModel:model];
        Foreground_Begin
        [self.headerView setLayout:frameModel];
        self.trackListVC.trackList = self.viewModel.trackListFrameModels;
        Foreground_End
    } error:^(NSError *error) {
        
    }];
}


#pragma mark - Getters & Setters
- (ZFMAlbumDetailRequest *)detailRequest {
    if (_detailRequest == nil) {
        _detailRequest = [[ZFMAlbumDetailRequest alloc] init];
        _detailRequest.requestUrl = @"http://mobile.ximalaya.com/mobile/v1/album/detail";
        _detailRequest.requestType = ZFMRequestTypePOST;
        _detailRequest.albumId = self.albumId;
        _detailRequest.tab = @"订阅听";
        _detailRequest.statModule = @"推荐";
        _detailRequest.statPosition = 1;
    }
    return _detailRequest;
}

- (ZFMAlbumDetailRequest *)trackListRequest {
    if (_trackListRequest == nil) {
        _trackListRequest = [[ZFMAlbumDetailRequest alloc] init];
        _trackListRequest.requestUrl = @"http://mobile.ximalaya.com/mobile/v1/album";
        _trackListRequest.requestType = ZFMRequestTypePOST;
        _trackListRequest.albumId = self.albumId;
        _trackListRequest.tab = @"订阅听";
        _trackListRequest.statModule = @"推荐";
        _trackListRequest.statPosition = 1;
        _trackListRequest.trackId = self.trackId;
    }
    return _trackListRequest;
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
