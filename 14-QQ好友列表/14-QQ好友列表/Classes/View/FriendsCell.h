//
//  FriendsCell.h
//  14-QQ好友列表
//
//  Created by 林威 on 16/5/21.
//  Copyright © 2016年 林威. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Friends;
@interface FriendsCell : UITableViewCell


+ (instancetype) cellWithTableView:(UITableView *)tableView;

@property (nonatomic, strong)Friends *qqfriend;
@end
