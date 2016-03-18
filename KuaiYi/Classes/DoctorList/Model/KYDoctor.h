//
//  KYDoctor.h
//  KuaiYi
//
//  Created by 侯谢送 on 16/1/20.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KYDoctor : NSObject

@property (copy, nonatomic) NSString *doctor_portrait;//医生头像

@property (copy, nonatomic) NSString *doctor_name;//医生姓名

@property (copy, nonatomic) NSString *doctor_title_name;//医生职位

@property (copy, nonatomic) NSString *doctor_hospital_name;//医生所属医院

@property (assign, nonatomic) NSInteger operation_count;//预约数

@property (assign, nonatomic) NSInteger flower;//鲜花数

@property (assign, nonatomic) NSInteger banner;//锦旗数

@property (copy, nonatomic) NSString *accuracy;//匹配度

@property (assign, nonatomic) NSInteger doctor_gender;//医生性别

@property (assign, nonatomic) NSInteger doctor_id;

@property (copy, nonatomic) NSString *easymob_id;

//@property (copy, nonatomic) NSString *operation_count;//预约数
//
//@property (copy, nonatomic) NSString *flower;//鲜花数
//
//@property (copy, nonatomic) NSString *banner;//锦旗数




- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)dotorWithDict:(NSDictionary *)dict;


/**
 
 doctor_id	:	300000315
 
 doctor_title_name	:	心理医生
 
 doctor_gender	:	1
 
 easymob_id	:	d300000315
 
 */
@end
