//
//  JHAdaptor.h
//  JHBaseProject
//
//  Created by 流痕 on 16/3/4.
//  Copyright © 2016年 FLZC. All rights reserved.
// 屏幕适配 按机型比例

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
// 设备
//#define iPhone5 (MainWidth == 320 && MainHeight == 568)
//#define iPhone6 (MainWidth == 375 && MainHeight == 667)
//#define iPhone6P (MainWidth == 414 && MainHeight == 736)
//#define isIphoneX_XS (MainWidth == 375 && MainHeight == 812)
//#define isIphoneXR_XSMax (MainWidth == 414 && MainHeight == 896)
//#define isFullScreen (isIphoneX_XS || isIphoneXR_XSMax)
//#define StatusBarHeight (isFullScreen ? 44 : 20)
//#define NavigationBarHeight 44
////判断底部高度
//#define TabbarHeight (isFullScreen ? (49 + 34) : 49)
//
//#define TabbarSafeBottomMargin (isFullScreen ? 34 : 0)
//判断导航栏高度
//#define StatusBarAndNavigationBarHeight (isFullScreen ? 88 : 64)
//5/5s/SE 320*568  宽高比 0.563
//#define iPhone5  ([UIScreen mainScreen].bounds.size.height == 568)
//6/6s/7/8 375*667 宽高比 0.562
//#define iPhone6  ([UIScreen mainScreen].bounds.size.height == 667)
//6/6s/7/8 plus 414*736 宽高比 0.563
//#define iPhone6Plus  ([UIScreen mainScreen].bounds.size.height == 736)
//xr 414 x 896        宽高比0.462
//#define iPhoneXr ([UIScreen mainScreen].bounds.size.height == 736)
//x/xs 375*812  宽高比0.462
//#define iphoneX ([UIScreen mainScreen].bounds.size.height == 812)
//xs Max 414*896        宽高比0.462
//#define iphoneX ([UIScreen mainScreen].bounds.size.height == 812)

@interface JHAdaptor : NSObject

+ (CGFloat)adaptLength:(CGFloat)length;

+ (CGFloat)adaptFontSize:(CGFloat)fontSize;

@end


