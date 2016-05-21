//
//  FriendsGroupHeaderView.h
//  14-QQ好友列表
//
//  Created by 林威 on 16/5/21.
//  Copyright © 2016年 林威. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FriendsGroup, FriendsGroupHeaderView;
@protocol FriendsFroupHeaderViewDelegate <NSObject>

@optional
- (void)headViewDidClick:(FriendsGroupHeaderView *)headerView;

@end
@interface FriendsGroupHeaderView : UITableViewHeaderFooterView

@property(nonatomic, strong)FriendsGroup *friendsgroup;

@property(nonatomic, strong)id<FriendsFroupHeaderViewDelegate> delegate;

+ (instancetype)headerViewWithTableView:(UITableView *)tableView;

@end
