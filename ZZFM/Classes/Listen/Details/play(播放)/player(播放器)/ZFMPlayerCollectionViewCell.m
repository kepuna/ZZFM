//
//  ZFMPlayerCollectionViewCell.m
//  ZZFM
//
//  Created by donews on 2018/9/27.
//  Copyright © 2018年 donews. All rights reserved.
//  播放器的cell

#import "ZFMPlayerCollectionViewCell.h"
#import "ZFMPublic.h"
#import <UIView+Shadow.h>

@interface ZFMPlayerCollectionViewCell()

@property (nonatomic, strong) UIView *shadowView; // 阴影背景
@property (nonatomic, strong) UIImageView *logoImageView; // logo图片
@property (nonatomic, strong) UILabel *titleLabel;  // 标题
@property (nonatomic, strong) UIButton *barrageBtn;  // 弹幕按钮
@property (nonatomic, strong) UIButton *settingBtn;  // 设置按钮
@property (nonatomic, strong) UISlider *slider;  // 滑动条
@property (nonatomic, strong) UILabel *currentTimeLabel;  // 当前时间
@property (nonatomic, strong) UILabel *totalTimeLabel;  // 总时间
@property (nonatomic, strong) UIButton *playBtn;  // 播放、暂停按钮
@property (nonatomic, strong) UIButton *prevBtn;  // 上一曲按钮
@property (nonatomic, strong) UIButton *nextBtn;  // 下一曲按钮
@property (nonatomic, strong) UIButton *playListBtn;  // 播放列表
@property (nonatomic, strong) UIButton *timerBtn;  // 定时关闭按钮

@end

@implementation ZFMPlayerCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.shadowView];
        [self.shadowView addSubview:self.logoImageView];
        [self.contentView addSubview:self.barrageBtn];
        [self.contentView addSubview:self.settingBtn];
        [self.contentView addSubview:self.slider];
        [self.contentView addSubview:self.currentTimeLabel];
        [self.contentView addSubview:self.totalTimeLabel];
        [self.contentView addSubview:self.playBtn];
        [self.contentView addSubview:self.prevBtn];
        [self.contentView addSubview:self.nextBtn];
        [self.contentView addSubview:self.playListBtn];
        [self.contentView addSubview:self.timerBtn];
        
        self.titleLabel.text = @"[消息推荐]我用十五年青春，换你与初恋白头偕老";
        
        [self.logoImageView dn_setImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1538042520168&di=5cc6264d53383d788ea059d403d2e5ec&imgtype=0&src=http%3A%2F%2Fi0.hdslb.com%2Fbfs%2Farticle%2F844dcb4c83c258b3b78f0983b1d4536bbcf99de8.jpg"] placeholderImage:[UIImage zz_imageName:@"find_usercover" inBundle:ZFMResourceListen]];
        self.currentTimeLabel.text = @"08:03";
        self.totalTimeLabel.text = @"22:12";
        
        [self setLayout];
    }
    return self;
}

- (void)setLayout {
    
    CGFloat marginLeft = 30;
    // 标题
    self.titleLabel.width = self.contentView.width - marginLeft * 2;
    self.titleLabel.height = self.titleLabel.font.lineHeight * 2;
    self.titleLabel.top = 8;
    self.titleLabel.centerX = self.contentView.centerX;
    
    // 阴影背景
    self.shadowView.width = self.contentView.width - marginLeft * 4;
    self.shadowView.height = self.shadowView.width + 10;
    self.shadowView.top = self.titleLabel.bottom + 20;
    self.shadowView.centerX = self.contentView.centerX;
    
    // logo图片
    self.logoImageView.width = self.shadowView.width;
    self.logoImageView.height = self.shadowView.height;
    self.logoImageView.left = 0;
    self.logoImageView.top = 0;
    
    // 弹幕按钮
    self.barrageBtn.width = self.barrageBtn.imageView.image.size.width;
    self.barrageBtn.height = self.barrageBtn.imageView.image.size.height;
    self.barrageBtn.left = marginLeft * 0.5;
    self.barrageBtn.top = self.shadowView.bottom + 20;
    
    self.settingBtn.width = self.settingBtn.imageView.image.size.width;
    self.settingBtn.height = self.settingBtn.imageView.image.size.height;
    self.settingBtn.right = self.contentView.right - marginLeft * 0.5;
    self.settingBtn.centerY = self.barrageBtn.centerY;
    
    self.slider.width = self.contentView.width - marginLeft;
    self.slider.height = 4;
    self.slider.top = self.barrageBtn.bottom + 20;
    self.slider.centerX = self.contentView.centerX;
    
    self.currentTimeLabel.width = 60;
    self.currentTimeLabel.height = self.currentTimeLabel.font.lineHeight;
    self.currentTimeLabel.left = self.slider.left;
    self.currentTimeLabel.top = self.slider.bottom + 10;
    
    self.totalTimeLabel.width = 60;
    self.totalTimeLabel.height = self.currentTimeLabel.height;
    self.totalTimeLabel.right = self.slider.right;
    self.totalTimeLabel.centerY = self.currentTimeLabel.centerY;
    
    self.playListBtn.width = self.playListBtn.imageView.image.size.width;
    self.playListBtn.height = self.playListBtn.imageView.image.size.height;
    self.playListBtn.centerX = self.barrageBtn.centerX;
    self.playListBtn.top = self.currentTimeLabel.bottom + 10;
    
    self.timerBtn.width = self.timerBtn.imageView.image.size.width;
    self.timerBtn.height = self.timerBtn.imageView.image.size.height;
    self.timerBtn.centerX = self.settingBtn.centerX;
    self.timerBtn.centerY = self.playListBtn.centerY;
    
    self.playBtn.width = self.playBtn.imageView.image.size.width;
    self.playBtn.height = self.playBtn.imageView.image.size.height;
    self.playBtn.centerX = self.contentView.centerX;
    self.playBtn.top = self.slider.bottom + 15;
    
    self.prevBtn.width = self.prevBtn.imageView.image.size.width;
    self.prevBtn.height = self.prevBtn.imageView.image.size.height;
    self.prevBtn.centerY = self.playBtn.centerY;
    self.prevBtn.right = self.playBtn.left - 25;
    
    self.nextBtn.width = self.nextBtn.imageView.image.size.width;
    self.nextBtn.height = self.nextBtn.imageView.image.size.height;
    self.nextBtn.centerY = self.prevBtn.centerY;
    self.nextBtn.left = self.playBtn.right + 25;
    
    
}

#pragma mark - Response Event
- (void)s_sliderValueChangedEvent:(UISlider *)sender {
    
}

- (void)s_sliderTouchUpInsideEvent:(UISlider *)sender {
    
}

#pragma mark - Getters & Setters
- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [ZFMColorManager manager].colorBlack32;
        _titleLabel.font = [ZFMFontManager manager].size16PingFangSC_Medium;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.numberOfLines = 2;
    }
    return _titleLabel;
}

- (UIView *)shadowView {
    if (_shadowView == nil) {
        _shadowView = [[UIView alloc] init];
        _shadowView.backgroundColor = [ZFMColorManager manager].colorWhite;
        [_shadowView tg_shadowPathWith:[UIColor blackColor] shadowOpacity:0.4 shadowRadius:5 shadowOffSet:CGSizeMake(1, 1)];
        _shadowView.layer.cornerRadius = ZFMCornerRadius;

    }
    return _shadowView;
}

- (UIImageView *)logoImageView {
    if (_logoImageView == nil) {
        _logoImageView = [[UIImageView alloc] init];
        _logoImageView.backgroundColor = [ZFMColorManager manager].colorPlaceholder;
        _logoImageView.contentMode = UIViewContentModeScaleAspectFill;
        _logoImageView.clipsToBounds = YES;
        _logoImageView.layer.cornerRadius = ZFMCornerRadius;
        _logoImageView.layer.masksToBounds = YES;
    }
    return _logoImageView;
}

- (UIButton *)barrageBtn {
    if (_barrageBtn == nil) {
        _barrageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_barrageBtn setImage:[UIImage zz_imageName:@"NPProDMOff_24x24_" inBundle:ZFMResourcePlayer] forState:UIControlStateNormal];
    }
    return _barrageBtn;
}

- (UIButton *)settingBtn {
    if (_settingBtn == nil) {
        _settingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_settingBtn setImage:[UIImage zz_imageName:@"NPProSet_25x24_" inBundle:ZFMResourcePlayer] forState:UIControlStateNormal];
    }
    return _settingBtn;
}

- (UISlider *)slider {
    if (_slider == nil) {
        _slider = [[UISlider alloc] init];
        [_slider setThumbImage:[UIImage zz_imageName:@"playProcessDot_n_7x16_" inBundle:ZFMResourcePlayer] forState:UIControlStateNormal];
        _slider.maximumTrackTintColor = [ZFMColorManager manager].colorLine;
        _slider.minimumTrackTintColor = [ZFMColorManager manager].colorSliderProgress;
        [_slider addTarget:self action:@selector(s_sliderValueChangedEvent:) forControlEvents:UIControlEventValueChanged];
        [_slider addTarget:self action:@selector(s_sliderTouchUpInsideEvent:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _slider;
}

- (UILabel *)currentTimeLabel {
    if (_currentTimeLabel == nil) {
        _currentTimeLabel = [[UILabel alloc] init];
        _currentTimeLabel.textColor = [ZFMColorManager manager].colorSliderProgress;
        _currentTimeLabel.font = [ZFMFontManager manager].size12PingFangSC_Regular;
        _currentTimeLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _currentTimeLabel;
}

- (UILabel *)totalTimeLabel {
    if (_totalTimeLabel == nil) {
        _totalTimeLabel = [[UILabel alloc] init];
        _totalTimeLabel.textColor = [ZFMColorManager manager].colorSliderProgress;
        _totalTimeLabel.font = [ZFMFontManager manager].size12PingFangSC_Regular;
        _totalTimeLabel.textAlignment = NSTextAlignmentRight;
    }
    return _totalTimeLabel;
}

- (UIButton *)playListBtn {
    if (_playListBtn == nil) {
        _playListBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_playListBtn setImage:[UIImage zz_imageName:@"playpage_icon_list_24x24_" inBundle:ZFMResourcePlayer] forState:UIControlStateNormal];
    }
    return _playListBtn;
}

- (UIButton *)timerBtn {
    if (_timerBtn == nil) {
        _timerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_timerBtn setImage:[UIImage zz_imageName:@"playpage_icon_timing_24x24_" inBundle:ZFMResourcePlayer] forState:UIControlStateNormal];
    }
    return _timerBtn;
}

- (UIButton *)playBtn {
    if (_playBtn == nil) {
        _playBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_playBtn setImage:[UIImage zz_imageName:@"toolbar_play_n_p_78x78_" inBundle:ZFMResourcePlayer] forState:UIControlStateNormal];
    }
    return _playBtn;
}

- (UIButton *)nextBtn {
    if (_nextBtn == nil) {
        _nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_nextBtn setImage:[UIImage zz_imageName:@"toolbar_next_n_p_24x24_" inBundle:ZFMResourcePlayer] forState:UIControlStateNormal];
    }
    return _nextBtn;
}

- (UIButton *)prevBtn {
    if (_prevBtn == nil) {
        _prevBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_prevBtn setImage:[UIImage zz_imageName:@"toolbar_prev_n_p_24x24_" inBundle:ZFMResourcePlayer] forState:UIControlStateNormal];
    }
    return _prevBtn;
}
@end
