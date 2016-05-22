//
//  FlagView.h
//  15-UIPickerView-点菜系统
//
//  Created by 林威 on 16/5/22.
//  Copyright © 2016年 林威. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Flags;
@interface FlagView : UIView

@property (nonatomic, strong)Flags *flag;

+ (instancetype) flaViewWithResuingView:(UIView *)resuingView;
+ (NSInteger)flagViewHight;
@end
