//
//  ZFMListenRecommendListCell.m
//  ZZFM
//
//  Created by donews on 2018/9/3.
//  Copyright © 2018年 donews. All rights reserved.
//

#import "ZFMListenRecommendListCell.h"
#import "ZFMPublic.h"

@implementation ZFMListenRecommendListCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.coverImageView];
        [self addSubview:self.titleLabel];
        [self addSubview:self.subTitleLabel];
        [self addSubview:self.playTimesBtn];
        [self addSubview:self.albumBtn];
        [self addSubview:self.lineView];
    }
    return self;
}

- (void)setLayout:(id<ZFMLayoutProtocol>)layoutModel {
    [layoutModel layout:self];
}

#pragma mark - Getters & Setters
- (UIImageView *)coverImageView {
    if (_coverImageView == nil) {
        _coverImageView = [[UIImageView alloc] init];
        _coverImageView.backgroundColor = [ZFMColorManager manager].colorPlaceholder;
    }
    return _coverImageView;
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [ZFMColorManager manager].colorBlack32;
        _titleLabel.font = [ZFMFontManager manager].size16PingFangSC_Medium;
    }
    return _titleLabel;
}

- (UILabel *)subTitleLabel {
    if (_subTitleLabel == nil) {
        _subTitleLabel = [[UILabel alloc] init];
        _subTitleLabel.textColor = [ZFMColorManager manager].colorGray96;
        _subTitleLabel.font = [ZFMFontManager manager].size12PingFangSC_Medium;
    }
    return _subTitleLabel;
}

- (UIButton *)playTimesBtn {
    if (_playTimesBtn == nil) {
        _playTimesBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_playTimesBtn setTitleColor:[ZFMColorManager manager].colorGray96 forState:UIControlStateNormal];
        _playTimesBtn.titleLabel.font = [ZFMFontManager manager].size12PingFangSC_Regular;
         [_playTimesBtn setImage:[UIImage zz_imageName:@"sound_playtimes" inBundle:ZFMResourceListen] forState:UIControlStateNormal];
    }
    return _playTimesBtn;
}

- (UIButton *)albumBtn {
    if (_albumBtn == nil) {
        _albumBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_albumBtn setTitleColor:[ZFMColorManager manager].colorGray96 forState:UIControlStateNormal];
        _albumBtn.titleLabel.font = [ZFMFontManager manager].size12PingFangSC_Regular;
        [_albumBtn setImage:[UIImage zz_imageName:@"album_tracks" inBundle:ZFMResourceListen] forState:UIControlStateNormal];
    }
    return _albumBtn;
}

- (UIView *)lineView {
    if (_lineView == nil) {
        _lineView = [[UIView alloc] init];
    }
    return _lineView;
}

@end
