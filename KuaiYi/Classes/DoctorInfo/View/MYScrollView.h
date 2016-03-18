//
//  MYScrollView.h
//  demo
//
//  Created by xll on 16/1/21.
//  Copyright © 2016年 xll12. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ConditionView.h"
#import "DoctorInfoView.h"
#import "DiagnoseTimeView.h"
#import "MiddleView.h"
@interface MYScrollView : UIScrollView

@property (weak,nonatomic) ConditionView * conditionView;

@property (weak,nonatomic) DoctorInfoView * doctorInfoView;

@property (weak,nonatomic) DiagnoseTimeView * diagnoseTimeView;
- (instancetype)initWithType:(InfoType)type;
@end
