//
//  KYUserInfo.h
//  KuaiYi
//
//  Created by DaysSummer on 16/1/20.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KYUserInfoModel.h"

@interface KYUserInfo : NSObject
@property (nonatomic ,strong) KYUserInfoModel *userInfo;

+ (instancetype)sharedUserInfo;

@end
