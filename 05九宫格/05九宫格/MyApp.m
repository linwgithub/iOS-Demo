//
//  MyApp.m
//  05九宫格
//
//  Created by linw on 16/4/23.
//  Copyright © 2016年 linw. All rights reserved.
//

#import "MyApp.h"

@implementation MyApp

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self == [super init]) {
        self.icon = dict[@"icon"];
        self.name = dict[@"name"];
    }
    return self;
}

+ (instancetype)myAppWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}
@end
