//
//  NSString+ZZDate.m
//  ZZHandyCategory
//
//  Created by donews on 2018/7/20.
//  Copyright © 2018年 donews. All rights reserved.
//

#import "NSString+ZZDate.h"
#import "NSDate+ZZString.h"

@implementation NSString (ZZDate)

- (NSDate *)zz_dateFromRFC3339 {
    NSDateFormatter *rfc3339DateFormatter = [[NSDateFormatter alloc] init];
    rfc3339DateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss.SSSSSS";
    //    rfc3339DateFormatter.timeZone = [NSTimeZone systemTimeZone];
    //    rfc3339DateFormatter.locale = [NSLocale currentLocale];
    NSDate *result = [rfc3339DateFormatter dateFromString:self];
    return result;
}

- (NSString *)zz_fromTimeStampToDetailDesc {
    if (!self || [self length] == 0 ) { // 字符串为空判断
        return @"";
    }
    
    NSTimeInterval interval = [self doubleValue]; // 把时间戳转化成时间
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval];
    NSDateFormatter *objDateformat = [[NSDateFormatter alloc] init];
    [objDateformat setDateFormat:@"EEE MMM dd HH:mm:ss Z yyyy"];
    NSString * timeStr = [NSString stringWithFormat:@"%@",[objDateformat stringFromDate: date]];
    
    NSDateFormatter *dFM = [[NSDateFormatter alloc] init];
    dFM.dateFormat = @"EEE MMM dd HH:mm:ss Z yyyy";
    
    NSDate *createDate = [dFM dateFromString:timeStr];// 获取具体时间
    if (createDate.zz_isThisYear) {//是今年
        if (createDate.zz_isToday) {//是今天
            NSDateComponents *components = [createDate zz_deltaWithNow];
            
            if (components.hour > 1) {//至少是一小时前发的
                return [NSString stringWithFormat:@"%zd小时前 ",components.hour];
            } else if (components.minute >= 1){//1~59分钟之前发的
                return [NSString stringWithFormat:@"%zd分钟前 ",components.minute];
            } else{//1分钟内发的
                return @"刚刚";
            }
        } else if (createDate.zz_isYesterday) {//z昨天
            dFM.dateFormat = @"昨天 HH:mm";
            return [dFM stringFromDate:createDate];
            
        } else if (createDate.zz_isBeforeYesterday) {//前天
            dFM.dateFormat = @"前天 HH:mm";
            return [dFM stringFromDate:createDate];
        } else if (createDate.zz_isThreeToNineDay) {//三至九天内
            
            return [NSString stringWithFormat:@"%zd天前",createDate.zz_daysBeforToday];
        } else {//十天前
            dFM.dateFormat = @"MM月dd日";
            return [dFM stringFromDate:createDate];
        }
    } else {//非今年
        dFM.dateFormat = @"yyyy年MM月dd日";
        return [dFM stringFromDate:createDate];
    }
}

//-------------
// Class Method
//-------------

+ (NSString *)zz_stringHMSWithSecond:(NSUInteger)second {
    
    NSString *str_hour = [NSString stringWithFormat:@"%02ld", second / 3600];
    NSString *str_minute = [NSString stringWithFormat:@"%02ld", (second % 3600) / 60];
    NSString *str_second = [NSString stringWithFormat:@"%02ld", second % 60];
    return [NSString stringWithFormat:@"%@:%@:%@", str_hour, str_minute, str_second];
}

+ (NSString *)zz_stringMSWithSecond:(NSUInteger)second {
    NSString *str_minute = [NSString stringWithFormat:@"%02ld", second / 60];
    NSString *str_second = [NSString stringWithFormat:@"%02ld", second % 60];
    return [NSString stringWithFormat:@"%@:%@", str_minute, str_second];
}


@end
