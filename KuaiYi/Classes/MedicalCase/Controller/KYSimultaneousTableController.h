//
//  KYSimultaneousTableController.h
//  KuaiYi
//
//  Created by DaysSummer on 16/1/23.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KYThorough.h"
typedef void(^responseArr)(NSArray *);

@interface KYSimultaneousTableController : UITableViewController
- (instancetype)initWithResponse:(responseArr)response;
+ (instancetype)SearchWithResponse:(responseArr)response;
@end
