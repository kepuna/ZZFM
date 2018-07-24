//
//  UIView+ZZFrame.m
//  ZZHandyCategory
//
//  Created by donews on 2018/7/23.
//  Copyright © 2018年 donews. All rights reserved.
//

#import "UIView+ZZFrame.h"

@implementation UIView (ZZFrame)

- (CGFloat)zz_left {
    return self.frame.origin.x;
}

- (void)setZz_left:(CGFloat)zz_left {
    CGRect frame = self.frame;
    frame.origin.x = zz_left;
    self.frame = frame;
}

- (CGFloat)zz_top {
    return self.frame.origin.y;
}

- (void)setZz_top:(CGFloat)zz_top {
    CGRect frame = self.frame;
    frame.origin.y = zz_top;
    self.frame = frame;
}

- (CGFloat)zz_right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setZz_right:(CGFloat)zz_right {
    CGRect frame = self.frame;
    frame.origin.x = zz_right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)zz_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setZz_bottom:(CGFloat)zz_bottom {
    CGRect frame = self.frame;
    frame.origin.y = zz_bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)zz_width {
    return self.frame.size.width;
}

- (void)setZz_width:(CGFloat)zz_width {
    CGRect frame = self.frame;
    frame.size.width = zz_width;
    self.frame = frame;
}

- (CGFloat)zz_height {
    return self.frame.size.height;
}

- (void)setZz_height:(CGFloat)zz_height {
    CGRect frame = self.frame;
    frame.size.height = zz_height;
    self.frame = frame;
}

- (CGFloat)zz_centerX {
    return self.center.x;
}

- (void)setZz_centerX:(CGFloat)zz_centerX {
    self.center = CGPointMake(zz_centerX, self.center.y);
}

- (CGFloat)zz_centerY {
    return self.center.y;
}

- (void)setZz_centerY:(CGFloat)zz_centerY {
    self.center = CGPointMake(self.center.x, zz_centerY);
}

- (CGPoint)zz_origin {
    return self.frame.origin;
}

- (void)setZz_origin:(CGPoint)zz_origin {
    CGRect frame = self.frame;
    frame.origin = zz_origin;
    self.frame = frame;
}

- (CGSize)zz_size {
    return self.frame.size;
}

- (void)setZz_size:(CGSize)zz_size {
    CGRect frame = self.frame;
    frame.size = zz_size;
    self.frame = frame;
}


@end
