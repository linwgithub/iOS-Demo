//
//  QQMessage.h
//  13-QQMessageCell
//
//  Created by 林威 on 16/5/16.
//  Copyright © 2016年 林威. All rights reserved.
//
typedef enum {
    QQMessageTypeMe = 0,
    QQMessageTypeOther
} QQMessageType;
#import <Foundation/Foundation.h>

@interface QQMessage : NSObject

@property(nonatomic, copy)NSString *text;

@property(nonatomic, copy)NSString *time;

@property(nonatomic,assign)QQMessageType type;

@property(nonatomic, assign)BOOL isHideTime;

+ (instancetype)qqmessageWithDict:(NSDictionary *)dict;

- (instancetype)initWithDict:(NSDictionary *)dict;
@end
