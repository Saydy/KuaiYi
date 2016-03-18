//
//  KYSimultan.h
//  KuaiYi
//
//  Created by DaysSummer on 16/1/23.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KYSimultan : NSObject
@property (nonatomic ,assign)NSInteger complication_id;
@property (nonatomic ,strong) NSString *complication_name;

@property (nonatomic ,assign)BOOL select;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)simultanWithDict:(NSDictionary *)dict;

@end
