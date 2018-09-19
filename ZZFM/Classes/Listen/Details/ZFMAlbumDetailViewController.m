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

@interface ZFMAlbumDetailViewController ()

@property (nonatomic, strong) ZFMAlbumDetailRequest *detailRequest; // 详情的request
@property (nonatomic, strong) ZFMAlbumDetailRequest *trackListRequest; // 专辑里面的分集列表
@property (nonatomic, strong) ZFMAlbumDetailViewModel *viewModel;

@end

@implementation ZFMAlbumDetailViewController

- (ZFMAlbumDetailViewModel *)viewModel {
    if (_viewModel == nil) {
        _viewModel = [[ZFMAlbumDetailViewModel alloc] init];
    }
    return _viewModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [ZFMColorManager manager].colorMainPage;
    
    RACSignal *signalList = [self.viewModel requestAlbumTrackList:self.trackListRequest];
    RACSignal *signalDetail = [self.viewModel requestAlbumDetail:self.detailRequest];
    
    @weakify(self)
    [[RACSignal combineLatest:@[signalList,signalDetail]] subscribeNext:^(id x) {
        @strongify(self);
        NSLog(@"++++++---%@-----",x);
        
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
