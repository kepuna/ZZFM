//
//  ZFMColorManager.m
//  ZZFM
//
//  Created by donews on 2018/8/14.
//  Copyright © 2018年 donews. All rights reserved.
//

#import "ZFMColorManager.h"

NSString * const DNColorMainPage = @"DNColorMainPage";
NSString * const DNColorButtonTitleNormal = @"DNColorButtonTitleNormal";
NSString * const DNColorButtonBackground = @"DNColorButtonBackground";
NSString * const DNImageNavBackIcon = @"DNImageNavBackIcon";

@implementation ZFMColorManager

#pragma mark - Intial Methods
+ (instancetype)manager {
    static ZFMColorManager *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _colorMainPage = [self _colorWithHexString:@"FFFFFF"];
        _colorNavBackground = [self _colorWithHexString:@"09A55A"];
        _colorNavTitle = [self _colorWithHexString:@"FFFFFF"];
        _colorTabBarBackground = [UIColor darkTextColor];
        _colorTabBarItemNormal = [self _colorWithHexString:@"969696"];
        _colorTabBarItemSeleted = [self _colorWithHexString:@"09A55A"];
        _colorPlaceholder = [self _colorWithHexString:@"ECECEC"];
        _colorPageScrollSelected = [self _colorWithHexString:@"09A55A"];
        _colorPageScrollNormal = [self _colorWithHexString:@"969696"];
        _colorLine = [self _colorWithHexString:@"e6e6e6"];
        _colorBlack32 = [self _colorWithHexString:@"323232"];
        _colorGray96 = [self _colorWithHexString:@"969696"];
    }
    return self;
}

#pragma mark - Private Methods
- (UIColor *)_colorWithHexString:(NSString *)hexString {
    
    NSString *colorString = [[hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    if (colorString.length < 6) {
        return [UIColor clearColor];
    }
    
    if ([colorString hasPrefix:@"0X"]) {
        colorString = [colorString substringFromIndex:2];
    }
    
    if ([colorString hasPrefix:@"#"]) {
        colorString = [colorString substringFromIndex:1];
    }
    
    if (colorString.length != 6) {
        return [UIColor clearColor];
    }
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    // r
    NSString *rString = [colorString substringWithRange:range];
    
    // g
    range.location = 2;
    NSString *gString = [colorString substringWithRange:range];
    
    // b
    range.location = 4;
    NSString *bString = [colorString substringWithRange:range];
    
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:(float)r / 255.0 green:(float)g / 255.0 blue:(float)b / 255.0 alpha:1.0];
}

- (UIColor *)_colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha{
    return [[self _colorWithHexString:hexString] colorWithAlphaComponent:alpha];
}

@end
