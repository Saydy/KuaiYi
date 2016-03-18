//
//  KYMedical.h
//  KuaiYi
//
//  Created by DaysSummer on 16/1/26.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KYMedical : NSObject
@property (nonatomic ,copy) NSString *name;
@property (nonatomic ,copy) NSString *name2;
@property (nonatomic ,strong) NSArray *labels;

//@property (nonatomic ,strong) UIImage *icon;
@property (nonatomic ,copy) NSString *text;
@property (nonatomic ,copy) NSString *time;
@property (nonatomic ,strong) UIImage *image;

@end
