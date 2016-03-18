//
//  KYProvince.h
//  KuaiYi
//
//  Created by DaysSummer on 16/1/27.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KYProvince : NSObject
@property (nonatomic ,copy) NSString *name;
@property (nonatomic ,assign) BOOL mark;
- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)provinceWithDict:(NSDictionary *)dict;

@end
