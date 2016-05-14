//
//  QQMessageFrame.h
//  13-QQcell
//
//  Created by 林威 on 16/5/14.
//  Copyright © 2016年 林威. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>
@class QQMessage;

@interface QQMessageFrame : NSObject

@property(nonatomic, assign, readonly)CGRect iconF;

@property(nonatomic, assign, readonly)CGRect textF;

@property(nonatomic, assign, readonly)CGRect timeF;

@property(nonatomic, assign, readonly)CGFloat cellHeight;

@property(nonatomic, strong)QQMessage *qqmessage;


@end
