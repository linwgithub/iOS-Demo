//
//  Calculater.m
//  Objective-CDemo
//
//  Created by linw on 16/4/12.
//  Copyright © 2016年 linw. All rights reserved.
//

#import "Calculater.h"
typedef int (^calcunumber)(int a,int b);
@implementation Calculater

- (int)calculateNumber:(NSInteger)a andNUmber:(NSInteger)b andblock:(int)calcunumber
{
    return calcunumber;

}
@end
