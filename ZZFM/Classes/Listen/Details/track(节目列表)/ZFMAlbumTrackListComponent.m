//
//  ZFMAlbumTrackListComponent.m
//  ZZFM
//
//  Created by donews on 2018/9/21.
//  Copyright © 2018年 donews. All rights reserved.
//

#import "ZFMAlbumTrackListComponent.h"
#import "ZFMAlbumTrackListCell.h"
#import "ZFMAlbumTrackListCellFrameModel.h"
#import "ZFMAlbumDetailModel.h"
#import "ZFMPublic.h"
#import "ZFMPLayViewController.h"

@implementation ZFMAlbumTrackListComponent

- (instancetype)init {
    if (self = [super init]) {
//        self.height = 80;
        self.headerHeight = 0;
        self.footerHeight = 0;
    }
    return self;
}

- (void)prepareTableView {
    [super prepareTableView];
    
    [self.tableView registerClass:[ZFMAlbumTrackListCell class] forCellReuseIdentifier: [[ZFMAlbumTrackListCell class]description]];
    self.tableView.tableFooterView = [UIView new];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.trackList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZFMAlbumTrackListCell *cell = [tableView dequeueReusableCellWithIdentifier:[[ZFMAlbumTrackListCell class]description] forIndexPath:indexPath];
    ZFMAlbumTrackListCellFrameModel *frameModel = [self.trackList zz_objectOrNilAtIndex:indexPath.row];
    [cell setLayout:frameModel];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
   ZFMAlbumTrackListCellFrameModel *frameModel = [self.trackList zz_objectOrNilAtIndex:indexPath.row];
   return frameModel.totalHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ZFMPLayViewController *playVC = [ZFMPLayViewController sharedInstance];
    ZFMAlbumTrackListCellFrameModel *frameModel = [self.trackList zz_objectOrNilAtIndex:indexPath.row];
    [playVC startPlayWithAlbumID:frameModel.model.albumId trackID:frameModel.model.trackId cachePath:nil];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:playVC];
    [self zz_presentViewController:nav animated:YES completion:nil];
}

@end
