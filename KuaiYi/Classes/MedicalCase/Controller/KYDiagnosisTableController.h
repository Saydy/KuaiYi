//
//  KYDiagnosisTableController.h
//  KuaiYi
//
//  Created by DaysSummer on 16/1/23.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^responseDiagnosis)(NSInteger);

@interface KYDiagnosisTableController : UITableViewController
- (instancetype)initWithResponse:(responseDiagnosis)response;
+ (instancetype)SearchWithResponse:(responseDiagnosis)response;
@end
