//
//  ZFMHomeViewModel.h
//  ZZFM
//
//  Created by donews on 2018/8/14.
//  Copyright © 2018年 donews. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZFMHomeViewModel : NSObject

/// PageScroll控件的titles数组
@property (nonatomic, readonly, copy) NSArray *scrollTitles;
/// PageScroll控件的子控制器数组
@property (nonatomic, readonly, copy) NSArray *childControllers;

@end
