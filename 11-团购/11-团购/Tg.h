//
//  Tg.h
//  11-团购
//
//  Created by 林威 on 16/5/8.
//  Copyright © 2016年 林威. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tg : NSObject

@property(nonatomic, copy)NSString *buyCount;

@property(nonatomic, copy)NSString *icon;

@property(nonatomic, copy)NSString *price;

@property(nonatomic, copy)NSString *title;

+ (instancetype)tgWithDict:(NSDictionary *)dict;

- (instancetype)initWithDict:(NSDictionary *)dict;

@end
