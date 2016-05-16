//
//  QQMessageFrame.m
//  13-QQMessageCell
//
//  Created by 林威 on 16/5/16.
//  Copyright © 2016年 林威. All rights reserved.
//

#import "QQMessageFrame.h"
#import <UIKit/UIKit.h>

@implementation QQMessageFrame

- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

- (void)setMessage:(QQMessage *)message
{
    _message = message;
    
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    CGFloat padding = 10;
    //时间
    if (!message.isHideTime) {
        CGFloat timeX = 0;
        CGFloat timeY = 0;
        CGFloat timwW = screenW;
        CGFloat timwY = 40;
        _timeF = CGRectMake(timeX, timeY, timwW, timwY);
    }
    
    //头像
    CGFloat iconW = 40;
    CGFloat iconH = 40;
    CGFloat iconY = CGRectGetMaxY(_timeF) + padding;
    CGFloat iconX;
    if (message.type == QQMessageTypeOther) {
        iconX = padding;
    }else{
        iconX = screenW - padding - iconW;
    }
    _iconF = CGRectMake(iconX, iconY, iconW, iconH);
    
    //文字
    CGFloat textY = iconY;
//    CGFloat textMaxW = screenW - iconW * 2 - padding * 5 - padding * 2;
    CGFloat textMaxW = 200;
    CGSize textMaxSize = CGSizeMake(textMaxW, MAXFLOAT);
    CGSize textSize = [self sizeWithText:message.text font:[UIFont systemFontOfSize:13] maxSize:textMaxSize];
    CGSize textBtnSize = CGSizeMake(textSize.width + 40, textSize.height + 40);
    CGFloat textX;
    if (message.type == QQMessageTypeOther) {
        textX = CGRectGetMaxX(_iconF) + padding;
    }else{
        textX = iconX - padding - textBtnSize.width;
    }
    _textF = (CGRect){{textX , textY},{textBtnSize.width , textBtnSize.height}};
    
    //高度
    CGFloat textMaxY = CGRectGetMaxY(_textF);
    CGFloat iconMaxY = CGRectGetMaxY(_iconF);
    _cellHeight = MAX(textMaxY, iconMaxY) + padding;
}
@end
