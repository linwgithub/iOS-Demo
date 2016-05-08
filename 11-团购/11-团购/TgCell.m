//
//  TgCell.m
//  11-团购
//
//  Created by 林威 on 16/5/8.
//  Copyright © 2016年 林威. All rights reserved.
//

#import "TgCell.h"

@interface TgCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleText;

@property (weak, nonatomic) IBOutlet UILabel *priceText;

@property (weak, nonatomic) IBOutlet UILabel *buyCountText;

@property (weak, nonatomic) IBOutlet UIImageView *iconImage;


@end
@implementation TgCell

+ (instancetype)tgCellWithTableView:(UITableView *)table
{
    static NSString *ID = @"tgID";
    TgCell *cell = [table dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell
        = [[[NSBundle mainBundle]loadNibNamed:@"TgCell" owner:nil options:nil]lastObject];
    }
    return cell;
}

- (void)setTg:(Tg *)tg
{
    _tg = tg;
    
    //1.图片
    self.iconImage.image = [UIImage imageNamed:tg.icon];
    
    //2.标题
    self.titleText.text = tg.title;
    
    //3.价格
    self.priceText.text = [NSString stringWithFormat:@"￥ %@",tg.price];
    
    //4.购买人数
    self.buyCountText.text = [NSString stringWithFormat:@"已购买人数：%@",tg.buyCount];
    
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
