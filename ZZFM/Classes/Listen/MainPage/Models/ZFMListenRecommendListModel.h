//
//  ZFMListenRecommendListModel.h
//  ZZFM
//
//  Created by donews on 2018/9/3.
//  Copyright © 2018年 donews. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZFMListenRecommendModel : NSObject

@property (nonatomic, assign) NSInteger albumId;
@property (nonatomic, assign) NSInteger basedRelativeAlbumId;
@property (nonatomic, copy)   NSString  *coverLarge;
@property (nonatomic, copy)   NSString  *coverMiddle;
@property (nonatomic, copy)   NSString  *info;
@property (nonatomic, assign) NSInteger lastUptrackAt;
@property (nonatomic, assign) NSInteger lastUptrackId;
@property (nonatomic, copy)   NSString  *lastUptrackTitle;
@property (nonatomic, copy)   NSString  *nickname;
@property (nonatomic, assign) NSInteger playsCounts;
@property (nonatomic, copy)   NSString  *recReason;
@property (nonatomic, copy)   NSString  *recSrc;
@property (nonatomic, copy)   NSString  *recTrack;
@property (nonatomic, assign) NSInteger serialState;
@property (nonatomic, copy)   NSString  *tags;
@property (nonatomic, copy)   NSString  *title;
@property (nonatomic, assign) NSInteger trackId;
@property (nonatomic, copy)   NSString  *trackTitle;
@property (nonatomic, assign) NSInteger tracks;
@property (nonatomic, assign) NSInteger uid;

@end

@interface ZFMListenRecommendListModel : NSObject

@property (nonatomic, assign) BOOL hasMore;
@property (nonatomic, copy) NSArray *list;

@end
