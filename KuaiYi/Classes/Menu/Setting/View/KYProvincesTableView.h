//
//  KYProvincesTableView.h
//  KuaiYi
//
//  Created by DaysSummer on 16/1/27.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KYProvince.h"

@interface KYProvincesTableView : UITableView
@property (nonatomic ,strong) KYProvince *lastProvince;

+ (instancetype)provinces ;
@end
