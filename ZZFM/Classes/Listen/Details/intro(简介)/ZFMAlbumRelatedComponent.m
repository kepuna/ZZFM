//
//  ZFMAlbumRelatedComponent.m
//  ZZFM
//
//  Created by donews on 2018/9/21.
//  Copyright © 2018年 donews. All rights reserved.
//

#import "ZFMAlbumRelatedComponent.h"
#import "ZFMAlbumTrackListCell.h"

@implementation ZFMAlbumRelatedComponent

- (instancetype)init {
    if (self = [super init]) {
        self.height = 60;
        self.headerHeight = 0;
        self.footerHeight = 0;
    }
    return self;
}

- (void)prepareTableView {
    [super prepareTableView];
    
    [self.tableView registerClass:[ZFMAlbumTrackListCell class] forCellReuseIdentifier: [[ZFMAlbumTrackListCell class]description]];
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZFMAlbumTrackListCell *cell = [tableView dequeueReusableCellWithIdentifier:[[ZFMAlbumTrackListCell class]description] forIndexPath:indexPath];
    cell.textLabel.text = @"相关推荐";
    return cell;
}


@end
