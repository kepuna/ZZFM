//
//  ZFMPlayItemModel.h
//  ZZFM
//
//  Created by donews on 2018/9/26.
//  Copyright © 2018年 donews. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZFMAlbumRecsItemModel, ZFMAlbumCommentInfoModel,ZFMAlbumAnchorModel;

@interface ZFMPlayItemModel : NSObject

/// 相关推荐专辑 （听本节目的人也听了）
@property (nonatomic, copy) NSArray <ZFMAlbumRecsItemModel *> *associationAlbumsInfo;
/// 专辑的信息
@property (nonatomic, strong) ZFMAlbumRecsItemModel *albumInfo;
/// 主播信息
@property (nonatomic, strong) ZFMAlbumAnchorModel *userInfo;
/// 分集专辑信息
@property (nonatomic, strong) ZFMAlbumRecsItemModel *trackInfo;
/// 评论信息
@property (nonatomic, strong) ZFMAlbumCommentInfoModel *commentInfo;

@end
