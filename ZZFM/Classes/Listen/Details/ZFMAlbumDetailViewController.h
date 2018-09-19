//
//  ZFMAlbumDetailViewController.h
//  ZZFM
//
//  Created by donews on 2018/9/4.
//  Copyright © 2018年 donews. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZFMAlbumDetailViewController : UIViewController

/// 专辑的id
@property (nonatomic, assign) NSInteger albumId;
/// 专辑对应分集数据的id
@property (nonatomic, assign) NSInteger trackId;

@end
