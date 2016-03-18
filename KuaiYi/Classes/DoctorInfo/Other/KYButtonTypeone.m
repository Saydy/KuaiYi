//
//  KYButtonTypeone.m
//  快医绘图戴墨
//
//  Created by xll on 16/1/23.
//  Copyright © 2016年 xll12. All rights reserved.
//

#import "KYButtonTypeone.h"

@implementation KYButtonTypeone
-(void)drawRect:(CGRect)rect{
    UIBezierPath * linepath =  [UIBezierPath bezierPathWithRect:rect];
    [[UIColor colorWithRed:(205/255.0) green:(205/255.0) blue:(205/255.0) alpha:1]setStroke];
    [linepath stroke];
    
}


@end
