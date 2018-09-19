//
//  ZFMAlbumDetailModel.m
//  ZZFM
//
//  Created by donews on 2018/9/19.
//  Copyright © 2018年 donews. All rights reserved.
//

#import "ZFMAlbumDetailModel.h"

@implementation ZFMAlbumIntroModel

@end

@implementation ZFMAlbumRecsItemModel

@end

@implementation ZFMAlbumRecsModel

+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass {
    return @{@"list":@"ZFMAlbumRecsItemModel"};
}

@end

@implementation ZFMAlbumAnchorModel

@end

@implementation ZFMAlbumDetailModel

+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper {
    return @{ @"recs":@[@"recs",@"tracks"]};
}

@end

