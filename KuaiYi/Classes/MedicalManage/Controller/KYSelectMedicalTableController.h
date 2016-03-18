//
//  KYSelectMedicalTableController.h
//  KuaiYi
//
//  Created by DaysSummer on 16/1/25.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^responseTitleArr)(NSArray *titles);

@interface KYSelectMedicalTableController : UITableViewController

@property (nonatomic ,strong) NSMutableArray *selectMedicals;
- (instancetype)initWithStringArr:(NSArray *)stringArr Response:(responseTitleArr)response;
@end
