//
//  Car.h
//  01多对象手动内存管理
//
//  Created by linw on 16/4/9.
//  Copyright © 2016年 linw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject

@property (nonatomic, assign)NSInteger *speed;
- (void)run;
@end
