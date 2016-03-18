//
//  KYHomeViewController.h
//  KuaiYi
//
//  Created by DaysSummer on 16/1/22.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICSDrawerController.h"
#import "ICSDropShadowView.h"
@protocol KYHomeViewControllerDelegate <NSObject>
@optional
- (void)openDrawer;
@end

@interface KYHomeViewController : UIViewController <ICSDrawerControllerChild, ICSDrawerControllerPresenting,KYHomeViewControllerDelegate>
@property (weak, nonatomic) id <KYHomeViewControllerDelegate> KYdelegate;
@property(nonatomic, weak) ICSDrawerController *drawer;
@end
