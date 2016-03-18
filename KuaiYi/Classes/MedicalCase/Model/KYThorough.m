//
//  KYThorough.m
//  KuaiYi
//
//  Created by DaysSummer on 16/1/22.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import "KYThorough.h"

@implementation KYThorough
- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)thoroughWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}
@end
