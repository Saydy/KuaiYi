//
//  KYFavDoctor.m
//  KuaiYi
//
//  Created by DaysSummer on 16/1/21.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import "KYFavDoctor.h"

@implementation KYFavDoctor
- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)FavDoctorWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}
@end
