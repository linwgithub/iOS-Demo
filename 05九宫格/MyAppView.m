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
    appview.appData = appData;
    appview.appName.text = appData.name;
    
    return appview;
}

- (IBAction)downloadBtn:(UIButton *)sender {
    //按钮失效
    sender.enabled = NO;
    [sender setTitle:@"已下载" forState:UIControlStateDisabled];
    
    //通知代理
    if ([self.delegate respondsToSelector:@selector(myAppViewDownloadBtnClick:)]) {
        [self.delegate myAppViewDownloadBtnClick:self];
    }
}


@end
