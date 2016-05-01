//
//  Person.m
//  01多对象手动内存管理
//
//  Created by linw on 16/4/9.
//  Copyright © 2016年 linw. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)dealloc
{
    [_car release];
    [_name release];
    [super dealloc];
    NSLog(@"person dealloc");
}

+ (Person *)person
{
    Person *person = [[self alloc]init];
    return [person autorelease];
}

- (Food *)makeFood
{
    Food *food = [[Food alloc]init];
    [food autorelease];
    return food;
}

- (void)driver
{
    [_car run];
}

- (void)setCar:(Car *)car
{
    if (_car != car) {
        [_car release];
        _car = [car retain];
    }
}

- (void)setName:(NSString *)name
{
    if (_name != name) {
        [name release];
        _name = [name retain];
    }
}


@end
