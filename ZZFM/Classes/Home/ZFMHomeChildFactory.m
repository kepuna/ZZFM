//
//  ZFMHomeChildFactory.m
//  ZZFM
//
//  Created by donews on 2018/8/14.
//  Copyright © 2018年 donews. All rights reserved.
//

#import "ZFMHomeChildFactory.h"
#import "ZFMRecommendViewController.h"
#import "ZFMCategoryViewController.h"

NSString * const ZFMHomeChildRecommend = @"推荐";
NSString * const ZFMHomeChildCategory = @"分类";
NSString * const ZFMHomeChildBroadCast = @"广播剧";
NSString * const ZFMHomeChildList = @"榜单";
NSString * const ZFMHomeChildAnchor = @"主播";

@implementation ZFMHomeChildFactory

+ (UIViewController *)childWithTitleIdentify:(NSString *)title {
    if ([title isEqualToString:ZFMHomeChildRecommend]) {
        return [[ZFMRecommendViewController alloc] init];
    } else if ([title isEqualToString:ZFMHomeChildCategory]) {
        return [[ZFMCategoryViewController alloc] init];
    } else {
        return [[ZFMRecommendViewController alloc] init];
    }
}

@end
