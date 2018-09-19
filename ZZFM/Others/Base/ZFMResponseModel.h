//
//  ZFMResponseModel.h
//  ZZFM
//
//  Created by donews on 2018/9/18.
//  Copyright © 2018年 donews. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZFMResponseModel : NSObject

/// 状态码 返回0 代表响应成功
@property (nonatomic, assign) NSInteger ret;
/// 提示信息
@property (nonatomic, copy) NSString *msg;
/// 响应结果数据
@property (nonatomic, strong) id data;

@end
