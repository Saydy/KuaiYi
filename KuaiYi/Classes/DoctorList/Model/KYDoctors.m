//
//  KYDoctors.m
//  KuaiYi
//
//  Created by 侯谢送 on 16/1/20.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import "KYDoctors.h"
#import "KYNetWorking.h"
#import "KYDoctor.h"

@implementation KYDoctors

- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        
        [self setValuesForKeysWithDictionary:dict];
        }
    return self;
}

+ (instancetype)doctorsWithDict:(NSDictionary *)dict {

    return [[self alloc] initWithDict:dict];
}




@end
