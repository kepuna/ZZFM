//
//  ZFMAlbumHeaderView.h
//  ZZFM
//
//  Created by donews on 2018/9/21.
//  Copyright © 2018年 donews. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <YYLabel.h>
#import "ZFMLayoutProtocol.h"

@interface ZFMAlbumHeaderView : UIView <ZFMLayoutProtocol>

@property (nonatomic, strong) UIVisualEffectView *visualEffectView; //  毛玻璃效果
@property (nonatomic, strong) UIImageView *blurImageView; // 毛玻璃背景图
@property (nonatomic, strong) UIImageView *bgImageView; //cover的封面
@property (nonatomic, strong) UIImageView *coverImageView; //封面
@property (nonatomic, strong) YYLabel *titleLabel;  //标题
@property (nonatomic, strong) YYLabel *anchorLabel; //主播
@property (nonatomic, strong) YYLabel *playCountsLabel;//播放量
@property (nonatomic, strong) YYLabel *cateLabel;  //类别
@property (nonatomic, strong) YYLabel *updateDateLabel;  //更新日期
@property (nonatomic, strong) UIButton *subscibeBtn; // 订阅
@property (nonatomic, strong) UIView *bottomBackView; // 底部圆角的白色视图

@end
