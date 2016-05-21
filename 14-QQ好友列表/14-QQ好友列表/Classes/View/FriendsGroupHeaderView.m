//
//  FriendsGroupHeaderView.m
//  14-QQ好友列表
//
//  Created by 林威 on 16/5/21.
//  Copyright © 2016年 林威. All rights reserved.
//

#import "FriendsGroupHeaderView.h"
#import "FriendsGroup.h"

@interface FriendsGroupHeaderView()

@property (nonatomic, weak)UIButton *nameView;

@property (nonatomic, weak)UILabel *countView;

@end
@implementation FriendsGroupHeaderView

+ (instancetype)headerViewWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"headerView";
    FriendsGroupHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if (headerView == nil) {
        headerView = [[self alloc]initWithReuseIdentifier:ID];
    }
    return headerView;
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        //组名称控件
        UIButton *nameView = [[UIButton alloc]init];
        //文字颜色
        [nameView setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //背景图片
        [nameView setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg"] forState:UIControlStateNormal];
        [nameView setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg_highlighted"] forState:UIControlStateHighlighted];
        //左边图片
        [nameView setImage:[UIImage imageNamed:@"buddy_header_arrow"] forState:UIControlStateNormal];
        //设置内容左对齐
        nameView.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        //按钮内部边距
        nameView.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        //按钮文本与图片边距
        nameView.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        [nameView addTarget:self action:@selector(nameViewClick:) forControlEvents:UIControlEventTouchUpInside];
        
        //图片位置模式
        nameView.imageView.contentMode = UIViewContentModeCenter;
        //设置不裁剪超出大小的图
        nameView.imageView.clipsToBounds = NO;
        [self.contentView addSubview:nameView];
        _nameView = nameView;
        
        UILabel *countLabel = [[UILabel alloc]init];
        countLabel.textAlignment = NSTextAlignmentRight;
        countLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview:countLabel];
        _countView = countLabel;
        
    }
    return self;
}

/**
 *  frame改变是调用该方法重写绘制子视图
 */
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.nameView.frame = self.bounds;
    
    //上线人数的frame
    CGFloat countLableY = 0;
    CGFloat countLableW = 150;
    CGFloat countLableH = self.bounds.size.height;
    CGFloat countLableX = self.bounds.size.width - 10 - countLableW;
    self.countView.frame = CGRectMake(countLableX, countLableY, countLableW, countLableH);
}

/**
 *  传入数据模型
 */
- (void)setFriendsgroup:(FriendsGroup *)friendsgroup
{
    _friendsgroup = friendsgroup;
    //组名
    [self.nameView setTitle:friendsgroup.name forState:UIControlStateNormal];
    //在线人数
    self.countView.text = [NSString stringWithFormat:@"%ld/%lu",(long)friendsgroup.online , (unsigned long)friendsgroup.friends.count];
    
    if (friendsgroup.opened) {
        self.nameView.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    } else {
        self.nameView.imageView.transform = CGAffineTransformMakeRotation(0);
    }
    
    
}

/**
 *  名字控件点击事件
 */
- (void)nameViewClick:(FriendsGroupHeaderView *)heardView
{
    self.friendsgroup.opened = !self.friendsgroup.opened;
    if ([self.delegate respondsToSelector:@selector(headViewDidClick:)]) {
        [self.delegate headViewDidClick:heardView];
    }
}

/**
 *  当子控件呗添加到父视图中
 */
//- (void)didMoveToSuperview
//{
//    if (self.friendsgroup.opened) {
//        self.nameView.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
//    } else {
//        self.nameView.imageView.transform = CGAffineTransformMakeRotation(0);
//    }
//
//}

@end
