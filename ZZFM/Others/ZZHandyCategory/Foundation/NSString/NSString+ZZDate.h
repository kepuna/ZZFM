//
//  NSString+ZZDate.h
//  ZZHandyCategory
//
//  Created by donews on 2018/7/20.
//  Copyright © 2018年 donews. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ZZDate)

/** RFC3339时间格式创建NSDate */
- (NSDate *)zz_dateFromRFC3339;
/** 将时间戳转换成具体的时间描述 */
- (NSString *)zz_fromTimeStampToDetailDesc;

//-------------
// Class Method
//-------------

/** 传入秒数返回 HH:mm:ss 格式字符串 */
+ (NSString *)zz_stringHMSWithSecond:(NSUInteger)second;
/** 传入秒数返回 mm:ss 格式字符串 */
+ (NSString *)zz_stringMSWithSecond:(NSUInteger)second;


@end
