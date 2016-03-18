//
//  KYDoctors.h
//  KuaiYi
//
//  Created by 侯谢送 on 16/1/20.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import <Foundation/Foundation.h>
//@class KYDoctor;

@interface KYDoctors : NSObject

//当前医生

@property (assign, nonatomic) NSInteger code;

@property (assign, nonatomic) NSInteger msg;

@property (strong, nonatomic) NSArray *data;


+ (instancetype)doctorsWithDict:(NSDictionary *)dict;

- (instancetype)initWithDict:(NSDictionary *)dict;
@end
