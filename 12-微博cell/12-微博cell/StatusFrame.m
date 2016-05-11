//
//  StatusFrame.m
//  12-微博cell
//
//  Created by 林威 on 16/5/10.
//  Copyright © 2016年 林威. All rights reserved.
//

// 昵称的字体
#define NameFont [UIFont systemFontOfSize:14]
// 正文的字体
#define TextFont [UIFont systemFontOfSize:15]

#import "StatusFrame.h"

@implementation StatusFrame

- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxsize
{
    NSDictionary *attr = @{NSFontAttributeName : font};
    return [text boundingRectWithSize:maxsize options:NSStringDrawingUsesLineFragmentOrigin attributes:attr context:nil].size;
}

- (void)setStatus:(Status *)status
{
    _status = status;
    //间距
    CGFloat padding = 10;
    
    //1.头像
    CGFloat iconX = 10;
    CGFloat iconY = 10;
    CGFloat iconW = 30;
    CGFloat iconH = 30;
    _iconF = CGRectMake(iconX, iconY, iconW, iconH);
    
    //2.文字
    CGSize nameSize = [self sizeWithText:self.status.name font:NameFont maxSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
    
    CGFloat nameX = CGRectGetMaxX(_iconF) + padding;
    CGFloat nameY = iconY + (iconH - nameSize.height) * 0.5;
    _nameF = CGRectMake(iconX, iconY, iconW, iconH);
    
    //3.vip
    CGFloat vipX = CGRectGetMaxX(_nameF) + padding;
    CGFloat vipY = nameY;
    CGFloat vipW = 14;
    CGFloat vipH = 14;
    _vipF = CGRectMake(vipX, vipY, vipW, vipH);
    
    //4.text
    CGFloat textX = iconX;
    CGFloat textY = CGRectGetMaxY(_iconF) + padding;
    CGSize textSize = [self sizeWithText:self.status.text font:TextFont maxSize:CGSizeMake(300, CGFLOAT_MAX)];
    _textF = CGRectMake(textX, textY, textSize.width, textSize.height);
    
    //5.picture
    if (self.status.picture) {
        CGFloat pictureX = textX;
        CGFloat pictureY = CGRectGetMaxY(_textF) + padding;
        CGFloat pictureW = 150;
        CGFloat pictureH = 150;
        _pictureF = CGRectMake(pictureX, pictureY, pictureW, pictureH);
        _cellHeight = CGRectGetMaxY(_pictureF) + padding;
    }else{
        _cellHeight = CGRectGetMaxY(_textF) + padding;
    }
    
    

    
    
    
}
@end
