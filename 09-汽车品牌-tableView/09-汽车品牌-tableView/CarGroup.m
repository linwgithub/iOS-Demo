//
//  CarGroup.m
//  09-汽车品牌-tableView
//
//  Created by 林威 on 16/5/7.
//  Copyright © 2016年 linw. All rights reserved.
//

#import "CarGroup.h"
#import "Car.h"

@implementation CarGroup

+ (instancetype)carGroupWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self == [super init]) {

        self.title = dict[@"title"];
        
        NSArray *dictArray = dict[@"cars"];
        NSMutableArray *carArray = [NSMutableArray array];
        for (NSDictionary *cardict in dictArray) {
            Car *car = [Car carWithDict:cardict];
            [carArray addObject:car];
        }
        self.cars = carArray;
    }
    return self;
}

@end
