//
//  Friends.h
//  14-QQ好友列表
//
//  Created by 林威 on 16/5/21.
//  Copyright © 2016年 林威. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Friends : NSObject

@property(nonatomic, copy)NSString *icon;

@property(nonatomic, copy)NSString *intro;

@property(nonatomic, copy)NSString *name;

@property(nonatomic, assign, getter=isVIP)BOOL vip;

+ (instancetype)friendsWithDict:(NSDictionary *)dict;

- (instancetype)initWithDict:(NSDictionary *)dict;

@end
