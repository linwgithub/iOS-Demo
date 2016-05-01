//
//  Question.h
//  06猜图游戏
//
//  Created by linw on 16/4/25.
//  Copyright © 2016年 linw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Question : NSObject

/**
 *  答案
 */
@property (nonatomic, copy)NSString *answer;

/**
 *  标题
 */
@property (nonatomic, copy)NSString *title;

/**
 *  图片
 */
@property (nonatomic, copy)NSString *icon;

/**
 *  带选项
 */
@property (nonatomic, strong)NSArray *options;

- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)questionWithDict:(NSDictionary *)dict;
@end
