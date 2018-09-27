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
#import "ZFMAlbumTrackListCellFrameModel.h"
#import "ZFMPlayItemRequest.h"
#import "ZFMPlayItemModel.h"

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
                NSMutableArray *frameModels = [NSMutableArray arrayWithCapacity:20];
                for (ZFMAlbumRecsItemModel *itemModel in model.recs.list) {
                    ZFMAlbumTrackListCellFrameModel *frameModel = [[ZFMAlbumTrackListCellFrameModel alloc] initWithModel:itemModel];
                    [frameModels zz_addObject:frameModel];
                }
                self.trackListFrameModels = frameModels.copy;
                [subscriber sendNext:model];
            }
        }];
        return nil;
    }];
}

- (RACSignal *)requestPlayItemDetail:(ZFMPlayItemRequest *)request {
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [request requestData:^(BOOL isSuccess, id responseObject, NSError *error) {
            if (error) {
                [subscriber sendError:error];
            } else {
                if (!isSuccess) {
                    [subscriber sendError:error];
                }
                ZFMPlayItemModel *model = [ZFMPlayItemModel yy_modelWithDictionary:responseObject];
                [subscriber sendNext:model];
            }
        }];
        return nil;
    }];
}

@end
