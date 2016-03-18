//
//  KYButtonTypeTwo.m
//  快医绘图戴墨
//
//  Created by xll on 16/1/24.
//  Copyright © 2016年 xll12. All rights reserved.
//

#import "KYButtonTypeTwo.h"
#define KYDelay 3600.0 * 24
@interface KYButtonTypeTwo ()
@property (copy,nonatomic) void (^SendBlock)(NSInteger month,NSInteger day,NSString* weekday);
@end
@implementation KYButtonTypeTwo
-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    UIBezierPath * linepath = [UIBezierPath bezierPathWithRect:rect];
    [[UIColor colorWithRed:(205/255.0) green:(205/255.0) blue:(205/255.0) alpha:1]setStroke];
    [linepath stroke];
    static  int j = 0;
    self.SendBlock = ^(NSInteger month,NSInteger day,NSString * weekday){
        CGFloat x = ([UIScreen mainScreen].bounds.size.width - 40)/ 7;
        [weekday drawAtPoint:CGPointMake((x - 34)*0.5, 10) withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17.0],NSForegroundColorAttributeName:[UIColor colorWithRed:(43/255.0) green:(43/255.0) blue:(43/255.0) alpha:0.7]}];
    
    NSString * str = [NSString stringWithFormat:@"%02ld-%ld",month,day];
        CGFloat x1 = (x - 35) * 0.5;
        CGFloat y1 = 38;
        [str drawAtPoint:CGPointMake(x1, y1) withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0],NSForegroundColorAttributeName:[UIColor colorWithRed:(144/255.0) green:(144/255.0) blue:(144/255.0) alpha:0.8]}];
        
     
    };
    
    [self getWeekWithDelay:j++ * KYDelay];

}
-(void)getWeekWithDelay:(NSTimeInterval)delay{
    NSCalendar * calendar =[[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents * component = [[NSDateComponents alloc]init];
    NSInteger unitflags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond ;
    NSDate * now = [NSDate date];
    NSTimeInterval  timeInterval = 6 * KYDelay - delay;
    NSDate * future = [now dateByAddingTimeInterval:timeInterval];
    component = [calendar components:unitflags fromDate:future];
    NSInteger month = [component month];
    NSInteger week = [component weekday];
    NSInteger day = [component day];
//    NSInteger hour = [component hour];
//    NSInteger minute = [component minute];
//    NSInteger second = [component second];
//    NSLog(@"%zd",month);
//    NSLog(@"%zd",day);
    NSArray * weekarr = @[@"周日",@"周一",@"周二",@"周三",@"周四",@"周五",@"周六"];
//    NSLog(@"%@",[NSString stringWithFormat:@"%@",[weekarr objectAtIndex:week - 1]]);
    NSString * weekday =  [NSString stringWithFormat:@"%@",[weekarr objectAtIndex:week - 1]];
//    NSLog(@"%@",weekday);
    
    self.SendBlock(month,day,weekday);
    
    
}
@end
