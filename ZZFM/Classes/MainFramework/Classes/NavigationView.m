//
//  NavigationView.m
//  NavDemo
//
//  Created by kepuna on 2017/11/2.
//  Copyright © 2017年 kepuna. All rights reserved.
//

#import "NavigationView.h"

#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScale  ScreenWidth/375.0

#define Nav_Height (kDevice_Is_iPhoneX ? 88 : 64)

#define kDevice_Is_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

CGFloat const NavigationViewLineViewHeight = 0.5;
//CGFloat const NavigationViewHeight = 64;
CGFloat const NavigationViewItemHeight = 30;

@interface NavigationView ()

@property (nonatomic, weak) UIViewController *targetVC;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UIButton *rightItemBtn;
@property (nonatomic, strong) UIButton *backItemBtn;
@property (nonatomic, strong) NavigationConfig *config;

@end

@implementation NavigationView

+ (void)setNavGlobalBackgroundColor:(UIColor *)color {
    [[self alloc] setBackgroundColor:color];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self p_setNavWithConfig:self.config];
        [self addSubview:self.titleLabel];
        [self addSubview:self.lineView];
        [self addSubview:self.rightItemBtn];
        [self addSubview:self.backItemBtn];
    }
    return self;
}


- (void)p_setNavWithConfig:(NavigationConfig *)config {
    
    self.backgroundColor = config.globalBackgroundColor;
    if (config.globalBackgroundImage) {
        self.backgroundColor = [UIColor colorWithPatternImage:config.globalBackgroundImage];
    }
    
    if (self.config.backIcon) {
        [self.backItemBtn setImage:self.config.backIcon forState:UIControlStateNormal];
    } else {
        NSAssert(NO, @"请设置返回icon");
    }
    
    self.titleLabel.font = self.config.font;
    self.titleLabel.textColor = self.config.titleColor;
    self.lineView.backgroundColor = self.config.bottomLineColor;
    [self.rightItemBtn setTitleColor:self.config.titleColor forState:UIControlStateNormal];
    [self.backItemBtn setTitleColor:self.config.titleColor forState:UIControlStateNormal];
}

+ (instancetype)nav:(void (^)(NavigationView *))initBlock {
    NavigationView *navView = [[NavigationView alloc]init];
    if (initBlock) {
        initBlock(navView);
    }
    return navView;
}

- (NavigationView *(^)(UIView *, UIViewController *))addInViewAndTarget {
    return ^NavigationView *(UIView *view, UIViewController *target) {
        [view addSubview:self];
        self.targetVC = target;
        return self;
    };
}

- (NavigationView *(^)(NSString *))title{
    return ^NavigationView *(NSString *title) {
        self.titleLabel.text = title;
        return self;
    };
}

- (NavigationView *(^)(NSString *))rightItemWithImage {
    return ^NavigationView *(NSString *icon) {
        [self.rightItemBtn setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
        [self.rightItemBtn sizeToFit];
        self.rightItemBtn.center = CGPointMake(self.frame.size.width - self.rightItemBtn.bounds.size.width, self.titleLabel.center.y);
        return self;
    };
}

- (NavigationView *(^)(NSString *))rightItemWithTitle {
    return ^NavigationView *(NSString *title) {
        [self.rightItemBtn setTitle:title forState:UIControlStateNormal];
        self.rightItemBtn.titleLabel.font = [UIFont systemFontOfSize:16 * kScale];
        [self.rightItemBtn sizeToFit];
        self.rightItemBtn.center = CGPointMake(self.frame.size.width - self.rightItemBtn.bounds.size.width, self.titleLabel.center.y);
        return self;
    };
}

- (NavigationView *(^)(UIColor *))rightItemTitleColor {
    return ^NavigationView *(UIColor *titleColor) {
        [self.rightItemBtn setTitleColor:titleColor forState:UIControlStateNormal];
        return self;
    };
}

- (NavigationView *(^)(id, SEL))rightItemTargetAction {
    return ^NavigationView *(id target, SEL action) {
        [self.rightItemBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        return self;
    };
}

- (NavigationView *(^)(NSString *))updateBackItemWithImage {
    return ^NavigationView *(NSString *icon) {
        [self.backItemBtn setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
        self.backItemBtn.center = CGPointMake(20 * kScale, self.titleLabel.center.y);
        [self.backItemBtn sizeToFit];
        return self;
    };
}

- (NavigationView *(^)(NSString *))updateBackItemWithTitle {
    return ^NavigationView *(NSString *title) {
        [self.backItemBtn setImage:nil forState:UIControlStateNormal];
        [self.backItemBtn setTitle:title forState:UIControlStateNormal];
        self.backItemBtn.titleLabel.font = [UIFont systemFontOfSize:16 * kScale];
        self.backItemBtn.center = CGPointMake(20 * kScale, self.titleLabel.center.y);
        self.backItemBtn.bounds = CGRectMake(0, 0, NavigationViewItemHeight, NavigationViewItemHeight);
        return self;
    };
}

- (NavigationView *(^)(UIView *, CGRect))customLeftView {
    return ^NavigationView *(UIView *view, CGRect frame) {
        [self addSubview:view];
        view.frame = frame;
        return self;
    };
}

- (NavigationView *(^)(UIView *, CGRect))customRightView {
    return ^NavigationView *(UIView *view, CGRect frame) {
        [self addSubview:view];
        view.frame = frame;
        return self;
    };
}

- (NavigationView *(^)(BOOL))isHideBackIcon {
    return ^NavigationView *(BOOL isHide) {
        self.backItemBtn.hidden = isHide;
        return self;
    };
}

- (NavigationView *(^)(BOOL))isHideBottomLine {
    return ^NavigationView *(BOOL isHide) {
        self.lineView.hidden = isHide;
        return self;
    };
}

- (NavigationView *(^)(BOOL))isUserLeftActionEnabed
{
    return ^NavigationView *(BOOL isEnabed) {
        self.backItemBtn.userInteractionEnabled = isEnabed;
        return self;
    };
}

- (NavigationView *(^)(BOOL))isUseRightrActionEnabled
{
    return ^NavigationView *(BOOL isEnabed) {
        self.rightItemBtn.userInteractionEnabled = isEnabed;
        return self;
    };
}

#pragma mark - event response
- (void)s_backItemBtnClick {
    if (self.backClickBlock) {
        self.backClickBlock();
    }
    if (self.targetVC.presentingViewController) {
        [self.targetVC dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self.targetVC.navigationController popViewControllerAnimated:YES];
    }
}

#pragma mark - getters
- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.center = CGPointMake(self.center.x,self.center.y + ((Nav_Height - 18 )* 0.5 - 12));
        _titleLabel.bounds = CGRectMake(0, 0, 200 * kScale, 25 * kScale);
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.backgroundColor = [UIColor clearColor];
    }
    return _titleLabel;
}

- (UIView *)lineView {
    if (_lineView == nil) {
        CGRect frame = CGRectMake(0, [NavigationView height] - NavigationViewLineViewHeight * kScale, self.frame.size.width, NavigationViewLineViewHeight * kScale);
        _lineView = [[UIView alloc]initWithFrame:frame];
    }
    return _lineView;
}

- (UIButton *)rightItemBtn {
    if (_rightItemBtn == nil) {
        _rightItemBtn =  [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _rightItemBtn;
}

- (UIButton *)backItemBtn {
    if (_backItemBtn == nil) {
        _backItemBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _backItemBtn.center = CGPointMake(20 * kScale, self.titleLabel.center.y);
        _backItemBtn.bounds = CGRectMake(0, 0, NavigationViewItemHeight, NavigationViewItemHeight);
        [_backItemBtn addTarget:self action:@selector(s_backItemBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backItemBtn;
}

- (NavigationConfig *)config {
    if (_config == nil) {
        _config = [NavigationConfig sharedInstance];
    }
    return _config;
}

+ (CGFloat)height {
   return Nav_Height;
}

- (void)setFrame:(CGRect)frame {
    
    CGRect temp = CGRectMake(0, 0, ScreenWidth, Nav_Height);
    [super setFrame:temp];
}


@end
