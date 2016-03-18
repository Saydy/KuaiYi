//
//  KYWeatherView.m
//  KuaiYi
//
//  Created by EndLess on 16/1/22.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import "KYWeatherView.h"

@implementation KYWeatherView

+ (instancetype)createView
{
  return
    [[NSBundle mainBundle] loadNibNamed:@"KYWeatherView" owner:nil options:nil]
      .firstObject;
}

@end
