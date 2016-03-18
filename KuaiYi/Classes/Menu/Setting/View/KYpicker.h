//
//  KYpicker.h
//  KuaiYi
//
//  Created by mac on 16/1/26.
//  Copyright © 2016年 SayDy. All rights reserved.
//
typedef void(^finished)();
#import <UIKit/UIKit.h>


@interface KYpicker : UIView
- (instancetype)initWithSize:(CGSize)size view:(UIView *)addView Title:(NSString *)title piker:(UIView *)piker finished:(finished)finished;
- (void)show;

@end
