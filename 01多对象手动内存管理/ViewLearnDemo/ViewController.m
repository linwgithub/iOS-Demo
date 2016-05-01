//
//  ViewController.m
//  ViewLearnDemo
//
//  Created by linw on 16/4/20.
//  Copyright © 2016年 linw. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
    CGRect rect = button.frame;
    rect.origin.y = 200;
    button.frame = rect;
    [self.view addSubview:button];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
