//
//  ZFMColorManager.h
//  ZZFM
//
//  Created by donews on 2018/8/14.
//  Copyright © 2018年 donews. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ZFMColorManager : NSObject

/// 占位背景色
@property (nonatomic, readonly, copy) UIColor *colorPlaceholder;
/// PageScroll的seleted颜色
@property (nonatomic, readonly, copy) UIColor *colorPageScrollSelected;
/// PageScroll的normal颜色
@property (nonatomic, readonly, copy) UIColor *colorPageScrollNormal;

+ (instancetype)manager;

@end
