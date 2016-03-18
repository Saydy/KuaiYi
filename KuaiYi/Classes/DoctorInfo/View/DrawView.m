//
//  DrawView.m
//  快医绘图戴墨
//
//  Created by xll on 16/1/23.
//  Copyright © 2016年 xll12. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView
-(void)drawRect:(CGRect)rect
{
    
    NSString * str = @"本周";
    CGFloat x = rect.size.width - 46.0;
    CGFloat y = 12;
    [str drawAtPoint:CGPointMake(x,y) withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20.0],NSForegroundColorAttributeName:[UIColor colorWithRed:(253/255.0) green:(184/255.0) blue:(77/255.0) alpha:1]}];
    
     NSString * str1 = @"放号周期";
    CGFloat x1 = rect.size.width*0.5 - 40;
    [str1 drawAtPoint:CGPointMake(x1, y) withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20.0],NSForegroundColorAttributeName:[UIColor colorWithRed:(144/255.0) green:(144/255.0) blue:(144/255.0) alpha:1]}];
    
    
   UIBezierPath * path =  [UIBezierPath bezierPathWithOvalInRect:CGRectMake(x + 20.0 , y + 25, 5, 5)];
    [[UIColor colorWithRed:(253/255.0) green:(184/255.0) blue:(77/255.0) alpha:1] setFill];
    [path fill];
    
    
    
    UIBezierPath * linepath =  [UIBezierPath bezierPathWithRect:rect];
    [[UIColor colorWithRed:(205/255.0) green:(205/255.0) blue:(205/255.0) alpha:1]setStroke];
    [linepath stroke];
}
@end
