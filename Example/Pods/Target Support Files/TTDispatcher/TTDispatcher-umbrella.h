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

#import "TTDispatcher.h"
#import "TTDispatcherExchange.h"
#import "TTDispatcherManager.h"
#import "UIApplication+Dispatcher.h"

FOUNDATION_EXPORT double TTDispatcherVersionNumber;
FOUNDATION_EXPORT const unsigned char TTDispatcherVersionString[];

