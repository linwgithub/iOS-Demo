//
//  Tg.m
//  11-团购
//
//  Created by 林威 on 16/5/8.
//  Copyright © 2016年 林威. All rights reserved.
//

#import "Tg.h"

@interface Tg ()


@end
@implementation Tg

+ (instancetype)tgWithDict:(NSDictionary *)dict
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
