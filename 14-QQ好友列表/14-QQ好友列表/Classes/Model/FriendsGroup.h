//
//  FriendsGroup.h
//  14-QQ好友列表
//
//  Created by 林威 on 16/5/21.
//  Copyright © 2016年 林威. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Friends;

@interface FriendsGroup : NSObject

@property(nonatomic, copy)NSString *name;

@property(nonatomic, strong)NSArray *friends;

@property(nonatomic, assign, getter=isOpened)BOOL opened;

+ (instancetype)friendsGroupWithDict:(NSDictionary *)dict;

- (instancetype)initWithDict:(NSDictionary *)dict;
@end
