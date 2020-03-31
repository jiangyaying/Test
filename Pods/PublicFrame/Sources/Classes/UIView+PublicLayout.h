//
//  UIView+PublicLayout.h
//  PublicFrame
//
//  Created by jiang on 2020/3/17.
//  Copyright © 2020 jiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JHAdaptor.h"
NS_ASSUME_NONNULL_BEGIN
#define kAdaptor(length) [JHAdaptor adaptLength:(length)]

#define KAdaptorFontSize(size) [JHAdaptor adaptFontSize:(size)]

#define KFontSize(size)  [UIFont systemFontOfSize:KAdaptorFontSize(size)]

#define KFontBlodSize(size)  [UIFont boldSystemFontOfSize:KAdaptorFontSize(size)]

//判空
#define NULLString(string) ((![string isKindOfClass:[NSString class]])||[string isEqualToString:@""] || (string == nil) || [string isEqualToString:@""] || [string isKindOfClass:[NSNull class]]||[[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0 || [string isEqual:[NSNull null]]|| [string isEqualToString:@"(null)"])
// 颜色
#define HEXCOLOR(hexValue) [UIColor colorWithRed:((CGFloat)((hexValue & 0xFF0000) >> 16))/255.0 green:((CGFloat)((hexValue & 0xFF00) >> 8))/255.0 blue:((CGFloat)(hexValue & 0xFF))/255.0 alpha:1.0]
#define HEXACOLOR(hexValue, alphaValue) [UIColor colorWithRed:((CGFloat)((hexValue & 0xFF0000) >> 16))/255.0 green:((CGFloat)((hexValue & 0xFF00) >> 8))/255.0 blue:((CGFloat)(hexValue & 0xFF))/255.0 alpha:(alphaValue)]
#define RGBCOLOR(r,g,b)     [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define ARGBCOLOR(r,g,b,a)     [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define random(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]
#define randomHeColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))
// 界面
#define MainHeight [UIScreen mainScreen].bounds.size.height
#define MainWidth  [UIScreen mainScreen].bounds.size.width
// 设备
#define iPhone5 (MainWidth == 320 && MainHeight == 568)
#define iPhone6 (MainWidth == 375 && MainHeight == 667)
#define iPhone6P (MainWidth == 414 && MainHeight == 736)
#define isIphoneX_XS (MainWidth == 375 && MainHeight == 812)
#define isIphoneXR_XSMax (MainWidth == 414 && MainHeight == 896)
#define isFullScreen (isIphoneX_XS || isIphoneXR_XSMax)
#define StatusBarHeight (isFullScreen ? 44 : 20)
#define NavigationBarHeight 44
//判断底部高度
#define TabbarHeight (isFullScreen ? (49 + 34) : 49)

#define TabbarSafeBottomMargin (isFullScreen ? 34 : 0)
//判断导航栏高度
#define StatusBarAndNavigationBarHeight (isFullScreen ? 88 : 64)

// 系统
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)
// 是否是iOS 6或者更高版本
#define IS_IOS6_OR_HIGHER       SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"6.0")
// 是否是iOS 7或者更高版本
#define IS_IOS7_OR_HIGHER       SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")
// 是否是iOS 8或者更高版本
#define IS_IOS8_OR_HIGHER       SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0")

#define IS_IOS10_OR_HIGHER      SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"10.0")

#define IS_IOS11_OR_HIGHER      SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"11.0")

typedef enum
{
    LinePositionTop = 0x01,
    LinePositionBottom = 0x02,
}LinePosition;

@interface UIView (PublicLayout)

@property (nonatomic) CGPoint frameOrigin;
@property (nonatomic) CGSize frameSize;

@property (nonatomic) CGFloat frameX;
@property (nonatomic) CGFloat frameY;

@property (nonatomic) CGFloat frameRight;
@property (nonatomic) CGFloat frameBottom;

@property (nonatomic) CGFloat frameWidth;
@property (nonatomic) CGFloat frameHeight;

@property (strong, nonatomic) UIView *topSeparatorLine;
@property (strong, nonatomic) UIView *bottomSeparatorLine;

- (BOOL)containsSubView:(UIView *)subView;
- (BOOL)containsSubViewWithClass:(Class)aClass;
- (UIViewController *)findFirstViewController;

- (void)addSeparatorLineWithPostion:(LinePosition)position
                              color:(UIColor *)color;
- (void)addSeparatorLineWithLeftMargin:(float)leftMargin
                           rightMargin:(float)rightMargin
                                 color:(UIColor *)color
                              position:(LinePosition)position;

- (void)addSeparatorLineWithLeftMargin:(float)leftMargin
                           rightMargin:(float)rightMargin
                               yMargin:(float)yMargin
                                 color:(UIColor *)color;


@end

NS_ASSUME_NONNULL_END
