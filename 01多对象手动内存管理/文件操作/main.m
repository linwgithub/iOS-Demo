//
//  main.m
//  文件操作
//
//  Created by linw on 16/4/17.
//  Copyright © 2016年 linw. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        NSFileManager *f = [NSFileManager defaultManager];
        NSError *error;
        
        NSDictionary *filed = [f attributesOfItemAtPath:@"/Users/linw/Desktop/mysettings.jar" error:&error];
        NSLog(@"file 属性%@",filed);

        NSString *path1;
        NSString *path2;
        [f copyItemAtPath:path1 toPath:path2 error:&error];
    }
    return 0;
}
