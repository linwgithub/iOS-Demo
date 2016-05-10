//
//  TgFooterView.h
//  11-团购
//
//  Created by 林威 on 16/5/10.
//  Copyright © 2016年 林威. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TgFooterView;

@protocol TgFooterViewDelegate <NSObject>

@optional
- (void)tgFooterViewDidClockLoadBtn:(TgFooterView *)footerView;

@end
@interface TgFooterView : UIView

@property(nonatomic, weak)id<TgFooterViewDelegate> delegate;

+ (instancetype)tgFooterView;

@end
