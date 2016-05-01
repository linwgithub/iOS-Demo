//
//  main.m
//  Block练习
//
//  Created by linw on 16/4/12.
//  Copyright © 2016年 linw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Calculater.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        int (^math)(int a,int b) = ^int (int a,int b){
            return a+b;
        };
        
        __block int x = 8;
        int (^newblock)() = ^ (){
            x = 4;
            return 3 + x;
        };
        Calculater *cal = [[Calculater alloc]init];
        int number = [cal calculateNumber:2 andNUmber:3 andblock:newblock()];
        
        NSLog(@"calculation number:%d",number);
        NSLog(@"result x:%d",x);
    }
    return 0;
}
