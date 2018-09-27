//
//  ZFMAlbumTrackListCell.m
//  ZZFM
//
//  Created by donews on 2018/9/21.
//  Copyright © 2018年 donews. All rights reserved.
//

#import "ZFMAlbumTrackListCell.h"
#import "ZFMPublic.h"

@interface ZFMAlbumTrackListCell()

@end

@implementation ZFMAlbumTrackListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.releaseAtLabel];
        [self.contentView addSubview:self.orderLabel];
        [self.contentView addSubview:self.playCountsButton];
        [self.contentView addSubview:self.commentCountButton];
        [self.contentView addSubview:self.playDurationButton];
        [self.contentView addSubview:self.downloadButton];
    }
    return self;
}


#pragma mark - Getters & Setters
/// 标题
- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [ZFMColorManager manager].colorBlack32;
        _titleLabel.font = [ZFMFontManager manager].size15PingFangSC_Regular;
        _titleLabel.numberOfLines = 2;
    }
    return _titleLabel;
}

/// 发布时间
- (UILabel *)releaseAtLabel {
    if (_releaseAtLabel == nil) {
        _releaseAtLabel = [[UILabel alloc] init];
        _releaseAtLabel.textColor = [ZFMColorManager manager].colorGray96;
        _releaseAtLabel.font = [ZFMFontManager manager].size12PingFangSC_Regular;
    }
    return _releaseAtLabel;
}

/// 顺序
- (UILabel *)orderLabel {
    if (_orderLabel == nil) {
        _orderLabel = [[UILabel alloc] init];
        _orderLabel.textColor = [ZFMColorManager manager].colorGray96;
        _orderLabel.font = [ZFMFontManager manager].size14PingFangSC_Regular;
        _orderLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _orderLabel;
}

/// 播放量
- (UIButton *)playCountsButton {
    if (_playCountsButton == nil) {
        _playCountsButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_playCountsButton setTitleColor:[ZFMColorManager manager].colorGray96 forState:UIControlStateNormal];
        _playCountsButton.titleLabel.font = [ZFMFontManager manager].size10PingFangSC_Regular;
        [_playCountsButton setImage:[UIImage zz_imageName:@"sound_playtimes" inBundle:ZFMResourceListen] forState:UIControlStateNormal];
    }
    return _playCountsButton;
}

/// 音频时长
- (UIButton *)playDurationButton {
    if (_playDurationButton == nil) {
        _playDurationButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_playDurationButton setTitleColor:[ZFMColorManager manager].colorGray96 forState:UIControlStateNormal];
        _playDurationButton.titleLabel.font = [ZFMFontManager manager].size10PingFangSC_Regular;
        [_playDurationButton setImage:[UIImage zz_imageName:@"sound_duration" inBundle:ZFMResourceListen] forState:UIControlStateNormal];
    }
    return _playDurationButton;
}

/// 评论数量
- (UIButton *)commentCountButton {
    if (_commentCountButton == nil) {
        _commentCountButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_commentCountButton setTitleColor:[ZFMColorManager manager].colorGray96 forState:UIControlStateNormal];
        _commentCountButton.titleLabel.font = [ZFMFontManager manager].size10PingFangSC_Regular;
        [_commentCountButton setImage:[UIImage zz_imageName:@"sound_comments" inBundle:ZFMResourceListen] forState:UIControlStateNormal];
    }
    return _commentCountButton;
}

- (UIButton *)downloadButton {
    if (_downloadButton == nil) {
        _downloadButton = [UIButton buttonWithType:UIButtonTypeCustom];
                [_downloadButton setImage:[UIImage zz_imageName:@"cell_download" inBundle:ZFMResourceListen] forState:UIControlStateNormal];
    }
    return _downloadButton;
}

- (void)setLayout:(id<ZFMLayoutProtocol>)layoutModel {
    [layoutModel layout:self];
}

@end
