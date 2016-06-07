//
//  SecondTableViewController.m
//  添加悬浮按钮
//
//  @Author: wsh on 16/6/7.
//  Copyright © 2016年 wsh. All rights reserved.
//

#import "SecondTableViewController.h"
#import "UIButton+NMCategory.h"

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
static NSString * const CellReuseIdentifier = @"123";
@interface SecondTableViewController ()
@property (nonatomic, strong) UIButton *btn;
@end

@implementation SecondTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellReuseIdentifier];
    self.tableView.backgroundColor = [UIColor whiteColor];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.y < 128 && self.btn) {
        [self.btn removeFromSuperview];
        self.btn = nil;
    } else {
        if (self.btn == nil && scrollView.contentOffset.y > 128) {
            [self addButtonToTop];
        }
    }
}

- (void)addButtonToTop {
    _btn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 65, SCREEN_HEIGHT - 64 - 60,60, 60)];
    _btn.backgroundColor = [UIColor redColor];
    _btn.layer.cornerRadius = 8;
    [_btn setDragEnable:YES];
    [_btn setAdsorbEnable:YES];
    [[[UIApplication sharedApplication].windows lastObject] addSubview:_btn];
    [_btn addTarget:self action:@selector(showTag:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)showTag:(UIButton *)sender {
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellReuseIdentifier forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"这是第%ld行第%ld个",(long)indexPath.section,(long)indexPath.item];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
