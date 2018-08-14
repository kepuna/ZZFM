//
//  ZFMMacro.h
//  ZZFM
//
//  Created by donews on 2018/8/14.
//  Copyright © 2018年 donews. All rights reserved.
//

#ifndef ZFMMacro_h
#define ZFMMacro_h

///----------------------
///  APP  Base Setting
///----------------------
#define SCREEN_WIDTH ([[UIScreen mainScreen]bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen]bounds].size.height)

#define kHPercentage(a) (SCREEN_HEIGHT*((a)/667.00))
#define kWPercentage(a) (SCREEN_WIDTH *((a)/375.00))

#define kPageScrollHeight kHPercentage(44.0)

///----------------------
///   适配iOS & iPhoneX
///----------------------
#define iPhoneX [UIScreen mainScreen].bounds.size.height==812

#define kStateBarH  (iPhoneX ? 44.00 : 20.00)
#define kNavH       (kStateBarH + 44)
#define kTabBarH    (iPhoneX ? 83 : 49)

///----------------------
///  Weakify & Strongify
///----------------------
#ifndef weakify
#if DEBUG
#if __has_feature(objc_arc)
#define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif

#ifndef strongify
#if DEBUG
#if __has_feature(objc_arc)
#define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
#endif
#else
#if __has_feature(objc_arc)
#define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
#endif
#endif
#endif

///--------------
///  线程执行方法
///--------------
#define Foreground_Begin  dispatch_async(dispatch_get_main_queue(), ^{
#define Foreground_End    });

#define Background_Begin  dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{\
@autoreleasepool {
#define Background_End          }\
});


#endif /* ZFMMacro_h */
