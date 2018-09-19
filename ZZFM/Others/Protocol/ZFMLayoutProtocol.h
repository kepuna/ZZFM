//
//  ZFMLayoutProtocol.h
//  ZZFM
//
//  Created by donews on 2018/9/3.
//  Copyright © 2018年 donews. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol ZFMLayoutProtocol <NSObject>

@optional;
/// frameModel 初始化方法
- (instancetype)initWithModel:(NSObject *)model;
/// cell调用的布局方法
- (void)setLayout:(id<ZFMLayoutProtocol>)layoutModel;
- (void)layout:(UIView *)view;
- (CGSize)itemSize;

@end
