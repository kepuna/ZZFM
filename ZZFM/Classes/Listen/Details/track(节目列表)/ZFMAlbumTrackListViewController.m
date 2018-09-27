//
//  ZFMAlbumTrackListViewController.m
//  ZZFM
//
//  Created by donews on 2018/9/21.
//  Copyright © 2018年 donews. All rights reserved.
//

#import "ZFMAlbumTrackListViewController.h"
#import "DDTableViewSectionGroupComponent.h"
#import "ZFMAlbumTrackListComponent.h"
#import "ZFMPublic.h"

@interface ZFMAlbumTrackListViewController ()

@property (nonatomic, strong) DDTableViewRootComponent *rootComponent;
@property (nonatomic, strong) ZFMAlbumTrackListComponent *trackListComponent;

@end

@implementation ZFMAlbumTrackListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.rootComponent.subComponents = @[self.trackListComponent];
    RAC(self.trackListComponent,trackList) = RACObserve(self, trackList);

}

#pragma mark - Getters & Setters 
- (DDTableViewRootComponent *)rootComponent {
    if (_rootComponent == nil) {
        _rootComponent = [[DDTableViewRootComponent alloc] initWithTableView:self.tableView bind:YES];
    }
    return _rootComponent;
}

- (ZFMAlbumTrackListComponent *)trackListComponent {
    if (_trackListComponent == nil) {
        _trackListComponent = [[ZFMAlbumTrackListComponent alloc] init];
    }
    return _trackListComponent;
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
