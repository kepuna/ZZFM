//
//  ZFMTableViewCell.m
//  ZZFM
//
//  Created by donews on 2018/8/10.
//  Copyright © 2018年 donews. All rights reserved.
//

#import "ZFMTableViewCell.h"
#import "UIView+JAExt.h"

@implementation ZFMTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.progressView];
        
        self.progressView.width = kWPercentage(176);
        self.progressView.height = kHPercentage(9);
        self.progressView.left = self.contentView.left + kWPercentage(6);
        self.progressView.bottom = self.contentView.bottom - kHPercentage(10);
       
//        self.progressView.frame = CGRectMake(10, 10, 250, 10); // 必须先设置frame
        _progressView.transform = CGAffineTransformMakeScale(1.0f,5.0f);//更改进度条高度
        _progressView.progress = 0.6;
        
    }
    return self;
}


- (UIProgressView *)progressView {
    if (_progressView == nil) {
        _progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
        _progressView.progressTintColor = [UIColor greenColor];
        _progressView.trackTintColor = [UIColor lightGrayColor];
        _progressView.contentMode = UIViewContentModeScaleToFill;
        
        for (UIImageView * imageview in _progressView.subviews) {
            imageview.layer.cornerRadius = 8;
            imageview.clipsToBounds = YES;
        }
        
    }
    return _progressView;
}

@end
