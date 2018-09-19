//
//  ZFMAlbumDetailViewModel.m
//  ZZFM
//
//  Created by donews on 2018/9/19.
//  Copyright © 2018年 donews. All rights reserved.
//

#import "ZFMAlbumDetailViewModel.h"
#import "ZFMAlbumDetailRequest.h"
#import "ZFMAlbumDetailModel.h"
#import "ZFMPublic.h"

@implementation ZFMAlbumDetailViewModel

- (RACSignal *)requestAlbumDetail:(ZFMAlbumDetailRequest *)request {
    
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [request requestData:^(BOOL isSuccess, ZFMResponseModel *responseModel, NSError *error) {
            if (error) {
                [subscriber sendError:error];
            } else {
                if (!isSuccess) {
                    [subscriber sendError:error];
                }
                ZFMAlbumDetailModel *model = [ZFMAlbumDetailModel yy_modelWithDictionary:responseModel.data];
                [subscriber sendNext:model];
            }
        }];
        return nil;
    }];
}

- (RACSignal *)requestAlbumTrackList:(ZFMAlbumDetailRequest *)request {
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [request requestData:^(BOOL isSuccess, ZFMResponseModel *responseModel, NSError *error) {
            if (error) {
                [subscriber sendError:error];
            } else {
                if (!isSuccess) {
                    [subscriber sendError:error];
                }
                ZFMAlbumDetailModel *model = [ZFMAlbumDetailModel yy_modelWithDictionary:responseModel.data];
                [subscriber sendNext:model];
            }
        }];
        return nil;
    }];
}

@end
