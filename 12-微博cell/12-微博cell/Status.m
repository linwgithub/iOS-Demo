//
//  Status.m
//  12-微博cell
//
//  Created by 林威 on 16/5/10.
//  Copyright © 2016年 林威. All rights reserved.
//

#import "Status.h"

@implementation Status

+ (instancetype)statusWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}

- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
@end
