//
//  TableViewCell.m
//  12-微博cell
//
//  Created by 林威 on 16/5/11.
//  Copyright © 2016年 林威. All rights reserved.
//

#import "TableViewCell.h"
#import "Status.h"
#import "StatusFrame.h"

@interface TableViewCell()

@property(nonatomic, weak)UIImageView *iconView;

@property(nonatomic, weak)UILabel *nameView;

@property(nonatomic, weak)UIImageView *vipView;

@property(nonatomic, weak)UILabel *textView;

@property(nonatomic, weak)UIImageView *pictureView;


@end
@implementation TableViewCell



- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //1 头像
        UIImageView *iconView = [[UIImageView alloc]init];
        [self addSubview:iconView];
        self.iconView = iconView;
        
        //2 name
        UILabel *nameView = [[UILabel alloc]init];
        [self addSubview:nameView];
        self.nameView = nameView;
        
        //3 vip
        UIImageView *vipView = [[UIImageView alloc]init];
        [self addSubview:vipView];
        self.vipView = vipView;
        
        //4 text
        UILabel *textView = [[UILabel alloc]init];
        [self addSubview:textView];
        self.textView = textView;
        
        //5 picture
        UIImageView *pictureView = [[UIImageView alloc]init];
        [self addSubview:pictureView];
        self.pictureView = pictureView;
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setStatusFrame:(StatusFrame *)statusFrame
{
    _statusFrame = statusFrame;
    [self settingData];
    
    [self settingFrame];
}

- (void)settingData
{
    Status *status = self.statusFrame.status;
    //头像
    self.iconView.image = [UIImage imageNamed:status.icon];
    //用户名
    self.nameView.text = status.name;
    //vip
    if (status.vip) {
        self.vipView.hidden = NO;
        [self.nameView setTextColor:[UIColor redColor]];
    }else{
        self.vipView.hidden = YES;
        [self.nameView setTextColor:[UIColor blackColor]];
    }
    self.textView.text = status.text;
    
    if (status.picture) {
        
        self.pictureView.hidden = NO;
        self.vipView.image = [UIImage imageNamed:status.picture];
    }else{
        self.pictureView.hidden = YES;
    }
    
}

- (void)settingFrame
{
    self.iconView.frame = self.statusFrame.iconF;
    
    self.nameView.frame = self.statusFrame.nameF;
    
    self.vipView.frame = self.statusFrame.vipF;
    
    self.textView.frame = self.statusFrame.textF;
    
    if (self.statusFrame.status.picture) {
        self.pictureView.frame = self.statusFrame.pictureF;
    }
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"status";
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[TableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    return cell;

}
@end
