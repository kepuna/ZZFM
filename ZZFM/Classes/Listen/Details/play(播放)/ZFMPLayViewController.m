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

@interface ZFMPLayViewController ()

@property (nonatomic, strong) ZFMPlayItemRequest *playItemRequest;
@property (nonatomic, strong) ZFMAlbumDetailViewModel *viewModel;

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
    
    self.view.backgroundColor = [UIColor greenColor];
    [self __configNavigationBar];
}

#pragma mark - Response Event
- (void)startPlayWithAlbumID:(NSString *)albumID trackID:(NSString *)trackID cachePath:(NSString *)cachePath {
    
    self.playItemRequest.albumId = albumID;
    self.playItemRequest.trackUid = trackID;
    self.playItemRequest.isLoger = YES;
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
