//
//  UIButton+CycleBtn.m
//  demo
//
//  Created by xll on 16/1/20.
//  Copyright © 2016年 xll12. All rights reserved.
//

#import "UIButton+CycleBtn.h"

@implementation UIButton (CycleBtn)
+(UIButton*)creatBtnWithImageName:(NSString*)imageName andTitle:(NSString*)title andNumber:(NSString*)num andFontSize:(CGFloat)fronsize{
    UIButton * btn = [[UIButton alloc]init];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    if (num != nil) {
        [btn setTitle:[NSString stringWithFormat:@"%@:%@",title,num] forState:UIControlStateNormal];
    }else{
        [btn setTitle:[NSString stringWithFormat:@"%@",title] forState:UIControlStateNormal];
    }
    if (imageName) {
        btn.imageEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 0);
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, -28, 0, 0);
    }
    
    btn.titleLabel.font = [UIFont systemFontOfSize:fronsize];
    [btn setTitleColor:[UIColor colorWithRed:(43/255.0) green:(43/255.0) blue:(43/255.0) alpha:0.8] forState:UIControlStateNormal];
    return btn;
}



@end
