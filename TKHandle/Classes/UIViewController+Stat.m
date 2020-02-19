//
//  UIViewController+Stat.m
//  Pods-TKHandle_Example
//
//  Created by Thinker Wen on 2020/2/19.
//

#import <objc/runtime.h>
#import "UIViewController+Stat.h"

#if __has_include("TKHandle-Swift.h")
    #import "TKHandle-Swift.h"
#else
    #import <TKHandle/TKHandle-Swift.h>
#endif

@implementation UIViewController (Stat)

+ (void)load {
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    Class class = [self class];

    // When swizzling a class method, use the following:
    // Class class = object_getClass((id)self);

    SEL originalSelector = @selector(viewWillAppear:);
    SEL swizzledSelector = @selector(tk_viewWillAppear:);

    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);

    BOOL didAddMethod =
    class_addMethod(class,
                    originalSelector,
                    method_getImplementation(swizzledMethod),
                    method_getTypeEncoding(swizzledMethod));

    if (didAddMethod) {
      class_replaceMethod(class,
                          swizzledSelector,
                          method_getImplementation(originalMethod),
                          method_getTypeEncoding(originalMethod));
    } else {
      method_exchangeImplementations(originalMethod, swizzledMethod);
    }
  });
}

#pragma mark - Method Swizzling

- (void)tk_viewWillAppear:(BOOL)animated {
  [self tk_viewWillAppear:animated];

  SEL customSel = NSSelectorFromString(@"tk_pageName");
  if ([self respondsToSelector:customSel]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    NSString *pageName = [self performSelector:customSel withObject:nil];
#pragma clang diagnostic pop
    NSArray *names = [pageName componentsSeparatedByString:@"."];
#if DEBUG
    NSLog(@"page view in %@", pageName);
#endif

    NSDictionary *extra = nil;
    SEL extraSel = NSSelectorFromString(@"tk_extra");
    if ([self respondsToSelector:extraSel]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
      extra = [self performSelector:extraSel withObject:nil];
#pragma clang diagnostic pop
#if DEBUG
      NSLog(@"page view extra %@", extra);
#endif
    }

    [LLSEventTracking enterPage:[names lastObject] category:[names firstObject] extra:extra];
  }
}

@end
