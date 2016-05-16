//
//  UIImage+ensize.m
//  13-QQMessageCell
//
//  Created by 林威 on 16/5/17.
//  Copyright © 2016年 林威. All rights reserved.
//

#import "UIImage+ensize.h"

@implementation UIImage (ensize)

+ (instancetype)resizableImage:(NSString *)imageName
{
    UIImage *normal = [UIImage imageNamed:imageName];
    CGFloat w = normal.size.width * 0.5;
    CGFloat h = normal.size.height * 0.5;
    return [normal resizableImageWithCapInsets:UIEdgeInsetsMake(h, w, h, w)];
}
@end
