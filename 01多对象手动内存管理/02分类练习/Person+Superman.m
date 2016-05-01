//
//  Person+Superman.m
//  Objective-CDemo
//
//  Created by linw on 16/4/11.
//  Copyright © 2016年 linw. All rights reserved.
//

#import "Person+Superman.h"

@implementation Person (Superman)

- (void)fly
{
    NSLog(@"Superman fly");
}

-(void)superpower
{
    NSLog(@"supermen`s power:%d",self.power);
}
@end
