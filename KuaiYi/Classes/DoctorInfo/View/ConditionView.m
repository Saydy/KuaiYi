//
//  ConditionView.m
//  demo
//
//  Created by xll on 16/1/22.
//  Copyright © 2016年 xll12. All rights reserved.
//

#import "ConditionView.h"
#import "UIButton+CycleBtn.h"
@interface ConditionView ()
@end
@implementation ConditionView

-(void)SetUpUI{
    UIButton * btn = [UIButton creatBtnWithImageName:@"img_triangle" andTitle:@"基本条件" andNumber:@"" andFontSize:18];
    btn.frame = CGRectMake(0, 0, 100, 40);
    btn.imageEdgeInsets = UIEdgeInsetsMake(0, -15, 0, 0);
    [btn setTitleColor:[UIColor colorWithRed:(47/255.0) green:(198/255.0) blue:(197/255.0) alpha:1] forState:UIControlStateNormal];
    [self addSubview:btn];
    
    for (int i = 0;i < self.conditionArr.count ; i++) {
        CGFloat w = 200;
        CGFloat h = 20;
        CGFloat x = 40.0;
        CGFloat y = 40 + i * h;
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
        label.text = self.conditionArr[i];
        label.font = [UIFont systemFontOfSize:15];
        label.textColor = [UIColor colorWithRed:(20/255.0) green:(20/255.0) blue:(20/255.0) alpha:1];
//        label.backgroundColor = [UIColor redColor];
        [self addSubview:label];
    }
   

}

@end
