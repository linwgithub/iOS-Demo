//
//  ViewController.m
//  04TomCat
//
//  Created by linw on 16/4/21.
//  Copyright © 2016年 linw. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imgTom;

@end

@implementation ViewController

/** 播放动画*/
- (void)showAnomotionWithCount:(int)count animotionName:(NSString *)name
{
    //0、判断图片是否已加载
    if (self.imgTom.isAnimating) {
        return;
    }
    
    NSMutableArray *imageArray = [NSMutableArray array];
    
    for (int i = 0; i<count; i++) {
        NSString *imageName = [NSString stringWithFormat:@"%@_%02d.jpg",name,i];
        
        NSBundle *bundle = [NSBundle mainBundle];
        NSString *path = [bundle pathForResource:imageName ofType:nil];
        UIImage *img = [UIImage imageWithContentsOfFile:path];
        [imageArray addObject:img];
    }
    
    //1、设置动画数组
    self.imgTom.animationImages = imageArray;
    //2.设置播放次数(1次)
    self.imgTom.animationRepeatCount = 1;
    //3.设置播放时间
    self.imgTom.animationDuration = count * 0.06;
    
    [self.imgTom startAnimating];
    // 4.动画放完后清除内存
    [self performSelector:@selector(showAnomotionWithCount:animotionName:) withObject:nil afterDelay:1];
    
}

- (IBAction)drink:(id)sender
{
    NSLog(@"drink");
    [self showAnomotionWithCount:81 animotionName:@"drink"];
}

- (IBAction)touchTop:(id)sender
{
    NSLog(@"touchTop");
     [self showAnomotionWithCount:81 animotionName:@"knockout"];
}
- (IBAction)touchLeftFoot:(id)sender
{
    NSLog(@"touchLeftFoot");
    [self showAnomotionWithCount:30 animotionName:@"footRight"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
