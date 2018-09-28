//
//  ZFMAlbumDetailModel.m
//  ZZFM
//
//  Created by donews on 2018/9/19.
//  Copyright © 2018年 donews. All rights reserved.
//

#import "ZFMAlbumDetailModel.h"
#import <NSString+TGAdd.h>
#import <NSString+ZZDate.h>

@implementation ZFMAlbumIntroModel

@end

@implementation ZFMAlbumRecsItemModel


- (NSString *)comments {
    return [NSString tg_commentCountStringWithCount:[_comments integerValue]];
}

- (NSString *)playtimes {
    return [NSString tg_commentCountStringWithCount:[_playtimes integerValue]];
}

- (NSString *)duration {
    return [NSString zz_stringHMSWithSecond:[_duration integerValue]];
}

- (NSString *)createdAt {
    return [_createdAt zz_fromTimeStampToDetailDesc];
}

@end

@implementation ZFMAlbumRecsModel

+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass {
    return @{@"list":@"ZFMAlbumRecsItemModel"};
}

@end

@implementation ZFMAlbumAnchorModel

@end

@implementation ZFMAlbumCommentInfoModel

+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass {
    return @{@"list":@"ZFMAlbumCommentInfoModel"};
}

+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper {
    return @{ @"id":@"cId"};
}

@end


@implementation ZFMAlbumDetailModel

+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper {
    return @{ @"recs":@[@"recs",@"tracks"]};
}

@end

