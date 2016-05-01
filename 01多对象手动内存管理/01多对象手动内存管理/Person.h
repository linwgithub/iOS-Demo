//
//  Person.h
//  01多对象手动内存管理
//
//  Created by linw on 16/4/9.
//  Copyright © 2016年 linw. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Car;
@class Food;

@interface Person : NSObject

@property (strong, nonatomic)Car *car;
@property (nonatomic, strong)NSString *name;
@property (nonatomic,assign,setter=sss:,getter=ggg)int height;

+ (Person *)person;

- (Food *)makeFood;
- (void)driver;
@end
