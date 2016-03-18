//
//  KYDoctor.m
//  KuaiYi
//
//  Created by 侯谢送 on 16/1/20.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import "KYDoctor.h"

@implementation KYDoctor

- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)dotorWithDict:(NSDictionary *)dict{
    
    return [[self alloc] initWithDict:dict];
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{}

@end
