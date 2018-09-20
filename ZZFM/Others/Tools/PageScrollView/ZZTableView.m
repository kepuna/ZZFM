//
//  ZZTableView.m
//  ZZFM
//
//  Created by donews on 2018/9/20.
//  Copyright © 2018年 donews. All rights reserved.
//

#import "ZZTableView.h"

@implementation ZZTableView

// 这个方法是支持多手势，当滑动子控制器中的scrollView时，MyTableView也能接收滑动事件
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return [gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]] && [otherGestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]];
}

@end
