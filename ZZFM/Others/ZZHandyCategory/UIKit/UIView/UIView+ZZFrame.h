//
//  UIView+ZZFrame.h
//  ZZHandyCategory
//
//  Created by donews on 2018/7/23.
//  Copyright © 2018年 donews. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ZZFrame)

@property (nonatomic) CGFloat zz_left;        ///< Shortcut for frame.origin.x.
@property (nonatomic) CGFloat zz_top;         ///< Shortcut for frame.origin.y
@property (nonatomic) CGFloat zz_right;       ///< Shortcut for frame.origin.x + frame.size.width
@property (nonatomic) CGFloat zz_bottom;      ///< Shortcut for frame.origin.y + frame.size.height
@property (nonatomic) CGFloat zz_width;       ///< Shortcut for frame.size.width.
@property (nonatomic) CGFloat zz_height;      ///< Shortcut for frame.size.height.
@property (nonatomic) CGFloat zz_centerX;     ///< Shortcut for center.x
@property (nonatomic) CGFloat zz_centerY;     ///< Shortcut for center.y
@property (nonatomic) CGPoint zz_origin;      ///< Shortcut for frame.origin.
@property (nonatomic) CGSize  zz_size;        ///< Shortcut for frame.size.

@end
