//
//  hero.h
//  10_英雄展示
//
//  Created by 林威 on 16/5/7.
//  Copyright © 2016年 林威. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface hero : NSObject

@property(nonatomic, copy)NSString *name;

@property(nonatomic, copy)NSString *icon;

@property(nonatomic, copy)NSString *intro;

+ (instancetype)heroWithDict:(NSDictionary *)dict;

- (instancetype)initWithDict:(NSDictionary *)dict;

@end
