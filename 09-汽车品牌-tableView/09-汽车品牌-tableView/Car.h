//
//  Car.h
//  09-汽车品牌-tableView
//
//  Created by 林威 on 16/5/6.
//  Copyright © 2016年 linw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject

@property(nonatomic, copy)NSString *icon;

@property(nonatomic, copy)NSString *name;

+ (instancetype)carWithDict:(NSDictionary *)dict;

- (instancetype)initWithDict:(NSDictionary *)dict;
@end
