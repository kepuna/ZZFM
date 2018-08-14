//
//  UIView+JAExt.h
//  JAmieLottery
//
//  Created by Jamie on 15/12/18.
//  Copyright © 2015年 Jamie. All rights reserved.
//

#import <UIKit/UIKit.h>

//判断机型
#define iphone4                         [UIScreen mainScreen].bounds.size.height==480
#define iphone5                         [UIScreen mainScreen].bounds.size.height==568
#define iphone6                         [UIScreen mainScreen].bounds.size.height==667
#define iphone6p                        [UIScreen mainScreen].bounds.size.height==736
#define iphonePlush                     [UIScreen mainScreen].bounds.size.width==414
#define iPhoneX                         [UIScreen mainScreen].bounds.size.height==812


// 适配 iOS 11 重写 adjustsScrollViewInsets
#define adjustsScrollViewInsets(scrollView)\
do {\
_Pragma("clang diagnostic push")\
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"")\
if ([scrollView respondsToSelector:NSSelectorFromString(@"setContentInsetAdjustmentBehavior:")]) {\
NSMethodSignature *signature = [UIScrollView instanceMethodSignatureForSelector:@selector(setContentInsetAdjustmentBehavior:)];\
NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];\
NSInteger argument = 2;\
invocation.target = scrollView;\
invocation.selector = @selector(setContentInsetAdjustmentBehavior:);\
[invocation setArgument:&argument atIndex:2];\
[invocation retainArguments];\
[invocation invoke];\
}\
_Pragma("clang diagnostic pop")\
} while (0)


// 适配iOS 11 & iPhoneX
#define STATEBarHeight          (iPhoneX ? 44.00 : 20.00)
#define NavigationHeight        (STATEBarHeight + 44)
#define TabHeight               (iPhoneX ? 83 : 49)
#define PageScrollHeight        44.0

//顶导航+状态栏高度
#define kNAVSTATE_H (self.navigationController.navigationBar.height + [UIApplication sharedApplication].statusBarFrame.size.height)

#define RandomColor ([UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1])

#define SCREEN_WIDTH ([[UIScreen mainScreen]bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen]bounds].size.height)

#define kHPercentage(a) (SCREEN_HEIGHT*((a)/667.00))
#define kWPercentage(a) (SCREEN_WIDTH *((a)/375.00))

#define UIColorRGB(_red_, _green_, _blue_, _alpha_) [UIColor colorWithRed:(_red_)/255.0 green:(_green_)/255.0 blue:(_blue_)/255.0 alpha:(_alpha_)]

#define TGPercentWidthValue(a) (SCREEN_WIDTH *((a)/375.00))
#define TGPercentHeightValue(a) (SCREEN_HEIGHT*((a)/667.00))

@interface UIView (JAExt)
@property (assign, nonatomic) CGFloat width;
@property (assign, nonatomic) CGFloat height;
@property (assign, nonatomic) CGFloat x;
@property (assign, nonatomic) CGFloat y;
@property (assign, nonatomic) CGSize size;
@property (assign, nonatomic) CGFloat centerX;
@property (assign, nonatomic) CGFloat centerY;

@property (assign,nonatomic) CGFloat left;
@property (assign,nonatomic) CGFloat top;
@property (assign,nonatomic) CGFloat right;
@property (assign,nonatomic) CGFloat bottom;

@end
