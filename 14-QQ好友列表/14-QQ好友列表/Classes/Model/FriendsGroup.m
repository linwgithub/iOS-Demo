//
//  FriendsGroup.m
//  14-QQ好友列表
//
//  Created by 林威 on 16/5/21.
//  Copyright © 2016年 林威. All rights reserved.
//

#import "FriendsGroup.h"
#import "Friends.h"

@implementation FriendsGroup


+ (instancetype)friendsGroupWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}

- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        //注入所有属性
        [self setValuesForKeysWithDictionary:dict];
        //特殊处理friends：
        NSMutableArray *friendsArray = [NSMutableArray array];
        for (NSDictionary *dict in self.friends) {
            Friends *qqfreidn = [Friends friendsWithDict:dict];
            [friendsArray addObject:qqfreidn];
        }
        self.friends = friendsArray;
    }
    return self;
}
@end
