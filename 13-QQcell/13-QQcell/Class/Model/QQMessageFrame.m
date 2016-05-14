//
//  QQMessageFrame.m
//  13-QQcell
//
//  Created by 林威 on 16/5/14.
//  Copyright © 2016年 林威. All rights reserved.
//

#import "QQMessageFrame.h"
#import "QQMessage.h"

@implementation QQMessageFrame

/**
 *  计算文字尺寸
 *
 *  @param text    需要计算尺寸的文字
 *  @param font    文字的字体
 *  @param maxSize 文字的最大尺寸
 */
- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

- (void)setQqmessage:(QQMessage *)qqmessage
{
    _qqmessage = qqmessage;
    
    CGFloat padding = 10;
    
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    //时间
    if (qqmessage.hideTime == NO) {
        CGFloat timeX = 0;
        CGFloat timeY = 0;
        CGFloat timeW = screenW;
        CGFloat timeH = 40;
        _timeF = CGRectMake(timeX, timeY, timeW, timeH);
    }
    
    //头像
    CGFloat iconY = CGRectGetMaxY(_timeF) + padding;
    CGFloat iconW = 40;
    CGFloat iconH = 40;
    CGFloat iconX ;
    if (qqmessage.type == QQMessageTypeOther) {
        iconX = padding;
    }else{
        iconX = screenW - padding - iconW;
    }
    _iconF = CGRectMake(iconX, iconY, iconW, iconH);
    
    //文本
    CGFloat textY = iconY;
    CGFloat textMaxW = screenW - (padding * 3 + iconW ) *2 ;
    CGSize textMacSize = CGSizeMake(textMaxW, CGFLOAT_MAX);
    CGSize textSize = [self sizeWithText:qqmessage.text font:[UIFont systemFontOfSize:15] maxSize:textMacSize];
    CGFloat textX;
    if (qqmessage.type == QQMessageTypeOther) {
        textX = CGRectGetMidX(_iconF) + padding;
    }else{
        textX = iconX - padding - textSize.width;
    }
    
    _textF = (CGRect){{textX, textY},textSize};
    
    CGFloat iconMaxY = CGRectGetMaxY(_iconF);
    CGFloat textMaxY = CGRectGetMaxY(_textF);
    _cellHeight = MAX(iconMaxY, textMaxY) + padding;
    
}

@end
