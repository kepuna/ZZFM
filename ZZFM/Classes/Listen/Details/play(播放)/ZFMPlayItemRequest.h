//
//  ZFMPlayItemRequest.h
//  ZZFM
//
//  Created by donews on 2018/9/26.
//  Copyright © 2018年 donews. All rights reserved.
// 播放item的request

#import "ZFMBaseRequest.h"

@interface ZFMPlayItemRequest : ZFMBaseRequest

/// 专辑的id
@property (nonatomic, copy) NSString *albumId;
/// 专辑下分集的id
@property (nonatomic, copy) NSString *trackUid;

@end
