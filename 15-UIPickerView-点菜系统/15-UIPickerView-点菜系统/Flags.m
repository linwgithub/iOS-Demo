//
//  Flags.m
//  15-UIPickerView-点菜系统
//
//  Created by 林威 on 16/5/22.
//  Copyright © 2016年 林威. All rights reserved.
//

#import "Flags.h"

@implementation Flags

- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)flagWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

@end
