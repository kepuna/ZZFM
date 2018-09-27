//
//  ZFMAlbumTrackListCellFrameModel.h
//  ZZFM
//
//  Created by donews on 2018/9/25.
//  Copyright © 2018年 donews. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZFMLayoutProtocol.h"

@class ZFMAlbumRecsItemModel;

@interface ZFMAlbumTrackListCellFrameModel : NSObject<ZFMLayoutProtocol>

@property (nonatomic, strong) ZFMAlbumRecsItemModel *model;

@end
