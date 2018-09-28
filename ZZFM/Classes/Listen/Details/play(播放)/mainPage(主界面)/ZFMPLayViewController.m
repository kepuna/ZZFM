//
//  ZFMPLayViewController.m
//  ZZFM
//
//  Created by donews on 2018/9/26.
//  Copyright © 2018年 donews. All rights reserved.
//

#import "ZFMPLayViewController.h"
#import "ZFMPublic.h"
#import "ZFMPlayItemRequest.h"
#import "ZFMAlbumDetailViewModel.h"
#import "ZFMPlayItemModel.h"
#import "ZFMAlbumDetailModel.h"
#import "DDComponent.h"
#import "ZFMPlayerComponent.h"
#import "ZFMPlayAlbumInforComponent.h"
#import "ZFMPlayRecommendComponent.h"
#import "ZFMPlayArchorInforComponent.h"
#import "ZFMPlayCommendComponent.h"

@interface ZFMPLayViewController ()

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, strong) ZFMPlayItemRequest *playItemRequest;
@property (nonatomic, strong) ZFMAlbumDetailViewModel *viewModel;
@property (nonatomic, strong) DDCollectionViewRootComponent *rootComponent; // 组件root容器
@property (nonatomic, strong) ZFMPlayerComponent *playerComponent; // 播放器组件
@property (nonatomic, strong) ZFMPlayAlbumInforComponent *albumInforComponent; // 专辑简介组件
@property (nonatomic, strong) ZFMPlayRecommendComponent *recommendComponent; // 相关推荐组件
@property (nonatomic, strong) ZFMPlayArchorInforComponent *archorInforComponent; // 作者简介组件
@property (nonatomic, strong) ZFMPlayCommendComponent *commendComponent; // 评论列表组件

@end

@implementation ZFMPLayViewController

+ (instancetype)sharedInstance {
    static ZFMPLayViewController *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[ZFMPLayViewController alloc] init];
    });
    return _instance;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [ZFMColorManager manager].colorMainPage;
    
    [self __configNavigationBar];
    [self.view addSubview:self.collectionView];
    self.rootComponent.subComponents = @[self.playerComponent, self.albumInforComponent, self.recommendComponent, self.archorInforComponent, self.commendComponent];

}

#pragma mark - Response Event
- (void)startPlayWithAlbumID:(NSString *)albumID trackID:(NSString *)trackID cachePath:(NSString *)cachePath {
    
    self.playItemRequest.albumId = albumID;
    self.playItemRequest.trackUid = trackID;
//    self.playItemRequest.isLoger = YES;
    
    [[self.viewModel requestPlayItemDetail:self.playItemRequest] subscribeNext:^(ZFMPlayItemModel *itemModel) {
        NSLog(@"-----%@",itemModel.commentInfo.list);
        
    } error:^(NSError *error) {
        
    }];
    
}

#pragma mark - private
- (void)__configNavigationBar {
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame = CGRectMake(0, 0, 44, 44);
    leftButton.imageEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    [leftButton addTarget:self action:@selector(s_backButtonClickEvent) forControlEvents:UIControlEventTouchUpInside];
    [leftButton setImage:[UIImage zz_imageName:@"playpage_icon_down_black_30x30_" inBundle:ZFMResourcePlayer] forState:UIControlStateNormal];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame = CGRectMake(0, 0, 44, 44);
    rightButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -20);
    [rightButton setImage:[UIImage zz_imageName:@"playpage_icon_share_black_30x30_" inBundle:ZFMResourcePlayer] forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
}

- (void)s_backButtonClickEvent {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Getters & Setters
#pragma mark - Getters & Setters
- (UICollectionView *)collectionView {
    if (_collectionView == nil) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.flowLayout];
        _collectionView.width = SCREEN_WIDTH;
        _collectionView.height = self.view.height;
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

- (ZFMPlayerComponent *)playerComponent {
    if (_playerComponent == nil) {
        _playerComponent = [[ZFMPlayerComponent alloc] init];
    }
    return _playerComponent;
}

- (ZFMPlayAlbumInforComponent *)albumInforComponent {
    if (_albumInforComponent == nil) {
        _albumInforComponent = [[ZFMPlayAlbumInforComponent alloc] init];
    }
    return _albumInforComponent;
}

- (ZFMPlayRecommendComponent *)recommendComponent {
    if (_recommendComponent == nil) {
        _recommendComponent = [[ZFMPlayRecommendComponent alloc] init];
    }
    return _recommendComponent;
}

- (ZFMPlayArchorInforComponent *)archorInforComponent {
    if (_archorInforComponent == nil) {
        _archorInforComponent = [[ZFMPlayArchorInforComponent alloc] init];
    }
    return _archorInforComponent;
}

- (ZFMPlayCommendComponent *)commendComponent {
    if (_commendComponent == nil) {
        _commendComponent = [[ZFMPlayCommendComponent alloc] init];
    }
    return _commendComponent;
}

- (ZFMPlayItemRequest *)playItemRequest {
    if (_playItemRequest == nil) {
        _playItemRequest = [[ZFMPlayItemRequest alloc] init];
    }
    return _playItemRequest;
}

- (ZFMAlbumDetailViewModel *)viewModel {
    if (_viewModel == nil) {
        _viewModel = [[ZFMAlbumDetailViewModel alloc] init];
    }
    return _viewModel;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    NSLog(@"-------XXXX-------");
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
