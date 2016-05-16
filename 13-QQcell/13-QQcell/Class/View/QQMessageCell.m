//
//  QQMessageCell.m
//  13-QQcell
//
//  Created by 林威 on 16/5/15.
//  Copyright © 2016年 林威. All rights reserved.
//

#import "QQMessageCell.h"
#import "QQMessage.h"

@interface QQMessageCell()

@property(nonatomic, weak)UILabel *timeView;

@property(nonatomic, weak)UIImageView  *iconView;

@property(nonatomic, weak)UIButton *textView;

@end
@implementation QQMessageCell


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (instancetype)messageCellWithUITableView:(UITableView *)tableView
{
    static NSString *ID = @"messageCell";
    QQMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[QQMessageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        //时间
        UILabel *timeView = [[UILabel alloc]init];
        timeView.textAlignment = NSTextAlignmentCenter;
        timeView.font = [UIFont systemFontOfSize:13];
        [timeView setTextColor:[UIColor grayColor]];
        [self addSubview:timeView];
        _timeView = timeView;
        
        //头像
        UIImageView *iconView = [[UIImageView alloc]init];
        [self addSubview:iconView];
        _iconView = iconView;
        
        //内容
        UIButton *textView = [[UIButton alloc]init];
        textView.titleLabel.numberOfLines = 0;
        textView.backgroundColor = [UIColor purpleColor];
        textView.titleLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:textView];
        _textView = textView;
        
        [self setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}

- (void)setMessageFrame:(QQMessageFrame *)messageFrame
{
    _messageFrame = messageFrame;
    QQMessage *message = messageFrame.qqmessage;

    _timeView.text = message.time;
    _timeView.frame = messageFrame.timeF;

    NSString *icon = (message.type == QQMessageTypeMe)?@"me":@"other";
    _iconView.image = [UIImage imageNamed:icon];
    _iconView.frame = messageFrame.iconF;
    
    [_textView setTitle:message.text forState:UIControlStateNormal];
    _textView.titleLabel.text = message.text;
    _textView.frame = messageFrame.iconF;
    
    
}
@end
