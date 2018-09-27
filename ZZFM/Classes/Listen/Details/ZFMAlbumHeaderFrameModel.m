//
//  ZFMAlbumHeaderFrameModel.m
//  ZZFM
//
//  Created by donews on 2018/9/21.
//  Copyright © 2018年 donews. All rights reserved.
//

#import "ZFMAlbumHeaderFrameModel.h"
#import "ZFMAlbumHeaderView.h"
#import "ZFMPublic.h"
#import "ZFMAlbumDetailModel.h"

static CGFloat const pBottomBackViewH = 80;

@interface ZFMAlbumHeaderFrameModel()

@property (nonatomic, strong) ZFMAlbumDetailModel *anchorModel;

@end

@implementation ZFMAlbumHeaderFrameModel

- (instancetype)initWithModel:(ZFMAlbumDetailModel *)model {
    if (self == [super init]) {
        self.anchorModel = model;
    }
    return self;
}

- (void)layout:(ZFMAlbumHeaderView *)view {
    
    
    view.blurImageView.width = view.width;
    view.blurImageView.height = view.height - pBottomBackViewH;
    view.blurImageView.x = 0;
    view.blurImageView.y = 0;
    
    // 毛玻璃效果
    view.visualEffectView.width = view.blurImageView.width;
    view.visualEffectView.height = view.blurImageView.height;
    view.visualEffectView.x = view.blurImageView.x;
    view.visualEffectView.y = view.blurImageView.y;
    
    view.bottomBackView.width = view.blurImageView.width;
    view.bottomBackView.height = pBottomBackViewH;
    view.bottomBackView.top = view.blurImageView.bottom - 40;
    view.bottomBackView.left = view.blurImageView.left;
    view.bottomBackView.backgroundColor = [ZFMColorManager manager].colorMainPage;
    view.bottomBackView.layer.cornerRadius = 20;
    view.bottomBackView.layer.masksToBounds = YES;
    
    // 头像
    view.bgImageView.width = 120;
    view.bgImageView.height = 120;
    view.bgImageView.left = 20;
    view.bgImageView.top = 45;
    
     // 标题
    view.titleLabel.width = view.width - view.bgImageView.right - 30;
    view.titleLabel.height = view.titleLabel.font.lineHeight;
    view.titleLabel.left = view.bgImageView.right + 15;
    view.titleLabel.top = view.bgImageView.top + 20;
    
    // 主播名称
    view.anchorLabel.width = view.titleLabel.width;
    view.anchorLabel.height = view.anchorLabel.font.lineHeight;
    view.anchorLabel.left = view.titleLabel.left;
    view.anchorLabel.top = view.titleLabel.bottom + 10;
    
    view.cateLabel.width = view.titleLabel.width;
    view.cateLabel.height = view.cateLabel.font.lineHeight;
    view.cateLabel.left = view.titleLabel.left;
    view.cateLabel.top = view.anchorLabel.bottom + 10;
    
    view.updateDateLabel.width = view.cateLabel.width;
    view.updateDateLabel.height = view.updateDateLabel.font.lineHeight;
    view.updateDateLabel.left = view.cateLabel.left;
    view.updateDateLabel.top = view.cateLabel.bottom + 5;
    
    view.titleLabel.text = self.anchorModel.album.title;
    view.anchorLabel.text = self.anchorModel.album.nickname;
    view.cateLabel.text = self.anchorModel.album.categoryName;
    view.updateDateLabel.text = @"2018-02-21更新";
    
    [view.blurImageView dn_setImageWithURL:[NSURL URLWithString:self.anchorModel.album.coverSmall]];
    [view.bgImageView dn_setImageWithURL:[NSURL URLWithString:self.anchorModel.album.coverMiddle]];
//
//    view.coverImageView.width = 94;
//    view.coverImageView.height = 94;
//    view.coverImageView.center = view.bgImageView.center;
////    view.coverImageView.centerX = view.bgImageView.centerX;
////    view.coverImageView.centerY = view.bgImageView.centerY;

}


@end
