//
//  Question.m
//  06猜图游戏
//
//  Created by linw on 16/4/25.
//  Copyright © 2016年 linw. All rights reserved.
//

#import "Question.h"

@implementation Question

+ (instancetype)questionWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self == [super init]) {
        self.answer = dict[@"answer"];
        self.title = dict[@"title"];
        self.icon = dict[@"icon"];
        self.options = dict[@"options"];
    }
    return self;
}
@end
