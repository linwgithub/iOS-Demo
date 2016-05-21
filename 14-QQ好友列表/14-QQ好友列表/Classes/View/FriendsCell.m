//
//  FriendsCell.m
//  14-QQ好友列表
//
//  Created by 林威 on 16/5/21.
//  Copyright © 2016年 林威. All rights reserved.
//

#import "FriendsCell.h"
#import "Friends.h"

@implementation FriendsCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"qqfriendCell";
    FriendsCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[self alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}

- (void)setQqfriend:(Friends *)qqfriend
{
    _qqfriend = qqfriend;
    
    self.imageView.image = [UIImage imageNamed:qqfriend.icon];
    self.textLabel.text = qqfriend.name;
    self.textLabel.textColor = qqfriend.vip?[UIColor redColor]:[UIColor blackColor];
    self.detailTextLabel.text =qqfriend.intro;
}
@end
