//
//  ZFMHomeService.h
//  ZZFM
//
//  Created by donews on 2018/7/24.
//  Copyright © 2018年 donews. All rights reserved.
//

#import <Foundation/Foundation.h>

#if __has_include(<CTNetworking/CTNetworking.h>)
#import <CTNetworking/CTNetworking.h>
#else
#import "CTNetworking.h"
#endif

@interface ZFMHomeService : NSObject <CTServiceProtocol>

@end
