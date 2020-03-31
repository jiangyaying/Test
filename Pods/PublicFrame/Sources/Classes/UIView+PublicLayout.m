//
//  UIView+PublicLayout.m
//  PublicFrame
//
//  Created by jiang on 2020/3/17.
//  Copyright © 2020 jiang. All rights reserved.
//

#import "UIView+PublicLayout.h"
#import <objc/runtime.h>

static void *topSeparatorLineKey = (void *)@"topSeparatorLine";
static void *bottomSeparatorLineKey = (void *)@"bottomSeparatorLine";

@implementation UIView (PublicLayout)

- (BOOL) containsSubView:(UIView *)subView
{
    for (UIView *view in [self subviews])
    {
        if ([view isEqual:subView])
        {
            return YES;
        }
    }
    return NO;
}

- (BOOL)containsSubViewWithClass:(Class)aClass
{
    for (UIView *view in [self subviews])
    {
        if ([view isMemberOfClass:aClass])
        {
            return YES;
        }
    }
    return NO;
}

- (id)findFirstViewController
{
    UIResponder *baseObject = self;
    while (baseObject.nextResponder)
    {
        baseObject = baseObject.nextResponder;
        if ([baseObject isKindOfClass:[UIViewController class]])
        {
            return baseObject;
        }
    }
    
    return nil;
}

#pragma mark - property method

- (CGPoint)frameOrigin
{
    return self.frame.origin;
}

- (void)setFrameOrigin:(CGPoint)newOrigin
{
    self.frame = CGRectMake(newOrigin.x, newOrigin.y, self.frame.size.width, self.frame.size.height);
}

- (CGSize)frameSize
{
    return self.frame.size;
}

- (void)setFrameSize:(CGSize)newSize
{
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y,
                            newSize.width, newSize.height);
}

- (CGFloat)frameX
{
    return self.frame.origin.x;
}

- (void)setFrameX:(CGFloat)newX
{
    self.frame = CGRectMake(newX, self.frame.origin.y,
                            self.frame.size.width, self.frame.size.height);
}

- (CGFloat)frameY
{
    return self.frame.origin.y;
}

- (void)setFrameY:(CGFloat)newY
{
    self.frame = CGRectMake(self.frame.origin.x, newY,
                            self.frame.size.width, self.frame.size.height);
}

- (CGFloat)frameRight
{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setFrameRight:(CGFloat)newRight
{
    self.frame = CGRectMake(newRight - self.frame.size.width, self.frame.origin.y,
                            self.frame.size.width, self.frame.size.height);
}

- (CGFloat)frameBottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setFrameBottom:(CGFloat)newBottom
{
    self.frame = CGRectMake(self.frame.origin.x, newBottom - self.frame.size.height,
                            self.frame.size.width, self.frame.size.height);
}

- (CGFloat)frameWidth
{
    return self.frame.size.width;
}

- (void)setFrameWidth:(CGFloat)newWidth
{
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y,
                            newWidth, self.frame.size.height);
}

- (CGFloat)frameHeight
{
    return self.frame.size.height;
}

- (void)setFrameHeight:(CGFloat)newHeight
{
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y,
                            self.frame.size.width, newHeight);
}

- (UIView *)topSeparatorLine
{
    return objc_getAssociatedObject(self, topSeparatorLineKey);
}

- (void)setTopSeparatorLine:(UIView *)topSeparatorLine
{
    objc_setAssociatedObject(self, topSeparatorLineKey, topSeparatorLine, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)bottomSeparatorLine
{
    return objc_getAssociatedObject(self, bottomSeparatorLineKey);
}

- (void)setBottomSeparatorLine:(UIView *)bottomSeparatorLine
{
    objc_setAssociatedObject(self, bottomSeparatorLineKey, bottomSeparatorLine, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)addSeparatorLineWithPostion:(LinePosition)position
                              color:(UIColor *)color
{
    [self addSeparatorLineWithLeftMargin:0
                             rightMargin:0
                                   color:color
                                position:position];
}

- (void)addSeparatorLineWithLeftMargin:(float)leftMargin
                           rightMargin:(float)rightMargin
                                 color:(UIColor *)color
                              position:(LinePosition)position
{
    float lineHeight = 1;
    if (!color)
    {
        color = [UIColor lightGrayColor];
    }
    if (position & LinePositionTop)
    {
        if (!self.topSeparatorLine)
        {
            self.topSeparatorLine = [[UIView alloc] init];
        }
        
        self.topSeparatorLine.backgroundColor = color;
        CGRect rect = {self.frameX + leftMargin, 0, self.frameWidth - leftMargin - rightMargin, lineHeight};
        self.topSeparatorLine.frame = rect;
        [self addSubview:self.topSeparatorLine];
    }
    if (position & LinePositionBottom)
    {
        if (!self.bottomSeparatorLine)
        {
            self.bottomSeparatorLine = [[UIView alloc] init];
        }
        
        self.bottomSeparatorLine.backgroundColor = color;
        CGRect rect = {self.frameX + leftMargin, self.frameHeight - lineHeight, self.frameWidth - leftMargin - rightMargin, lineHeight};
        self.bottomSeparatorLine.frame = rect;
        [self addSubview:self.bottomSeparatorLine];
    }
}

- (void)addSeparatorLineWithLeftMargin:(float)leftMargin
                           rightMargin:(float)rightMargin
                               yMargin:(float)yMargin
                                 color:(UIColor *)color {
    float lineHeight = 1;
    if (!color) {
        color = [UIColor lightGrayColor];
    }
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = color;
    CGRect rect = {self.frameX + leftMargin, yMargin, self.frameWidth - leftMargin - rightMargin, lineHeight};
    lineView.frame = rect;
    [self addSubview:lineView];
}

@end
