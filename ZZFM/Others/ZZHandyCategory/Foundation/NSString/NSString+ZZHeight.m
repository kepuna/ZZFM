//
//  NSString+ZZHeight.m
//  ZZHandyCategory
//
//  Created by donews on 2018/7/20.
//  Copyright © 2018年 donews. All rights reserved.
//

#import "NSString+ZZHeight.h"


@implementation NSString (ZZHeight)

- (CGFloat)zz_heightWithFont:(UIFont *)font width:(CGFloat)width
{
    CGSize constrainSize = CGSizeMake(width, CGFLOAT_MAX);
    CGRect rect = [self boundingRectWithSize:constrainSize
                                     options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                  attributes:@{NSFontAttributeName:font}
                                     context:nil];
    return rect.size.height;
}

@end
