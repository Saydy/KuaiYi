//
//  KYMenuViewController.h
//  KuaiYi
//
//  Created by mac on 16/1/19.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICSDrawerController.h"
#import "ICSDropShadowView.h"
#import "KYUserInfoModel.h"

@interface KYMenuViewController : UIViewController <ICSDrawerControllerChild,ICSDrawerControllerPresenting>
@property(nonatomic, weak) ICSDrawerController *drawer;


@end
