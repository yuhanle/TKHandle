//
//  TKUsage.m
//  TKHandle
//
//  Created by Thinker Wen on 2020/2/19.
//

#import "TKUsage.h"

#if __has_include("TKHandle-Swift.h")
    #import "TKHandle-Swift.h"
#else
    #import <TKHandle/TKHandle-Swift.h>
#endif

@implementation TKUsage

- (void)usage {
  [LLSEventTracking enterPage:@"in" category:@"usage" extra:@{}];
}

@end
