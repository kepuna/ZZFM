//
//  NXTabBar.m
//  NCube
//
//  Created by kepuna on 2016/11/27.
//  Copyright © 2016年 junjie.liu. All rights reserved.
//

#import "NXTabBar.h"

#define kTabBarItems 5
#define kTarBarWidth self.bounds.size.width
#define kTarBarHheight self.bounds.size.height

@interface NXTabBar ()

@property (nonatomic, strong) UIButton *centerButton;

@end

@implementation NXTabBar

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        [self addSubview:self.centerButton];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
//    self.centerButton.center = CGPointMake( kTarBarWidth* 0.5, kTarBarHheight * 0.5);
    CGFloat viewW = kTarBarWidth / kTabBarItems;
    CGFloat viewH = 0;
    CGFloat viewX = 0;
    CGFloat viewY = 0;
    CGFloat centerY = 0;
    NSInteger i = 0;
    for (UIView *subView in self.subviews) {
        
        if ([subView isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            viewX = i * viewW;
            if (viewH == 0) {
                viewH = subView.bounds.size.height;
            }
            
            if (centerY == 0) {
                self.centerButton.center = CGPointMake( kTarBarWidth* 0.5, subView.center.y);
            }
            
            subView.frame = CGRectMake(viewX, viewY, viewW, viewH);
            i++;
            if (i==2) {
                i++;
            }
        }
    }
}

- (void)setCenterIcon:(UIImage *)icon {
    [self.centerButton setImage:icon forState:UIControlStateNormal];
    [self.centerButton sizeToFit];
}

#pragma mark - event response
- (void)s_centerButtonClick{
    if (self.centerIconClickBlock) {
       self.centerIconClickBlock();
    }
}

#pragma mark - getters
- (UIButton *)centerButton{
    if (_centerButton == nil) {
        _centerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_centerButton addTarget:self action:@selector(s_centerButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _centerButton;
}

@end

