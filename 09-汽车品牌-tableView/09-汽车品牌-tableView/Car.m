//
//  Car.m
//  09-汽车品牌-tableView
//
//  Created by 林威 on 16/5/6.
//  Copyright © 2016年 linw. All rights reserved.
//

#import "Car.h"

@implementation Car

+ (instancetype)carWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self == [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
@end
