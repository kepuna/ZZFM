//
//  ZFMFontManager.m
//  ZZFM
//
//  Created by donews on 2018/8/14.
//  Copyright © 2018年 donews. All rights reserved.
//

#import "ZFMFontManager.h"

@implementation ZFMFontManager

#pragma mark - Intial Methods
+ (instancetype)manager {
    static ZFMFontManager *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _fontSizeTabBar = @"fontSizeTabBar";
        _fontSizeNavTitle = @"fontSizeNavTitle";
        _size11PingFangSC_Medium = [UIFont fontWithName:@"PingFangSC-Medium" size:11];
        _size12PingFangSC_Medium = [UIFont fontWithName:@"PingFangSC-Medium" size:12];
        _size14PingFangSC_Medium = [UIFont fontWithName:@"PingFangSC-Medium" size:14];
        _size15PingFangSC_Medium = [UIFont fontWithName:@"PingFangSC-Medium" size:15];
        _size16PingFangSC_Medium = [UIFont fontWithName:@"PingFangSC-Medium" size:16];
        _size17PingFangSC_Medium = [UIFont fontWithName:@"PingFangSC-Medium" size:17];
        _size18PingFangSC_Medium = [UIFont fontWithName:@"PingFangSC-Medium" size:18];
        _size19PingFangSC_Medium = [UIFont fontWithName:@"PingFangSC-Medium" size:19];
        _size36PingFangSC_Medium = [UIFont fontWithName:@"PingFangSC-Medium" size:36];
        _size50PingFangSC_Medium = [UIFont fontWithName:@"PingFangSC-Medium" size:50];
        
        
        _size12PingFangSC_Regular = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        _size13PingFangSC_Regular = [UIFont fontWithName:@"PingFangSC-Regular" size:13];
        _size14PingFangSC_Regular = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
        _size15PingFangSC_Regular = [UIFont fontWithName:@"PingFangSC-Regular" size:15];
        _size16PingFangSC_Regular = [UIFont fontWithName:@"PingFangSC-Regular" size:16];
        _size17PingFangSC_Regular = [UIFont fontWithName:@"PingFangSC-Regular" size:17];
        _size18PingFangSC_Regular = [UIFont fontWithName:@"PingFangSC-Regular" size:18];
        _size19PingFangSC_Regular = [UIFont fontWithName:@"PingFangSC-Regular" size:19];
        _size20PingFangSC_Regular = [UIFont fontWithName:@"PingFangSC-Regular" size:20];
        
    }
    return self;
}

@end
