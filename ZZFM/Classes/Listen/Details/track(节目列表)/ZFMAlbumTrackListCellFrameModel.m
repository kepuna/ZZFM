//
//  ZFMAlbumTrackListCellFrameModel.m
//  ZZFM
//
//  Created by donews on 2018/9/25.
//  Copyright © 2018年 donews. All rights reserved.
//

#import "ZFMAlbumTrackListCellFrameModel.h"
#import "ZFMAlbumTrackListCell.h"
#import "ZFMPublic.h"
#import "ZFMAlbumDetailModel.h"

@interface ZFMAlbumTrackListCellFrameModel()

@property (nonatomic, assign) CGFloat cacheHeight;

@end

@implementation ZFMAlbumTrackListCellFrameModel

- (instancetype)initWithModel:(ZFMAlbumRecsItemModel *)model {
    if (self == [super init]) {
        self.model = model;
    }
    return self;
}

- (void)layout:(ZFMAlbumTrackListCell *)view {

    CGFloat marginTop = 10;
    CGFloat marginLeft = 15;
    view.orderLabel.width = 40;
    view.orderLabel.height = 20;
    view.orderLabel.left = 15;
    view.orderLabel.top = marginTop * 2;
    
    view.titleLabel.width = kWPercentage(220);
    CGFloat height = [self.model.title zz_heightWithFont:view.titleLabel.font width:view.titleLabel.width];
    view.titleLabel.height = height;
    view.titleLabel.left = view.orderLabel.right + marginLeft * 0.6;
    view.titleLabel.top = view.contentView.top + marginTop;
    
    CGFloat iconWH = 15;
    view.playCountsButton.height = view.playCountsButton.titleLabel.font.lineHeight;
    CGFloat playCountsW = [self.model.playtimes zz_widthWith:view.playCountsButton.titleLabel.font height:view.playCountsButton.height];
    view.playCountsButton.width = playCountsW + iconWH;
    view.playCountsButton.left = view.titleLabel.left;
    view.playCountsButton.top = view.titleLabel.bottom + marginTop;
    

    view.commentCountButton.height = view.commentCountButton.titleLabel.font.lineHeight;
    CGFloat commentCountW = [self.model.comments zz_widthWith:view.commentCountButton.titleLabel.font  height:view.commentCountButton.height];
    view.commentCountButton.width = commentCountW + iconWH;
    view.commentCountButton.left = view.playCountsButton.right + iconWH;
    view.commentCountButton.centerY = view.playCountsButton.centerY;

    
    view.playDurationButton.height = view.playDurationButton.titleLabel.font.lineHeight;
     CGFloat playDurationW = [self.model.duration zz_widthWith:view.playDurationButton.titleLabel.font  height:view.playDurationButton.height];
     view.playDurationButton.width = playDurationW + iconWH;
    view.playDurationButton.left = view.commentCountButton.right + iconWH;
    view.playDurationButton.centerY = view.commentCountButton.centerY;
    
    view.releaseAtLabel.width = 60;
    view.releaseAtLabel.height = view.releaseAtLabel.font.lineHeight;
    view.releaseAtLabel.right = view.contentView.right - marginLeft;
    view.releaseAtLabel.top = view.titleLabel.top;
    
    view.downloadButton.width = 30;
    view.downloadButton.height = 30;
    view.downloadButton.right = view.contentView.right - marginLeft;
    view.downloadButton.top = view.playDurationButton.top - 5;
    
    view.orderLabel.text = self.model.orderNo;
    view.titleLabel.text = self.model.title;
    view.releaseAtLabel.text = self.model.createdAt;
    [view.playCountsButton setTitle:self.model.playtimes forState:UIControlStateNormal];
    [view.commentCountButton setTitle:self.model.comments forState:UIControlStateNormal];
    [view.playDurationButton setTitle:self.model.duration forState:UIControlStateNormal];
    
    self.cacheHeight = CGRectGetMaxY(view.downloadButton.frame) + 2;

}

- (CGFloat)totalHeight {
    return self.cacheHeight;
}

@end
