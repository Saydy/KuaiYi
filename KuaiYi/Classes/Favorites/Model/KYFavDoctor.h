//
//  KYFavDoctor.h
//  KuaiYi
//
//  Created by DaysSummer on 16/1/21.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KYFavDoctor : NSObject

/**
 *  医生名字
 */
@property (nonatomic ,strong) NSString *doctor_name;

/**
 *  医生照片
 */
@property (nonatomic ,strong) NSString *doctor_portrait;

/**
 *  预约量
 */
@property (nonatomic ,assign) NSInteger operation_count;

/**
 *  花束
 */
@property (nonatomic ,assign) NSInteger flower;

/**
 *  旗帜数量
 */
@property (nonatomic ,assign) NSInteger banner;

/**
 *  医生ID
 */
@property (nonatomic ,assign) NSInteger doctor_id;

/**
 *  医生性别
 */
@property (nonatomic ,strong) NSString *doctor_gender;

/**
 *  科类ID
 */
@property (nonatomic ,assign) NSInteger doctor_title_id;

/**
 *  医院名字
 */
@property (nonatomic ,strong) NSString *hospital_name;

/**
 *  医生科类
 */
@property (nonatomic ,strong) NSString *doctor_title_name;

/**
 *  医生关系ID?
 */
@property (nonatomic ,strong) NSString *doctor_attention_id;

/**
 *  容易摸不透程度?
 */
@property (nonatomic ,strong) NSString *easymob_id;

/**
 *  医院ID
 */
@property (nonatomic ,strong) NSString *hospital_id;


- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)FavDoctorWithDict:(NSDictionary *)dict;
@end
