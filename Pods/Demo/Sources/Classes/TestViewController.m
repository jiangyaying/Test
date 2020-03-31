//
//  TestViewController.m
//  Demo
//
//  Created by jiang on 2020/3/16.
//  Copyright © 2020 jiang. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self refreshData:@"更新版本库"];
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 80, 80)];
    button.backgroundColor = [UIColor blueColor];
    [self.view addSubview:button];
    // Do any additional setup after loading the view.
}

- (void)testData:(NSString *)title{
    NSLog(@"%@", title);
}

- (void)refreshData:(NSString *)data{
    NSLog(@"%@", data);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
