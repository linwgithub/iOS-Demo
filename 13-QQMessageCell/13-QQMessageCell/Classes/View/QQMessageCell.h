//
//  QQMessageCell.h
//  13-QQMessageCell
//
//  Created by 林威 on 16/5/16.
//  Copyright © 2016年 林威. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QQMessageFrame;

@interface QQMessageCell : UITableViewCell

@property(nonatomic, strong)QQMessageFrame *messageFrame;

+ (instancetype)cellWithTableView:(UITableView *)tableView;


@end
