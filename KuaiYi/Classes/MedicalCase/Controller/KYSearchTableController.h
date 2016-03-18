//
//  KYSearchTableController.h
//  KuaiYi
//
//  Created by DaysSummer on 16/1/22.
//  Copyright © 2016年 SayDy. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "KYThorough.h"
typedef void(^responseSearch)(KYThorough *);


@interface KYSearchTableController : UITableViewController
@property (nonatomic ,assign)NSInteger cid_1;
- (instancetype)initWithResponse:(responseSearch)response;
+ (instancetype)SearchWithResponse:(responseSearch)response;

@end
