//
//  KYProvince.m
//  KuaiYi
//
//  Created by DaysSummer on 16/1/27.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import "KYProvince.h"

@implementation KYProvince
- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)provinceWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
}
@end
