//
//  main.m
//  01多对象手动内存管理
//
//  Created by linw on 16/4/9.
//  Copyright © 2016年 linw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Car.h"
#import "Food.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...

        Person *p = [[Person alloc]init];
        Car *c1 = [[Car alloc]init];
        c1.speed = 100;
        p.car = c1;
        [c1 release];
        
        Car *c2 = [[Car alloc]init];
        c2.speed = 250;
        
        p.car = c2;
        
        
        [c2 release];
        [p driver];
        
        
        [p release];
        
        //使用autoreleasepool
        Person *p2 = [Person person];
        Food *food = [p2 makeFood];
        food.name = @"烧烤";
        NSLog(@"菜名%@",food.name);
    }
    return 0;
}
