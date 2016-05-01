//
//  MyAppView.m
//  05九宫格
//
//  Created by linw on 16/4/24.
//  Copyright © 2016年 linw. All rights reserved.
//

#import "MyAppView.h"


@interface MyAppView()
@property (weak, nonatomic) IBOutlet UIImageView *appIcon;

@property (weak, nonatomic) IBOutlet UILabel *appName;

@end

@implementation MyAppView

+ (instancetype)appViewWithAppData:(MyApp *)appData
{
    NSBundle *bundle = [NSBundle mainBundle];
    NSArray *objs = [bundle loadNibNamed:@"MyAppView" owner:nil options:nil];
    
    MyAppView *appview = [objs lastObject];
    
    appview.appIcon.image = [UIImage imageNamed:appData.icon];

    appview.appName.text = appData.name;
    
    return appview;
}
@end
