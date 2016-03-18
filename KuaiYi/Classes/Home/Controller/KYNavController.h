//
//  KYNavController.h
//  KuaiYi
//
//  Created by EndLess on 16/1/19.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICSDrawerController.h"
#import "ICSDropShadowView.h"
#import "KYHomeViewController.h"

@interface KYNavController : UINavigationController <ICSDrawerControllerChild,ICSDrawerControllerPresenting,KYHomeViewControllerDelegate>

@property(nonatomic, weak) ICSDrawerController *drawer;




@end
