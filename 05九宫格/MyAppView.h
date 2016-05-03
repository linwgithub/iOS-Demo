//
//  MyAppView.h
//  05九宫格
//
//  Created by linw on 16/4/24.
//  Copyright © 2016年 linw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyApp.h"
@class MyAppView;

@protocol MyAppViewProtocao <NSObject>

- (void)myAppViewDownloadBtnClick:(MyAppView *)myappView;

@end

@interface MyAppView : UIView

@property(nonatomic, weak)id<MyAppViewProtocao> delegate;

@property (nonatomic, strong)MyApp *appData;

+ (instancetype)appViewWithAppData:(MyApp *)appData;
@end
