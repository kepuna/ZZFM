//
//  ZFMAlbumDetailViewModel.h
//  ZZFM
//
//  Created by donews on 2018/9/19.
//  Copyright © 2018年 donews. All rights reserved.
//  视图模型

#import "ZFMBaseViewModel.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@class ZFMAlbumDetailRequest;

@interface ZFMAlbumDetailViewModel : ZFMBaseViewModel

/// 请求专辑详情
- (RACSignal *)requestAlbumDetail:(ZFMAlbumDetailRequest *)request;
/// 请求专辑对应分集列表
- (RACSignal *)requestAlbumTrackList:(ZFMAlbumDetailRequest *)request;

@end
