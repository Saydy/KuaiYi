//
//  KYaddTypeTableController.h
//  KuaiYi
//
//  Created by DaysSummer on 16/1/25.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^response)(NSInteger);

@interface KYaddTypeTableController : UITableViewController
- (instancetype)initWithResponse:(response)response;
@end
