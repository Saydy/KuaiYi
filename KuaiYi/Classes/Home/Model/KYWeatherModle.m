//
//  KYWeatherModle.m
//  KuaiYi
//
//  Created by EndLess on 16/1/22.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import "KYWeatherModle.h"

@implementation KYWeatherModle



+ (NSDictionary *)objectClassInArray{
    return @{@"results" : [Results class]};
}
@end


@implementation Results

+ (NSDictionary *)objectClassInArray{
    return @{@"index" : [Index class], @"weather_data" : [Weather_Data class]};
}

@end


@implementation Index

@end


@implementation Weather_Data

@end


