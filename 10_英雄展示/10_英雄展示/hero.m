//
//  hero.m
//  10_英雄展示
//
//  Created by 林威 on 16/5/7.
//  Copyright © 2016年 林威. All rights reserved.
//

#import "hero.h"

@implementation hero

+ (instancetype)heroWithDict:(NSDictionary *)dict
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
