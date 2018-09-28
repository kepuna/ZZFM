//
//  ZFMPLayViewController.h
//  ZZFM
//
//  Created by donews on 2018/9/26.
//  Copyright © 2018年 donews. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZFMPLayViewController : UIViewController

/// 单利对象
+ (instancetype)sharedInstance;
- (void)startPlayWithAlbumID:(NSString *)albumID trackID:(NSString *)trackID cachePath:(NSString *)cachePath;

@end
