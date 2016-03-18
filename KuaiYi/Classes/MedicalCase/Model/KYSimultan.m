//
//  KYSimultan.m
//  KuaiYi
//
//  Created by DaysSummer on 16/1/23.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import "KYSimultan.h"

@implementation KYSimultan
- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)simultanWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}
@end
