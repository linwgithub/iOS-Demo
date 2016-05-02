//
//  ViewController.m
//  07-展示大图、缩放
//
//  Created by linw on 16/5/2.
//  Copyright © 2016年 linw. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *showScrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //设置课件内容大小
//    self.showScrollView.frame = self.view.bounds;
    //设置内容大小
    self.showScrollView.contentSize = CGSizeMake(892, 632);
    //设置边距
    //UIEdgeInsetsMake(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right)
    self.showScrollView.contentInset = UIEdgeInsetsMake(80, 40, 80, 160);
    //设置开始位置
    self.showScrollView.contentOffset = CGPointMake(100, 100);
    //取消弹簧效果
    self.showScrollView.bounces = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
