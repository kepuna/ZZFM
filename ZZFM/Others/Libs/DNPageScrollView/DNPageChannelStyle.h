//
//  DNPageChannelStyle.h
//  Donews
//
//  Created by Jamie on 2017/4/19.
//  Copyright © 2017年 donews. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DNPageChannelStyle : NSObject

/** 是否显示滚动条 默认为NO*/
@property (assign, nonatomic, getter=isShowLine) BOOL showLine;
/** 是否有顶部搜索 默认为NO*/
@property (assign, nonatomic, getter=isShowSearchBar) BOOL showSearchBar;
/** 是否显示阴影遮罩 默认为NO*/
@property (assign, nonatomic, getter=isShadowCover) BOOL shadowCover;
/** 是否显示底部边线 默认为NO*/
@property (assign, nonatomic, getter=isShowBottomLine) BOOL showBottomLine;
/** 是否显示附加的按钮 默认为NO*/
@property (assign, nonatomic, getter=isShowExtraButton) BOOL showExtraButton;
/** 是否滚动标题 默认为YES 设置为NO的时候所有的标题将不会滚动, 并且宽度会平分 和系统的segment效果相似 */
@property (assign, nonatomic, getter=isScrollTitle) BOOL scrollTitle;
/** 当设置scrollTitle=NO的时候标题会平分宽度, 如果你希望在滚动的过程中cover或者scrollLine的宽度随着变化设置这个属性为YES 默认为NO*/
@property (assign, nonatomic, getter=isAdjustCoverOrLineWidth) BOOL adjustCoverOrLineWidth;


/** 滚动条的高度 默认为2 */
@property (assign, nonatomic) CGFloat scrollLineHeight;
/** 滚动条的高度 默认为0(不设置此值时滚动条宽度会自适应标题) */
@property (assign, nonatomic) CGFloat scrollLineWidth;
/** 滚动条的圆角 默认为0(不设置此值时滚动条宽度会自适应标题) */
@property (assign, nonatomic) CGFloat scrollLinecornerRadius;
/** 滚动条的图片 默认为空*/
@property (assign, nonatomic) NSString *scrollLineImageName;
/** 滚动条的图片 默认为选中状态文字颜色*/
@property (assign, nonatomic) UIColor *scrollLineColor;
/** 标题之间的间隙 默认为15.0 */
@property (assign, nonatomic) CGFloat titleMargin;
/** 标题的字体 默认为14 */
@property (strong, nonatomic) UIFont *titleFont;
/** 标题缩放倍数, 默认1.2 */
@property (assign, nonatomic) CGFloat titleBigScale;
/** 标题背景颜色 */
@property (strong, nonatomic) UIColor *channelBackgroundColor;
/** 设置附加按钮的背景颜色 默认为标题背景颜色*/
@property (strong, nonatomic) UIColor *extraButtonBackgroundColor;
/** 底部边线颜色 默认为黑色*/
@property (strong, nonatomic) UIColor *bottomLineBackgroundColor;
/** 标题一般状态的颜色 */
@property (strong, nonatomic) UIColor *normalTitleColor;
/** 标题选中状态的颜色 */
@property (strong, nonatomic) UIColor *selectedTitleColor;
/** 滚动视图背景颜色 */
@property (strong, nonatomic) UIColor *pageViewBackgroundColor;
/** channelVIew的高度 */
@property (assign, nonatomic) CGFloat channelHeight;
/** 底部边线高度的高度 默认为0.5 */
@property (assign, nonatomic) CGFloat bottomLineHeight;
/** 设置附加按钮的背景图片 默认为nil*/
@property (copy, nonatomic) NSString *extraButtonImageName;
/** 设置阴影遮罩的背景图片 默认为nil*/
@property (copy, nonatomic) NSString *shadowCoverImageName;

@property (nonatomic, copy ) NSString *notificationChannelClickName;


@end
