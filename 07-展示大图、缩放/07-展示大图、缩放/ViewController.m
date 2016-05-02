//
//  ViewController.m
//  07-展示大图、缩放
//
//  Created by linw on 16/5/2.
//  Copyright © 2016年 linw. All rights reserved.
//

#import "ViewController.h"


@interface ViewController () <UIScrollViewDelegate>//遵守协议
@property (weak, nonatomic) IBOutlet UIScrollView *showScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *centerImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //设置课件内容大小
    self.showScrollView.frame = self.view.bounds;
    //设置内容大小
    self.showScrollView.contentSize = CGSizeMake(892, 632);
    //设置边距
    //UIEdgeInsetsMake(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right)
    self.showScrollView.contentInset = UIEdgeInsetsMake(80, 40, 80, 160);
    //设置开始位置
    self.showScrollView.contentOffset = CGPointMake(100, 100);
    //取消弹簧效果
    self.showScrollView.bounces = NO;
    //设置代理
    self.showScrollView.delegate = self;
    //设置缩放比例
    self.showScrollView.maximumZoomScale = 3.0;
    self.showScrollView.minimumZoomScale = 0.2;
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    //返回缩放的控件
//    return [self.showScrollView.subviews lastObject];
    return self.centerImageView;
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    NSLog(@"结束拖拽");
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"正在滚动");
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    NSLog(@"开始拖拽");
}

-(void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    NSLog(@"正在缩放");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
