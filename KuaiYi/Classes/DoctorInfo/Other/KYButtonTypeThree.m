//
//  KYButtonTypeThree.m
//  快医绘图戴墨
//
//  Created by xll on 16/1/24.
//  Copyright © 2016年 xll12. All rights reserved.
//

#import "KYButtonTypeThree.h"

@interface KYButtonTypeThree ()

@end
@implementation KYButtonTypeThree
-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    UIBezierPath * linepath = [UIBezierPath bezierPathWithRect:rect];
    [[UIColor colorWithRed:(205/255.0) green:(205/255.0) blue:(205/255.0) alpha:1]setStroke];
    [linepath stroke];
    
}

@end
