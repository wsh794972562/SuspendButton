# SuspendButton

当加载的数据很多时，手动滑动到顶部不是那么的容易，不利于用户使用，故增加一个回到顶部的按钮，来解决快速回到头部的方案。

# 特性

 .特性A:运用了运行时编程，当我们拖动按钮的时候动态设置其靠左还是靠右。
 
 .特性B:将函数响应式编程的思想运用到项目工程中。

# 原理说明

就是根据滑动的距离动态的在整个工程的window上添加和移除按钮，并计算按钮是靠左还是靠右，不让按钮悬浮于整个屏幕中间影响美观。

# 下载安装

暂无

# 使用方法

只要是继承UIScrollView的子类都可以用这个demo。
步骤：1.将我工程中的 UIButton+NMCategory.m 和 UIButton+NMCategory.h 拖到你的工程中以及利用CocoaPods导入 pod "ReactiveCocoa"
      
      2.在你需要添加按钮的控制器中添加  #import "UIButton+NMCategory.h" 和 #import "ReactiveCocoa.h"
      
      3.添加一个属性 @property (nonatomic, strong) UIButton *btn;
      
      4.具体的就两句代码
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
            [[_btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
            [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
             }];
        }


# 注意事项

# TODO

# License
