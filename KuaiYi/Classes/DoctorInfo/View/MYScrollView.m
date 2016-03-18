//
//  MYScrollView.m
//  demo
//
//  Created by xll on 16/1/21.
//  Copyright © 2016年 xll12. All rights reserved.
//

#import "MYScrollView.h"

@interface MYScrollView ()


@property (weak,nonatomic) UIView * view3;

@end
@implementation MYScrollView
- (instancetype)initWithType:(InfoType)type
{
    self = [super init];
    if (self) {
        [self SetUpUIWithType:type];
    }
    return self;
}

-(void)SetUpUIWithType:(InfoType)type{
    CGFloat w = [UIScreen mainScreen].bounds.size.width;
    CGFloat h = 381;
    
    ConditionView * conditionView = [[ConditionView alloc]initWithFrame:CGRectMake(0, 0, w, h)];
    conditionView.backgroundColor = [UIColor whiteColor];
    self.conditionView = conditionView;
    [self addSubview:conditionView];
    
    DoctorInfoView * doctorInfoView = [[DoctorInfoView alloc]initWithFrame:CGRectMake(w, 0, w, h)];
    self.doctorInfoView = doctorInfoView;
    [self addSubview:doctorInfoView];
    self.contentSize = CGSizeMake(2 * w, h);
    if (type == KYDefalt) {
        DiagnoseTimeView * diagnoseTimeView = [[DiagnoseTimeView alloc]initWithFrame:CGRectMake(2*w,0, w, h)];
        diagnoseTimeView.backgroundColor = [UIColor whiteColor];
        self.diagnoseTimeView = diagnoseTimeView;
        [self addSubview:diagnoseTimeView];
        self.contentSize = CGSizeMake(3 * w, h);
   }
    
    //设置scrollView 相关
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator = NO;
    
 //  self.bounces = NO;                                  //无弹性
    self.pagingEnabled = YES;                           //分页

}
@end
