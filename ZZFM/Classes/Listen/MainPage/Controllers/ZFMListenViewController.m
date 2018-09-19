//
//  ZFMListenViewController.m
//  ZZFM
//
//  Created by donews on 2018/7/19.
//  Copyright © 2018年 donews. All rights reserved.
//  

#import "ZFMListenViewController.h"
#import "ZFMPublic.h"
#import "DDComponent.h"
#import "ZFMListenRecommendListComponent.h"
#import "ZFMListenRecommendListModel.h"
#import "ZFMPublic.h"
#import "DNNetworkManager.h"
#import "ZFMListenListRequest.h"

@interface ZFMListenViewController ()

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, strong) DDCollectionViewRootComponent *rootComponent; // 组件root容器
@property (nonatomic, strong) ZFMListenRecommendListComponent *listComponent;
@property (nonatomic, strong) ZFMListenListRequest *listRequest;

@end

@implementation ZFMListenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [ZFMColorManager manager].colorMainPage;
    
    self.navigationController.title = @"我听";
    [self.view addSubview:self.collectionView];
    self.rootComponent.subComponents = @[self.listComponent];
    
//    self.listRequest.isLoger = YES;
    [self.listRequest requestData:^(BOOL isSuccess, ZFMResponseModel *responseModel, NSError *error) {
        if (!isSuccess || error) {
            return ;
        }
        
        ZFMListenRecommendListModel *listModel = [ZFMListenRecommendListModel yy_modelWithDictionary:responseModel.data];
        self.listComponent.recommendList = listModel.list;
        Foreground_Begin
        [self.collectionView reloadData];
        Foreground_End
    }];
}

#pragma mark - Getters & Setters
- (UICollectionView *)collectionView {
    if (_collectionView == nil) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.flowLayout];
        _collectionView.width = SCREEN_WIDTH;
        _collectionView.height = self.view.height - kNavH;
        _collectionView.left = self.view.left;
        _collectionView.top = self.view.top;
        _collectionView.backgroundColorSkinKey = DNColorMainPage;;
    }
    return _collectionView;
}

- (UICollectionViewFlowLayout *)flowLayout {
    if (_flowLayout == nil) {
        _flowLayout = [[UICollectionViewFlowLayout alloc] init];
    }
    return _flowLayout;
}

- (DDCollectionViewRootComponent *)rootComponent {
    if (_rootComponent == nil) {
        _rootComponent = [[DDCollectionViewRootComponent alloc] initWithCollectionView:self.collectionView bind:YES];
    }
    return _rootComponent;
}

- (ZFMListenRecommendListComponent *)listComponent {
    if (_listComponent == nil) {
        _listComponent = [[ZFMListenRecommendListComponent alloc] init];
    }
    return _listComponent;
}

- (ZFMListenListRequest *)listRequest {
    if (_listRequest == nil) {
        _listRequest = [[ZFMListenListRequest alloc] init];
        _listRequest.requestType = ZFMRequestTypeGET;
        _listRequest.requestUrl = @"http://mobile.ximalaya.com/feed/v1/recommend/classic/unlogin";
        _listRequest.pageId = 1;
        _listRequest.pageSize = 20;
        _listRequest.ts = @"1473389098.260717";
    }
    return _listRequest;
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
