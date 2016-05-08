//
//  TgCell.h
//  11-团购
//
//  Created by 林威 on 16/5/8.
//  Copyright © 2016年 林威. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tg.h"

@interface TgCell : UITableViewCell

@property(nonatomic, strong)Tg *tg;

+ (instancetype)tgCellWithTableView:(UITableView *)table;
@end
