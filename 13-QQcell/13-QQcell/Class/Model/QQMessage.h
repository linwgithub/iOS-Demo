//
//  QQMessage.h
//  13-QQcell
//
//  Created by 林威 on 16/5/14.
//  Copyright © 2016年 林威. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    QQMessageTypeMe = 0,//自己
    QQMessageTypeOther//别人
    
} QQMessageType;

@interface QQMessage : NSObject

@property(nonatomic, copy)NSString *text;

@property(nonatomic, copy)NSString *time;

@property(nonatomic, assign)QQMessageType *type;

@property(nonatomic, assign)BOOL hideTime;

+ (instancetype)messageWithDict:(NSDictionary *)dict;

- (instancetype)initWithDict:(NSDictionary *)dict;

@end
