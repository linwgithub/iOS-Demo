//
//  ViewController.m
//  08-喜马拉雅
//
//  Created by linw on 16/5/3.
//  Copyright © 2016年 linw. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *mainScrollView;

@property (weak, nonatomic) IBOutlet UIScrollView *titleScrollView;

@property (weak, nonatomic) IBOutlet UIPageControl *titlePageControl;

@property(nonatomic, strong)NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //内容大小
    self.mainScrollView.contentSize = CGSizeMake(0, 770);
    //弹簧效果
    self.mainScrollView.bounces = NO;
    //
    self.mainScrollView.contentOffset = CGPointMake(0, -34);
    
    self.mainScrollView.contentInset = UIEdgeInsetsMake(40, 0, 40, 0);
    self.mainScrollView.showsVerticalScrollIndicator = NO;
    
    self.mainScrollView.delegate = self;
    //添加图片轮播器图片
    float imgW = self.titleScrollView.bounds.size.width;
    float imgH = self.titleScrollView.bounds.size.height;
    float imgY = 0;
    for (int i = 0; i < 5; i++) {
        UIImageView *imageView = [[UIImageView alloc]init];
        //计算X位置
        float imgX = i * imgW;
        imageView.frame = CGRectMake(imgX, imgY, imgW, imgH);
        
        //获得图片
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"img_0%d",i + 1]];
        
        [self.titleScrollView addSubview:imageView];
    }
    //设置图片轮播器内容大小
    self.titleScrollView.contentSize = CGSizeMake(5 * imgW, 0);
    //取消弹簧效果、隐藏滚动条
    self.titleScrollView.bounces = NO;
    self.titleScrollView.showsHorizontalScrollIndicator = NO;
    //分页效果
    self.titleScrollView.pagingEnabled = YES;
    //设置分页总数
    self.titlePageControl.numberOfPages = 5;
    //设置代理
    self.titleScrollView.delegate = self;
 
    //开始轮播
    [self addTimer];
}

/**
 *  添加定时器
 */
- (void)addTimer
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(nextImg) userInfo:nil repeats:YES];
    //添加进程优先级
    [NSRunLoop.currentRunLoop addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)removeTimer
{
    [self.timer invalidate];
    self.timer = nil;
}
/**
 *  下一图片\设置当前pageController位置
 */
- (void)nextImg
{
    int page = 0;
    if (self.titlePageControl.currentPage == 4) {
        page = 0;
    }else{
        page = self.titlePageControl.currentPage + 1;
    }

    //计算滚动位置
    float imgoffX = page * self.titleScrollView.bounds.size.width;
    [self.titleScrollView setContentOffset:CGPointMake(imgoffX, 0) animated:YES];
}

/**
 *  开始拖拽
 */
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    [self removeTimer];
}

/**
 *  结束拖拽
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //添加定时器
    [self addTimer];
}

/**
 *  正在滚动
 */
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    float imgW = self.titleScrollView.bounds.size.width;
    int page = (self.titleScrollView.contentOffset.x + imgW * 0.5) / imgW;
    self.titlePageControl.currentPage = page;
}

@end
