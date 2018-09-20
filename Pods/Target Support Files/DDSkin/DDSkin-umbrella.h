#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "DDSkinCore.h"
#import "DDSkinHandler.h"
#import "DDSkinMacros.h"
#import "DDSkinManager.h"
#import "DDSkinDefaultStorage.h"
#import "DDSkinDefaultStorageParser.h"
#import "DDSkinStorage.h"
#import "DDSkinStorageImageItem.h"
#import "DDSkinStorageParserHelper.h"
#import "CALayer+DDSkin.h"
#import "DDSkinUIMacros.h"
#import "UIActivityIndicatorView+DDSkin.h"
#import "UIButton+DDSkin.h"
#import "UIImageView+DDSkin.h"
#import "UILabel+DDSkin.h"
#import "UINavigationBar+DDSkin.h"
#import "UIPageControl+DDSkin.h"
#import "UIProgressView+DDSkin.h"
#import "UIScrollView+DDSkin.h"
#import "UISlider+DDSkin.h"
#import "UISwitch+DDSkin.h"
#import "UITabBar+DDSkin.h"
#import "UITableView+DDSkin.h"
#import "UITableViewCell+DDSkin.h"
#import "UITextField+DDSkin.h"
#import "UITextView+DDSkin.h"
#import "UIToolbar+DDSkin.h"
#import "UIView+DDSkin.h"

FOUNDATION_EXPORT double DDSkinVersionNumber;
FOUNDATION_EXPORT const unsigned char DDSkinVersionString[];

