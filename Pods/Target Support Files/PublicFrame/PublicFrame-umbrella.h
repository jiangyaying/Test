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

#import "JHAdaptor.h"
#import "UIView+PublicLayout.h"

FOUNDATION_EXPORT double PublicFrameVersionNumber;
FOUNDATION_EXPORT const unsigned char PublicFrameVersionString[];

