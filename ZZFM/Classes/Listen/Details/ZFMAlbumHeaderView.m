//
//  ZFMAlbumHeaderView.m
//  ZZFM
//
//  Created by donews on 2018/9/21.
//  Copyright © 2018年 donews. All rights reserved.
//

#import "ZFMAlbumHeaderView.h"
#import "ZFMPublic.h"

@implementation ZFMAlbumHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.blurImageView];
        [self.blurImageView addSubview:self.visualEffectView];
         [self insertSubview:self.blurImageView belowSubview:self];
        [self addSubview:self.bottomBackView];
        [self addSubview:self.bgImageView];
        [self.bgImageView addSubview:self.coverImageView];
        [self addSubview:self.cateLabel];
        [self addSubview:self.playCountsLabel];
        [self addSubview:self.anchorLabel];
        [self addSubview:self.titleLabel];
        [self addSubview:self.updateDateLabel];
        

    }
    return self;
}

#pragma mark - Getters & Setters
- (UIView *)bottomBackView {
    if (_bottomBackView == nil) {
        _bottomBackView = [[UIView alloc] init];
        _bottomBackView.backgroundColor = [ZFMColorManager manager].colorMainPage;
    }
    return _bottomBackView;
}
- (UIVisualEffectView *)visualEffectView {
    if (_visualEffectView == nil) {
         UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:(UIBlurEffectStyleLight)] ;
        _visualEffectView = [[UIVisualEffectView alloc] initWithEffect:(blurEffect)];
    }
    return _visualEffectView;
}

- (UIImageView *)blurImageView {
    if (_blurImageView == nil) {
        _blurImageView = [[UIImageView alloc] init];
    }
    return _blurImageView;
}

//相册封面
- (UIImageView *)coverImageView {
    if(!_coverImageView) {
        _coverImageView= [[UIImageView alloc] init];
        _coverImageView.backgroundColor = [ZFMColorManager manager].colorPlaceholder;
    }
    return _coverImageView;
}

//封面背景
- (UIImageView *)bgImageView {
    if(!_bgImageView) {
        _bgImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"album_cover_bg"]];
        _bgImageView.backgroundColor = [ZFMColorManager manager].colorPlaceholder;
    }
    return _bgImageView;
}

//类别标签
- (YYLabel *)cateLabel {
    if(!_cateLabel) {
        _cateLabel = [YYLabel new];
        _cateLabel.textAlignment = NSTextAlignmentLeft;
        _cateLabel.font = [ZFMFontManager manager].size11PingFangSC_Medium;
        _cateLabel.textColor = [ZFMColorManager manager].colorGray96;
    }
    return _cateLabel;
}

//播放量标签
- (YYLabel *)playCountsLabel {
    if(!_playCountsLabel) {
        _playCountsLabel = [[YYLabel alloc] init];
        _playCountsLabel.font = [UIFont systemFontOfSize:12];
        _playCountsLabel.textColor = [UIColor colorWithRed:0.58f green:0.59f blue:0.59f alpha:1.00f];
        _playCountsLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _playCountsLabel;
}

//主播标签
- (YYLabel *)anchorLabel {
    if(!_anchorLabel) {
        _anchorLabel = [YYLabel new];
        _anchorLabel.textAlignment = NSTextAlignmentLeft;
        _anchorLabel.font = [ZFMFontManager manager].size12PingFangSC_Regular;
        _anchorLabel.textColor = [ZFMColorManager manager].colorWhite;
        _anchorLabel.userInteractionEnabled = YES;
    }
    return _anchorLabel;
}

//标题标签
- (YYLabel *)titleLabel {
    if(!_titleLabel) {
        _titleLabel = [[YYLabel alloc] init];
        _titleLabel.textColor = [ZFMColorManager manager].colorWhite;
        _titleLabel.font = [ZFMFontManager manager].size16PingFangSC_Medium;
        _titleLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _titleLabel;
}

- (YYLabel *)updateDateLabel {
    if (_updateDateLabel == nil) {
        _updateDateLabel = [[YYLabel alloc] init];
        _updateDateLabel.font = [ZFMFontManager manager].size11PingFangSC_Medium;
        _updateDateLabel.textColor = [ZFMColorManager manager].colorGray96;
    }
    return _updateDateLabel;
}

- (void)setLayout:(id<ZFMLayoutProtocol>)layoutModel {
    [layoutModel layout:self];
}

@end
