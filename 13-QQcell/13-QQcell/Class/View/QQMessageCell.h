//
//  QQMessageCell.h
//  13-QQcell
//
//  Created by 林威 on 16/5/15.
//  Copyright © 2016年 林威. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QQMessageFrame.h"
@interface QQMessageCell : UITableViewCell

@property(nonatomic, strong)QQMessageFrame *messageFrame;

+ (instancetype)messageCellWithUITableView:(UITableView *)tableView;
@end
