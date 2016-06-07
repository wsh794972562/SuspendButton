//
//  ViewController.m
//  添加悬浮按钮
//
//  Created by wsh on 16/6/7.
//  Copyright © 2016年 wsh. All rights reserved.
//

#import "ViewController.h"
#import "SecondTableViewController.h"

#define KWidth ([UIScreen mainScreen].bounds.size.width)
#define KHeight ([UIScreen mainScreen].bounds.size.height)
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake((KWidth - 300) / 2.0, 200, 300, 20)];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"跳转到下一层";
    [self.view addSubview:label];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doTap)];
    [self.view addGestureRecognizer:tap];
}

- (void)doTap {
    SecondTableViewController *tableVC = [[SecondTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    [self.navigationController pushViewController:tableVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
