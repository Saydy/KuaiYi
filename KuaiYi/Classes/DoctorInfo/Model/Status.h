//
//  Status.h
//  demo
//
//  Created by xll on 16/1/20.
//  Copyright © 2016年 xll12. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Status : NSObject
//医院名
@property (copy,nonatomic) NSString * hospital_name;
//头像
@property (copy,nonatomic) NSString * doctor_portrait;
//姓名
@property (copy,nonatomic) NSString * doctor_name;
//职称
@property (copy,nonatomic) NSString * doctor_title_name;
//所属科室
@property (copy,nonatomic) NSString * department_name;
//鲜花数
@property (assign,nonatomic) NSInteger flower;
//锦旗
@property (assign,nonatomic) NSInteger banner;
//预约量
@property (assign,nonatomic) NSInteger operation_count;
-(instancetype)initWithDic:(NSDictionary *)dict;

@end
