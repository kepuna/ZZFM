//
//  NSString+ZZHeight.h
//  ZZHandyCategory
//
//  Created by donews on 2018/7/20.
//  Copyright © 2018年 donews. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (ZZHeight)


/**
 指定宽度 计算文字高度

 @param font 字体
 @param width 宽度
 @return 高度
 */
- (CGFloat)zz_heightWithFont:(UIFont *)font width:(CGFloat)width;

@end
