//
//  ZFMHomeViewModel.m
//  ZZFM
//
//  Created by donews on 2018/8/14.
//  Copyright © 2018年 donews. All rights reserved.
//

#import "ZFMHomeViewModel.h"
#import "ZFMHomeChildFactory.h"
#import "NSArray+ZZGuard.h"

@interface ZFMHomeViewModel()

/// PageScroll控件的子控制器数组
@property (nonatomic, readwrite, copy) NSArray *childControllers;

@end

@implementation ZFMHomeViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _scrollTitles = @[ZFMHomeChildCategory,ZFMHomeChildRecommend, ZFMHomeChildBroadCast, ZFMHomeChildList,ZFMHomeChildAnchor];
        
    }
    return self;
}

- (NSArray *)childControllers {
    if(!_childControllers) {
        NSMutableArray *tempArray = [NSMutableArray arrayWithCapacity:10];
        [_scrollTitles enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            UIViewController *vc = [ZFMHomeChildFactory childWithTitleIdentify:obj];
            [tempArray zz_addObject:vc];
        }];
        _childControllers = tempArray.copy;
    }
    return _childControllers;
}

@end
