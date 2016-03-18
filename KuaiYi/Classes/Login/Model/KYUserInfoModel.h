//
//  KYUserInfoModel.h
//  KuaiYi
//
//  Created by mac on 16/1/20.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import <UIKit/UIKit.h>




@interface KYUserInfoModel : NSObject
/*
 address = "\U5c71\U4e1c\U7701";
 age = 28;
 "associate_id" = "<null>";
 "card_number" = 110109198707061355;
 "card_type" = 1;
 "city_id" = 0;
 "county_id" = 0;
 "easymob_id" = u1000089;
 "easymob_password" = 123456;
 gender = 1;
 "head_photo" = "http://hdkj-web1.chinacloudapp.cn:8080/res/1071000089-1451374760656.png";
 height = "185.0";
 "is_certify" = 1;
 "login_token" = 321017f8952c7a60fd626c470dd452b9;
 "mobile_number" = 13269130063;
 "province_id" = 370000;
 "true_name" = "\U738b\U4e91\U8d22";
 "user_id" = 1000089;
 weight = "156.0";
 */


/**
*  地址
*/
@property (nonatomic,copy) NSString *address;
/**
 *  年龄
 */
@property (nonatomic,assign) NSInteger age;

@property (nonatomic,assign) NSString *card_number;
/**
 *  密码
 */
@property (nonatomic,assign) NSInteger easymob_password;
/**
 *  性别
 */
@property (nonatomic,assign,getter=isGender) BOOL gender;
/**
 *  用户头像
 */
@property (nonatomic,copy) NSString *head_photo;

/**
 *  身高
 */
@property (nonatomic,assign) CGFloat height;
/**
 *  用户的token
 */
@property (nonatomic,copy) NSString *login_token;
/**
 *  用户的电话号
 */
@property (nonatomic,copy) NSString *mobile_number;

/**
 *  用户的真实名字
 */
@property (nonatomic,copy) NSString *true_name;

/**
 *  用户的id
 */
@property (nonatomic,copy) NSString *user_id;

/**
 *  用户的体重
 */
@property (nonatomic,assign) CGFloat weight;

/**
 *  记录用户是否登录
 */
@property (nonatomic,assign,getter=isLogin) BOOL login;


@end
