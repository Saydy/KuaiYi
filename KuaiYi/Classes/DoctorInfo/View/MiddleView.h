//
//  MiddleView.h
//  demo
//
//  Created by xll on 16/1/20.
//  Copyright © 2016年 xll12. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Status;

@interface MiddleView : UIView
typedef enum {
    KYDefalt = 0,
    KYGuanZhu = 1
}InfoType;
@property (strong,nonatomic) Status * data;
@property (copy,nonatomic) void (^SenderBlock)(NSInteger tag);
@property (copy,nonatomic) void (^SetKYGuanZhuScollViewContentSize)();
@property (copy,nonatomic) void (^SetKYDefalutScollViewContentSize)();
- (instancetype)initWithType:(InfoType)type;

@end
