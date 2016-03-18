//
//  KYThorough.h
//  KuaiYi
//
//  Created by DaysSummer on 16/1/22.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KYThorough : NSObject
@property (nonatomic ,assign) NSInteger ci2_id;

@property (nonatomic ,assign) NSInteger ci3_id;
@property (nonatomic ,strong) NSString *ci3_name;



- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)thoroughWithDict:(NSDictionary *)dict;
@end
