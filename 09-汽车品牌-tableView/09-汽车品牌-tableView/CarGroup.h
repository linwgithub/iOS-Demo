//
//  CarGroup.h
//  09-汽车品牌-tableView
//
//  Created by 林威 on 16/5/7.
//  Copyright © 2016年 linw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CarGroup : NSObject

@property(nonatomic, copy)NSString *title;

@property(nonatomic, strong)NSArray *cars;

+ (instancetype)carGroupWithDict:(NSDictionary *)dict;

- (instancetype)initWithDict:(NSDictionary *)dict;

@end
