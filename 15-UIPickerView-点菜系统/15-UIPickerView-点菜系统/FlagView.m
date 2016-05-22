//
//  FlagView.m
//  15-UIPickerView-点菜系统
//
//  Created by 林威 on 16/5/22.
//  Copyright © 2016年 林威. All rights reserved.
//

#import "FlagView.h"
#import "Flags.h"

@interface FlagView()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;


@end
@implementation FlagView

+ (instancetype)flaViewWithResuingView:(UIView *)resuingView
{
    if (resuingView == nil) {
        return [[[NSBundle mainBundle]loadNibNamed:@"FloagView" owner:nil options:nil]lastObject];
    }else{
        return (FlagView *)resuingView;
    }
}

- (void)setFlag:(Flags *)flag
{
    _flag = flag;

    self.nameLabel.text = flag.name;
    
    self.imageView.image = [UIImage imageNamed:flag.icon];
}

+ (NSInteger)flagViewHight
{
    return 44;
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
