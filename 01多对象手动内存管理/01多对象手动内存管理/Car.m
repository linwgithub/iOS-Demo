//
//  Car.m
//  01多对象手动内存管理
//
//  Created by linw on 16/4/9.
//  Copyright © 2016年 linw. All rights reserved.
//

#import "Car.h"

@implementation Car

- (void)dealloc
{
    [super dealloc];
    NSLog(@"car dealloc");
}

-(void)run
{
    NSLog(@"car is run & speed:%lu",(long)_speed);
}


@end
