//
//  MyApp.h
//  05九宫格
//
//  Created by linw on 16/4/23.
//  Copyright © 2016年 linw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyApp : NSObject

@property(nonatomic, copy)NSString *icon;

@property(nonatomic, copy)NSString *name;

- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)myAppWithDict:(NSDictionary *)dict;
@end
