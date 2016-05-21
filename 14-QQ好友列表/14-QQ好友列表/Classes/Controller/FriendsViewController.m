//
//  FriendsViewController.m
//  14-QQ好友列表
//
//  Created by 林威 on 16/5/21.
//  Copyright © 2016年 林威. All rights reserved.
//

#import "FriendsViewController.h"
#import "FriendsGroup.h"
#import "Friends.h"
#import "FriendsCell.h"
#import "FriendsGroupHeaderView.h"

@interface FriendsViewController()<UITableViewDataSource,UITableViewDelegate,FriendsFroupHeaderViewDelegate>

@property (nonatomic, strong) NSArray *groups;
@end
@implementation FriendsViewController

- (NSArray *)groups
{
    if (_groups == nil) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"friends.plist" ofType:nil];
        
        NSArray *gropsArray = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *fa = [NSMutableArray array];
        
        for (NSDictionary *dict in gropsArray) {
            FriendsGroup *group = [FriendsGroup friendsGroupWithDict:dict];
            [fa addObject:group];
        }
        _groups = fa;
    }
    return _groups;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.sectionHeaderHeight = 60;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    FriendsGroup *group = self.groups[section];
    
    return group.opened?group.friends.count:0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FriendsGroup *friendsgroup = self.groups[indexPath.section];
    Friends *qqfrend = friendsgroup.friends[indexPath.row];
    
    FriendsCell *cell = [FriendsCell cellWithTableView:tableView];
    cell.qqfriend = qqfrend;
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    FriendsGroupHeaderView *hearderView = [FriendsGroupHeaderView headerViewWithTableView:tableView];
    hearderView.friendsgroup = self.groups[section];
    hearderView.delegate = self;
    return hearderView;
}

- (void)headViewDidClick:(FriendsGroupHeaderView *)headerView
{
    [self.tableView reloadData];
}
@end
