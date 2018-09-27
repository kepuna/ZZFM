//
//  ZFMAlbumTrackListCell.h
//  ZZFM
//
//  Created by donews on 2018/9/21.
//  Copyright © 2018年 donews. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZFMLayoutProtocol.h"

@interface ZFMAlbumTrackListCell : UITableViewCell <ZFMLayoutProtocol>

/// 标题
@property (nonatomic, strong) UILabel *titleLabel;
/// 发布时间
@property (nonatomic, strong) UILabel *releaseAtLabel;
/// 顺序
@property (nonatomic, strong) UILabel *orderLabel;
/// 播放量
@property (nonatomic, strong) UIButton *playCountsButton;
/// 评论数量
@property (nonatomic, strong) UIButton *commentCountButton;
/// 音频时长
@property (nonatomic, strong) UIButton *playDurationButton;
/// 下载按钮
@property (nonatomic, strong) UIButton *downloadButton;

@end
