//
//  ZFMBaseViewModel.h
//  ZZFM
//
//  Created by donews on 2018/9/19.
//  Copyright © 2018年 donews. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZFMResponseModel;

typedef void(^ZFMCompletionBlock)(BOOL isSuccess, ZFMResponseModel *responseModel, NSError *error);

@interface ZFMBaseViewModel : NSObject

@end
