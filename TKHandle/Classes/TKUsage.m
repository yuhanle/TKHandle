//
//  TKUsage.m
//  TKHandle
//
//  Created by Thinker Wen on 2020/2/19.
//

#import "TKUsage.h"
#import "TKHandle-Swift.h"

@implementation TKUsage

- (void)usage {
  [LLSEventTracking enterPage:@"in" category:@"usage" extra:@{}];
}

@end
