//
//  ViewController.m
//  Test
//
//  Created by jiang on 2020/3/16.
//  Copyright © 2020 jiang. All rights reserved.
//

#import "ViewController.h"
#import <TestViewController.h>
#import <SecondViewController.h>
#import <UIView+PublicLayout.h>
#define  TIMES 1000000
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self testRuntime];
    // Do any additional setup after loading the view.
}

- (void)testRuntime{
//    1. OSSpinLock(自旋锁)
//    2.os_unfair_lock（互斥锁）
//    3.dispatch_semaphore(信号量)
//    4.pthread_mutex(互斥锁)
//    5.NSLock(互斥锁、对象锁)
//    6.NSCondition(条件锁、对象锁)
//    7.NSConditionLock(条件锁、对象锁)
//    8.NSRecursiveLock(递归锁、对象锁)
//    9@synchronized()递归锁
//    10pthread_mutex(recursive)递归锁
//
//    1.自旋锁
//    自旋锁的特点是在没有获取到锁时即锁已经被添加，还没有被解开时
//    OSSpinLock处于忙等待状态，一直占用CPU资源
//    由于线程调度，每条线程的分配时间权重不一样，当权重小的线程先进入OSSpinLock优先加锁，
//    当权重大的线程再来访问，就阻塞在这，可能权重大的线程会一直分配到CPU所以一直会进来，
//    但是因为一直有锁，只能等待，权重小的线程得不到cpu资源分配，所以不会解锁，造成一定程度死锁
//    2.互斥锁
//    在没有获取到锁时，即锁已经被添加，还没有被解开时
//    他们都会让当前线程进入休眠状态不占用CPU资源，互斥锁比自旋锁效率低，原因是因为休眠
//    以及唤醒休眠，比忙等待更加消耗CPU资源
//    3.条件锁
//    在一定条件下，让其等待休眠，并放开锁，等接收到信号或者广播，会从新唤起线程，并重新加锁
//    4.递归锁
//    同一线程可以加多把锁。相同的线程访问一段代码，如果加锁的可以继续加锁往下走，不同线程访问这段代码时，有锁要等待，得等待所有锁解开之后才可以继续往下走

    CFAbsoluteTime start = CFAbsoluteTimeGetCurrent();
    for (int i = 0; i < TIMES; i++) {
        [TestClass shareObject];
    }
    CFAbsoluteTime end = CFAbsoluteTimeGetCurrent();
    NSLog(@"dispatch_once_t run time:%fs", end - start);
    
    start = CFAbsoluteTimeGetCurrent();
    for (int i = 0; i < TIMES; i++) {
        [TestTwoClass shareObject];
    }
    end = CFAbsoluteTimeGetCurrent();
    NSLog(@"@synchronized run time %fs",end - start);
}

- (void)click:(UIButton *)button{
    TestViewController *test = [[TestViewController alloc] init];
//    [test testData:@"测试成功"];
    [test refreshData:@"测试测试测试"];
    [self presentViewController:test animated:YES completion:nil];
}
@end
