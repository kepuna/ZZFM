//
//  ZFMAlbumDetailViewModel.h
//  ZZFM
//
//  Created by donews on 2018/9/19.
//  Copyright © 2018年 donews. All rights reserved.
//  视图模型

#import "ZFMBaseViewModel.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@class ZFMAlbumDetailRequest, ZFMPlayItemRequest;

@interface ZFMAlbumDetailViewModel : ZFMBaseViewModel

/// 分集列表的frame模型数组
@property (nonatomic, copy) NSArray *trackListFrameModels;

/// 请求专辑详情
- (RACSignal *)requestAlbumDetail:(ZFMAlbumDetailRequest *)request;
/// 请求专辑对应分集列表
- (RACSignal *)requestAlbumTrackList:(ZFMAlbumDetailRequest *)request;
/// 请求专辑下指定分集的数据
- (RACSignal *)requestPlayItemDetail:(ZFMPlayItemRequest *)request;

@end
