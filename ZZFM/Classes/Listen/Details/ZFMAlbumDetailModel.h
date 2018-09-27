//
//  ZFMAlbumDetailModel.h
//  ZZFM
//
//  Created by donews on 2018/9/19.
//  Copyright © 2018年 donews. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#pragma mark - 内容简介的模型
@interface ZFMAlbumIntroModel : NSObject

/// 专辑简介id
@property (nonatomic, assign) NSInteger albumId;
/// 简介富文本 h5形式
@property (nonatomic, copy) NSString *introRich;
/// 简介文本
@property (nonatomic, copy) NSString *intro;
/// tags
@property (nonatomic, copy) NSString *tags;
/// 该专辑Vip是否免费 0免费 1不免费
@property (nonatomic, assign) BOOL vipFreeType;

@end

#pragma mark - 相关推荐列表Item的模型
@interface ZFMAlbumRecsItemModel : NSObject

/// 专辑id
@property (nonatomic, copy) NSString *albumId;
/// 专辑下对分集的id
@property (nonatomic, copy) NSString *trackId;
/// 专辑对应的主播id
@property (nonatomic, assign) NSInteger uid;
/// 标题
@property (nonatomic, copy) NSString *title;
/// 专辑标题
@property (nonatomic, copy) NSString *albumTitle;
/// 小图封面链接
@property (nonatomic, copy) NSString *coverSmall;
/// 中图封面链接
@property (nonatomic, copy) NSString *coverMiddle;
/// 所属类别
@property (nonatomic, copy) NSString *categoryName;
/// 主播昵称
@property (nonatomic, copy) NSString *nickname;
/// 创建日期的时间戳
@property (nonatomic, copy) NSString *createdAt;
/// 最新更新日期的时间戳
@property (nonatomic, copy) NSString *updateAt;
/// 简介
@property (nonatomic, copy) NSString *intro;
/// 列表数量
@property (nonatomic, assign) NSInteger tracks;
/// 播放次数
@property (nonatomic, copy) NSString *playtimes;
/// 音频时长
@property (nonatomic, copy) NSString *duration;
/// 顺序号
@property (nonatomic, copy) NSString *orderNo;
/// 是否需要购买
@property (nonatomic, assign) BOOL isPaid;
@property (nonatomic, assign) NSInteger priceTypeId;
/// 价格
@property (nonatomic, copy)   NSString  *displayPrice;
@property (nonatomic, copy)   NSString  *displayDiscountedPrice;
@property (nonatomic, assign) NSInteger totalTrackCount;
@property (nonatomic, assign) CGFloat   price;
@property (nonatomic, assign) CGFloat   discountedPrice;
@property (nonatomic, assign) CGFloat   score;
/// 评论数
@property (nonatomic, copy) NSString *comments;
@property (nonatomic, copy) NSString  *recSrc;
@property (nonatomic, copy) NSString  *recTrack;
@property (nonatomic, assign) NSInteger priceTypeEnum;
/// 标签
@property (nonatomic, copy) NSString *tags;

/// 下载资源的大小
@property (nonatomic, assign) NSUInteger downloadAacSize;
/// 下载资源m4a路径
@property (nonatomic, copy) NSString *downloadAacUrl;
/// 下载资源的大小
@property (nonatomic, assign) NSUInteger downloadSize;
/// 下载资源AAC路径
@property (nonatomic, copy) NSString *downloadUrl;
/// 播放路径
@property (nonatomic, copy) NSString *playPathAacv164;
/// 播放路径
@property (nonatomic, copy) NSString *playPathAacv224;
/// 播放路径 mp3
@property (nonatomic, copy) NSString *playUrl32;
/// 播放路径 mp3
@property (nonatomic, copy) NSString *playUrl64;

/// 短富文本简介
@property (nonatomic, copy) NSString *shortRichIntro;

@end

#pragma mark - 相关推荐的模型
@interface ZFMAlbumRecsModel : NSObject

@property (nonatomic, strong) NSMutableArray<ZFMAlbumRecsItemModel *> *list;
@property (nonatomic, assign) NSInteger pageId;
@property (nonatomic, assign) NSInteger pageSize;
@property (nonatomic, assign) NSInteger maxPageId;
@property (nonatomic, assign) NSInteger totalCount;

@end

#pragma mark - 主播信息模型
@interface ZFMAlbumAnchorModel : NSObject

/// 主播id
@property (nonatomic, assign) NSInteger uid;
/// 鲜花数
@property (nonatomic, assign) NSInteger followers;
/// 关注人数
@property (nonatomic, assign) NSInteger followings;
/// 分集数
@property (nonatomic, assign) NSInteger tracks;
/// 专辑数量
@property (nonatomic, assign) NSInteger albums;
/// 主播昵称
@property (nonatomic, copy) NSString *nickname;
/// 小logo
@property (nonatomic, copy) NSString *smallLogo;
/// 描述
@property (nonatomic, copy) NSString *personDescribe;
/// 签名
@property (nonatomic, copy) NSString *personalSignature;
/// 是否已认证
@property (nonatomic, assign) BOOL isVerified;
/// 是否已关注
@property (nonatomic, assign) BOOL isFollowed;

@end

@interface ZFMAlbumCommentInfoModel : NSObject

/// 评论列表
@property (nonatomic, copy) NSArray <ZFMAlbumCommentInfoModel *> *list;
/// 评论内容
@property (nonatomic, copy) NSString *content;
/// 发布评论时间戳
@property (nonatomic, copy) NSString *createdAt;
/// 评论id
@property (nonatomic, copy) NSString *cId;
/// 关联的trackUid
@property (nonatomic, copy) NSString *trackUid;
/// 是否已点赞
@property (nonatomic, copy) NSString *liked;
/// 点赞数
@property (nonatomic, copy) NSString *likes;
/// 评论者昵称
@property (nonatomic, copy) NSString *nickname;
/// 评论者头像
@property (nonatomic, copy) NSString *smallHeader;
/// 评论的回复数量
@property (nonatomic, assign) NSInteger replyCount;

@end

@interface ZFMAlbumDetailModel : NSObject

/// 内容简介的模型
@property (nonatomic, strong) ZFMAlbumIntroModel *detail;
/// 相关推荐的模型 / 分集列表模型
@property (nonatomic, strong) ZFMAlbumRecsModel *recs;
/// 主播信息模型
@property (nonatomic, strong) ZFMAlbumAnchorModel *user;
/// 专辑简介的模型
@property (nonatomic, strong) ZFMAlbumRecsItemModel *album;
/// 标签
@property (nonatomic, copy) NSString *viewTab;

@end
