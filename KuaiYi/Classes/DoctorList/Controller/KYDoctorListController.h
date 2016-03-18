//
//  KYDoctorListController.h
//  KuaiYi
//
//  Created by 侯谢送 on 16/1/20.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KYDoctorListController : UITableViewController
//@"ci1_id":@(1),@"ci2_id":@(3),@"ci3_id":@(3)

@property (assign, nonatomic) NSInteger ci1_id;

@property (assign, nonatomic) NSInteger ci2_id;

@property (assign, nonatomic) NSInteger ci3_id;


- (instancetype)initWithDict:(NSDictionary *)dict;
//- (instancetype)initWithCi1_id:(NSNumber *)ci1_id ci2_id:(NSNumber *)ci2_id ci3_id:(NSNumber *)ci3_id;

@end
