//
//  KYWeatherModle.h
//  KuaiYi
//
//  Created by EndLess on 16/1/22.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Results,Index,Weather_Data;
@interface KYWeatherModle : NSObject

@property (nonatomic, copy) NSString *status;

@property (nonatomic, strong) NSArray<Results *> *results;

@property (nonatomic, copy) NSString *error;

@property (nonatomic, copy) NSString *date;

@end
@interface Results : NSObject

@property (nonatomic, strong) NSArray<Weather_Data *> *weather_data;

@property (nonatomic, copy) NSString *pm25;

@property (nonatomic, copy) NSString *currentCity;

@property (nonatomic, strong) NSArray<Index *> *index;

@end

@interface Index : NSObject

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *des;

@property (nonatomic, copy) NSString *tipt;

@property (nonatomic, copy) NSString *zs;

@end

@interface Weather_Data : NSObject

@property (nonatomic, copy) NSString *temperature;

@property (nonatomic, copy) NSString *weather;

@property (nonatomic, copy) NSString *wind;

@property (nonatomic, copy) NSString *date;

@property (nonatomic, copy) NSString *dayPictureUrl;

@property (nonatomic, copy) NSString *nightPictureUrl;

@end

