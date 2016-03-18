//
//  KYAddMedicalTableController.h
//  KuaiYi
//
//  Created by DaysSummer on 16/1/24.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KYMedical.h"

typedef void(^responseMedical)(KYMedical *medical);

@interface KYAddMedicalTableController : UIViewController
- (instancetype)initWithResponse:(responseMedical)response;
- (instancetype)initWithMedical:(KYMedical *)medical Response:(responseMedical)response;

@end
