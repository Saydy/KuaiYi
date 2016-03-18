//
//  DoctorInfoView.m
//  demo
//
//  Created by xll on 16/1/22.
//  Copyright © 2016年 xll12. All rights reserved.
//

#import "DoctorInfoView.h"

@implementation DoctorInfoView

-(void)SetUpUI{
    CGFloat xmargin = 10.0;
    UILabel * introductionLabel = [[UILabel alloc]initWithFrame:CGRectMake(xmargin, 0, self.bounds.size.width - 2 * xmargin, self.bounds.size.height)];
//    introductionLabel.backgroundColor = [UIColor redColor];
    introductionLabel.text = self.introductionText;
    introductionLabel.numberOfLines = 0;
    introductionLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:introductionLabel];

}
@end
