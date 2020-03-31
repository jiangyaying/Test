
//
//  TestClass.m
//  Test
//
//  Created by jiang on 2020/3/19.
//  Copyright © 2020 jiang. All rights reserved.
//

#import "TestClass.h"
#import <objc/runtime.h>

@implementation TestClass

static id obj = nil;
+ (TestClass *)shareObject{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        obj = [[TestClass alloc] init];
    });
    return obj;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
//        [self createThreads];
    }
    return self;
}

- (void)createThreads{
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(showName:) object:@"我是参数"];
    [thread start];
    thread.name = @"NSThread线程";
    thread.threadPriority = 1;
    [thread cancel];
    [NSThread detachNewThreadSelector:@selector(showName:) toTarget:self withObject:@"构造器方式"];
    //在当前线程，延迟1s执行,会在内部创建一个NSTimer，然后添加到当前线程的RunLoop中。如果当前线程没有开启runloop，方法会失效
    [self performSelector:@selector(showAge) withObject:nil afterDelay:1];
    //回到主线程，是否将该回调方法执行完再执行后面的代码
    [self performSelectorOnMainThread:@selector(showAge) withObject:nil waitUntilDone:YES];
    //开辟子线程
    [self performSelectorInBackground:@selector(showAge) withObject:nil];
  
}

- (void)showAge{
    NSLog(@"24");
}

- (void)showName:(NSString *)aName{
    NSLog(@"name is %@", aName);
}

- (void)showSizeWithWidth:(float)aWidth andHeight:(float)aHeight{
    NSLog(@"size is %.2f * %.2f", aWidth, aHeight);
}

- (float)getHeight{
    return 187.5f;
}

- (NSString *)getInfo{
    return @"Hi, my name is Dave Ping";
}

@end
