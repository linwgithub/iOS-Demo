//
//  main.m
//  02分类练习
//
//  Created by linw on 16/4/11.
//  Copyright © 2016年 linw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Person+Superman.h"

void test()
{
    NSLog(@"test");
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Person *sp = [[Person alloc]init];
        sp.power = 1000;
        [sp superpower];
        
        void (*mypoint)() = test;
        mypoint();
        void (^myblock)() = ^{
            NSLog(@"myblock");
        };
        myblock();
        
        int (^myresultBlock)(int a,int b) = ^int (int a,int b){
            return a + b;
        };
        
        int result = myresultBlock(2,3);
        NSLog(@"block result %d",result);
    }
    return 0;
}
