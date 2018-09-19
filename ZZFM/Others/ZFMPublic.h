//
//  ZFMPublic.h
//  ZZFM
//
//  Created by donews on 2018/8/14.
//  Copyright © 2018年 donews. All rights reserved.
//

#ifndef ZFMPublic_h
#define ZFMPublic_h

//-----------
// Category
//-----------
#import "UIView+JAExt.h"
#import "UIImage+ZZAdd.h"
#import "UIImageView+TGCache.h"
#import "UIButton+TitlePlace.h"
#import "NSObject+UIViewController.h"

#import "ZFMConsts.h"
#import "ZFMMacro.h"
#import "ZFMColorManager.h"
#import "ZFMFontManager.h"

//====================
//  Refrence Third Lib
//====================
#if __has_include(<YYModel/YYModel.h>)
#import <YYModel/YYModel.h>
#else
#import "YYModel.h"
#endif

#if __has_include(<DDSkin/UIView+DDSkin.h>)
#import <DDSkin/UIView+DDSkin.h>
#else
#import "UIView+DDSkin.h"
#endif

#if __has_include(<ReactiveCocoa/ReactiveCocoa.h>)
#import <ReactiveCocoa/ReactiveCocoa.h>
#else
#import "ReactiveCocoa.h"
#endif



#endif /* ZFMPublic_h */
