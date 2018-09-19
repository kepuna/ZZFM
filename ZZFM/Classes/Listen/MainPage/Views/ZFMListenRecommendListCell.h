//
//  ZFMListenRecommendListCell.h
//  ZZFM
//
//  Created by donews on 2018/9/3.
//  Copyright © 2018年 donews. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZFMLayoutProtocol.h"

@interface ZFMListenRecommendListCell : UICollectionViewCell <ZFMLayoutProtocol>

@property (nonatomic, strong) UIImageView *coverImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subTitleLabel;
@property (nonatomic, strong) UIButton *playTimesBtn;
@property (nonatomic, strong) UIButton *albumBtn;
@property (nonatomic, strong) UIView *lineView;

@end
