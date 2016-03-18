//
//  KYWeatherView.h
//  KuaiYi
//
//  Created by EndLess on 16/1/22.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KYWeatherView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *day;
@property (weak, nonatomic) IBOutlet UIButton *city;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UILabel *temp;
+ (instancetype)createView;




@end
