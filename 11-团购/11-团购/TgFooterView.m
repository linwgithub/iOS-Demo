//
//  TgFooterView.m
//  11-团购
//
//  Created by 林威 on 16/5/10.
//  Copyright © 2016年 林威. All rights reserved.
//

#import "TgFooterView.h"

@interface TgFooterView()

@property (weak, nonatomic) IBOutlet UIButton *loadButton;

@property (weak, nonatomic) IBOutlet UIView *loadingView;

@end
@implementation TgFooterView

+ (instancetype)tgFooterView
{
    return [[[NSBundle mainBundle]loadNibNamed:@"TgFooterView" owner:nil options:nil] lastObject];
}

- (IBAction)loadBtnClick:(id)sender
{
    self.loadButton.hidden = YES;
    self.loadingView.hidden = NO;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        if ([self.delegate respondsToSelector:@selector(tgFooterViewDidClockLoadBtn:)])  {
            [self.delegate tgFooterViewDidClockLoadBtn:self];
        }
        
        self.loadButton.hidden = NO;
        self.loadingView.hidden = YES;
    });

}

@end
