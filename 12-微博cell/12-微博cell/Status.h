//
//  Status.h
//  12-微博cell
//
//  Created by 林威 on 16/5/10.
//  Copyright © 2016年 林威. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Status : NSObject

@property(nonatomic, copy)NSString *icon;

@property(nonatomic, copy)NSString *name;

@property(nonatomic, copy)NSString *text;

@property(nonatomic, copy)NSString *picture;

@property(nonatomic, assign)BOOL vip;

+ (instancetype)statusWithDict:(NSDictionary *)dict;

- (instancetype)initWithDict:(NSDictionary *)dict;
@end
