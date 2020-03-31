//
//  TestTwoClass.m
//  Test
//
//  Created by jiang on 2020/3/31.
//  Copyright © 2020 jiang. All rights reserved.
//

#import "TestTwoClass.h"

@implementation TestTwoClass
static id obj = nil;
+ (TestTwoClass *)shareObject{
    @synchronized (self) {
        if (!obj) {
            obj = [[TestTwoClass alloc] init];
        }
    }
    return obj;
}

@end
