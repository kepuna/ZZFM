//
//  NSDate+ZZString.h
//  ZZHandyCategory
//
//  Created by donews on 2018/7/20.
//  Copyright © 2018年 donews. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (ZZString)

- (NSString *)zz_stringWithyyyy_MM_dd_HH_mm_ss;
- (NSString *)zz_stringWithyyyy_MM_dd;
- (NSDate *)zz_dateWithyyyy_MM_dd;

/** 是否为今年 */
- (BOOL)zz_isThisYear;
/** 是否为今天 */
- (BOOL)zz_isToday;
/** 是否为昨天 */
- (BOOL)zz_isYesterday;
/** 是否为前天 */
- (BOOL)zz_isBeforeYesterday;
/** 是否为3-9天内 */
- (BOOL)zz_isThreeToNineDay;
/** 距离现在一个小时以内 */
-(BOOL)zz_isInAnHour;
/** 距今日的时间天数 */
- (NSInteger)zz_daysBeforToday;
/** 获得与当前时间的差距*/
- (NSDateComponents *)zz_deltaWithNow;

@end
