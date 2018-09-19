//
//  ZFMAlbumDetailRequest.h
//  ZZFM
//
//  Created by donews on 2018/9/18.
//  Copyright © 2018年 donews. All rights reserved.
//

#import "ZFMBaseRequest.h"

@interface ZFMAlbumDetailRequest : ZFMBaseRequest

/// 专辑id
@property (nonatomic, assign) NSInteger albumId;
/// 专辑对应分集数据的id
@property (nonatomic, assign) NSInteger trackId;
/// tab名称
@property (nonatomic, copy) NSString *tab;
/// 子名称
@property (nonatomic, copy) NSString *statModule;
@property (nonatomic, copy) NSString *statPage;
@property (nonatomic, copy) NSString *statEvent;
@property (nonatomic, assign) NSInteger statPosition;




/**
 *  请求专辑详情
 *  tab@订阅听_推荐
 *  @param albumId    专辑id
 *  @param tab        tab名称
 *  @param stat       子名称
 *  @param completion 完成回调
 */
//+ (void)requestAlbumDetail:(NSInteger)albumId tab:(NSString *)tab stat:(NSString *)stat position:(NSInteger)position completion:(XMLYBaseAPICompletion)completion {
//    NSMutableDictionary *params = [self params];
//    [params setObject:@(albumId) forKey:@"albumId"];
//    [params setObject:[NSString stringWithFormat:@"pageview/album@%ld",(long)albumId] forKey:@"statEvent"];
//    [params setObject:stat forKey:@"statModule"];
//    [params setObject:[NSString stringWithFormat:@"tab@%@_%@",tab,stat] forKey:@"statPage"];
//    [params setObject:@(position) forKey:@"statPosition"];
//
//    XMLYBaseRequest *request = [XMLYBaseRequest requestWithURL:kAlbumDetailAPI];
//    [request startWithMethod:XMLYHTTPTypeGET params:params completion:^(id responseObject, NSString *message, BOOL success) {
//        if(completion){
//            completion(responseObject,message,success);
//        }
//    }];
//
//}

@end
