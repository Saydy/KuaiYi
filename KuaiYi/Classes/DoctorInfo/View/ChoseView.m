//
//  ChoseView.m
//  demo
//
//  Created by xll on 16/1/25.
//  Copyright © 2016年 xll12. All rights reserved.
//

#import "ChoseView.h"

@implementation ChoseView
-(void)drawRect:(CGRect)rect{
    
        
        UIImage * image = [UIImage imageNamed:@"img_star"];
        CGFloat w = ([UIScreen mainScreen].bounds.size.width - 40 ) / 7.0;
        [image drawInRect:CGRectMake(0, 0, w, w)];
        [image drawInRect:CGRectMake(0, 0, w, w) blendMode:kCGBlendModeColorDodge alpha:0.5];
        NSString * str = @"有号";
        
        [str drawAtPoint:CGPointMake((w - 34)*.5, 40) withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17.0],NSForegroundColorAttributeName:[UIColor colorWithRed:(177/255.0) green:(177/255.0) blue:(177/255.0) alpha:1]}];
  



}
@end
