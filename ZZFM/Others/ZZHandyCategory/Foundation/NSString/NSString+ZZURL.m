//
//  NSString+ZZURL.m
//  ZZHandyCategory
//
//  Created by donews on 2018/7/20.
//  Copyright © 2018年 donews. All rights reserved.
//

#import "NSString+ZZURL.h"

@implementation NSString (ZZURL)

- (NSDictionary *)zz_URLQueryParams
{
    NSMutableDictionary *resultDictionary = [[NSMutableDictionary alloc] init];
    
    NSArray *components = [self componentsSeparatedByString:@"&"];
    [components enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:[NSString class]]) {
            NSArray *param = [obj componentsSeparatedByString:@"="];
            if ([param count] == 2) {
                NSString *key = param[0];
                NSString *encodedValue = param[1];
                
                NSString *decodeString = [encodedValue stringByRemovingPercentEncoding];
                resultDictionary[key] = decodeString;
            }
        }
    }];
    return resultDictionary;
}

@end
