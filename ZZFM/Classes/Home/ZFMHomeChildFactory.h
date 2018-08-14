//
//  ZFMHomeChildFactory.h
//  ZZFM
//
//  Created by donews on 2018/8/14.
//  Copyright © 2018年 donews. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

FOUNDATION_EXTERN NSString * const ZFMHomeChildRecommend; // 推荐
FOUNDATION_EXTERN NSString * const ZFMHomeChildCategory; // 分类
FOUNDATION_EXTERN NSString * const ZFMHomeChildBroadCast; // 广播剧
FOUNDATION_EXTERN NSString * const ZFMHomeChildList; // 榜单
FOUNDATION_EXTERN NSString * const ZFMHomeChildAnchor; // 主播

@interface ZFMHomeChildFactory : NSObject

+ (UIViewController *)childWithTitleIdentify:(NSString *)title;

@end
