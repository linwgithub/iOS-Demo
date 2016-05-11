//
//  StatusFrame.h
//  12-微博cell
//
//  Created by 林威 on 16/5/10.
//  Copyright © 2016年 林威. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import "Status.h"
#import <UIKit/UIKit.h>

@interface StatusFrame : NSObject

@property(nonatomic, assign, readonly)CGRect iconF;

@property(nonatomic, assign, readonly)CGRect  nameF;

@property(nonatomic, assign, readonly)CGRect  vipF;

@property(nonatomic, assign, readonly)CGRect  textF;

@property(nonatomic, assign, readonly)CGRect  pictureF;

@property(nonatomic, assign, readonly)CGFloat  cellHeight;

@property(nonatomic, strong)Status *status;


@end
