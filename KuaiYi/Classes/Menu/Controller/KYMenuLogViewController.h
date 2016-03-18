//
//  KYMenuLogViewController.h
//  KuaiYi
//
//  Created by mac on 16/1/20.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICSDrawerController.h"
#import "ICSDropShadowView.h"
@interface KYMenuLogViewController : UIViewController<ICSDrawerControllerChild,ICSDrawerControllerPresenting>
@property(nonatomic, weak) ICSDrawerController *drawer;

@end
