//
//  QQMessageCell.m
//  13-QQMessageCell
//
//  Created by 林威 on 16/5/16.
//  Copyright © 2016年 林威. All rights reserved.
//

#import "QQMessageCell.h"
#import "QQMessage.h"
#import "QQMessageFrame.h"
#import "UIImage+ensize.h"

@interface QQMessageCell()

@property(nonatomic, weak)UILabel *timeView;

@property(nonatomic, weak)UIImageView *iconView;

@property(nonatomic, weak)UIButton *textView;

@end

@implementation QQMessageCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"qqmessageId";
    QQMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[QQMessageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setMessageFrame:(QQMessageFrame *)messageFrame
{
    _messageFrame = messageFrame;
    QQMessage *message = messageFrame.message;
    
    //时间
    self.timeView.text = message.time;
    self.timeView.frame = messageFrame.timeF;
    
    //头像
    NSString *icon =(message.type == QQMessageTypeMe)?@"me":@"other";
    self.iconView.image = [UIImage imageNamed:icon];
    self.iconView.frame = messageFrame.iconF;
    
    //正文
    [self.textView setTitle:message.text forState:UIControlStateNormal];
    [self.textView setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.textView.frame = messageFrame.textF;
    
    //正文背景
    if (message.type == QQMessageTypeMe) {

        UIImage *textbgImage = [UIImage resizableImage:@"chat_send_nor"];
        [self.textView setBackgroundImage:textbgImage forState:UIControlStateNormal];
    } else {
        UIImage *textbgImage = [UIImage resizableImage:@"chat_recive_nor"];
        [self.textView setBackgroundImage:textbgImage forState:UIControlStateNormal];
    }
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //时间
        UILabel *timeView = [[UILabel alloc]init];
        timeView.textAlignment = NSTextAlignmentCenter;
        timeView.textColor = [UIColor grayColor];
        timeView.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:timeView];
        _timeView = timeView;

        //头像
        UIImageView *iconView = [[UIImageView alloc]init];
        [self.contentView addSubview:iconView];
        _iconView = iconView;
        
        //内容
        UIButton *textView = [[UIButton alloc]init];
        textView.titleLabel.font = [UIFont systemFontOfSize:14];
        textView.titleLabel.numberOfLines = 0;
        textView.contentEdgeInsets = UIEdgeInsetsMake(5, 15, 5, 15);
        
        [self.contentView addSubview:textView];
        _textView = textView;
        
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
