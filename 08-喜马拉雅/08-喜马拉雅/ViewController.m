//
//  ViewController.m
//  08-喜马拉雅
//
//  Created by linw on 16/5/3.
//  Copyright © 2016年 linw. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *mainScrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //内容大小
    self.mainScrollView.contentSize = CGSizeMake(0, 620);
    //弹簧效果
    self.mainScrollView.bounces = NO;
    //
    self.mainScrollView.contentOffset = CGPointMake(0, -34);
    
    self.mainScrollView.contentInset = UIEdgeInsetsMake(40, 0, 40, 0);
    self.mainScrollView.showsVerticalScrollIndicator = NO;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
