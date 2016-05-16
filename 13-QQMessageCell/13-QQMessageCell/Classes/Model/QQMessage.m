//
//  QQMessage.m
//  13-QQMessageCell
//
//  Created by 林威 on 16/5/16.
//  Copyright © 2016年 林威. All rights reserved.
//

#import "QQMessage.h"

@implementation QQMessage

+ (instancetype)qqmessageWithDict:(NSDictionary *)dict
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
