//
//  ZFMListenRecommendListCellFrameModel.m
//  ZZFM
//
//  Created by donews on 2018/9/3.
//  Copyright © 2018年 donews. All rights reserved.
//

#import "ZFMListenRecommendListCellFrameModel.h"
#import "ZFMListenRecommendListCell.h"
#import "ZFMPublic.h"
#import "ZFMListenRecommendListModel.h"

@interface ZFMListenRecommendListCellFrameModel()

@property (nonatomic, assign) CGFloat cacheHeight;
@property (nonatomic, strong) ZFMListenRecommendModel *model;

@end

@implementation ZFMListenRecommendListCellFrameModel

- (instancetype)initWithModel:(ZFMListenRecommendModel *)model {
    if (self == [super init]) {
//        self.cacheHeight =
        self.model = model;
    }
    return self;
}

- (void)layout:(ZFMListenRecommendListCell *)view {
    
    CGFloat marginLeft = 15;
    CGFloat margintTop = 10;
    
    view.coverImageView.width = 60;
    view.coverImageView.height = 60;
    view.coverImageView.left = marginLeft;
    view.coverImageView.top = margintTop;
    
    view.titleLabel.width = SCREEN_WIDTH - CGRectGetMaxX(view.coverImageView.frame) - margintTop - 2 * marginLeft ;
    view.titleLabel.height = view.titleLabel.font.pointSize;
    view.titleLabel.left = CGRectGetMaxX(view.coverImageView.frame) + margintTop;
    view.titleLabel.top = view.coverImageView.top;
    
    view.subTitleLabel.width = view.titleLabel.width;
    view.subTitleLabel.height = view.subTitleLabel.font.pointSize;
    view.subTitleLabel.top = view.titleLabel.bottom + 8;
    view.subTitleLabel.left = view.titleLabel.left;
    
    view.playTimesBtn.width = 60;
    view.playTimesBtn.height = view.playTimesBtn.titleLabel.font.pointSize;
    view.playTimesBtn.left = view.coverImageView.right + margintTop;
    view.playTimesBtn.top = view.subTitleLabel.bottom + 5;
    
    view.albumBtn.width = 60;
    view.albumBtn.height = view.playTimesBtn.height;
    view.albumBtn.left = view.playTimesBtn.right;
    view.albumBtn.top = view.playTimesBtn.top;
    
    
    view.titleLabel.text = self.model.title;
    view.subTitleLabel.text = self.model.trackTitle;
    [view.playTimesBtn setTitle:@"1.1万" forState:UIControlStateNormal];
    [view.albumBtn setTitle:@"11集" forState:UIControlStateNormal];
    [view.coverImageView dn_setImageWithURL:[NSURL URLWithString:self.model.coverMiddle]];
    
}

- (CGSize)size {
    return CGSizeMake(SCREEN_WIDTH, 100);
}

@end
