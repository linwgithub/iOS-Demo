//
//  Flags.h
//  15-UIPickerView-点菜系统
//
//  Created by 林威 on 16/5/22.
//  Copyright © 2016年 林威. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Flags : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *icon;

+ (instancetype)flagWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;

@end
