//
//  KYmainViewController.h
//  KuaiYi
//
//  Created by EndLess on 16/1/19.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICSDrawerController.h"
#import "ICSDropShadowView.h"

@protocol KYMainControllerDelegate <NSObject>

@optional
- (void)openDrawer;

@end

@interface KYmainViewController : UIViewController <ICSDrawerControllerChild, ICSDrawerControllerPresenting,KYMainControllerDelegate>
@property (weak, nonatomic) id <KYMainControllerDelegate> KYdelegate;
@property(nonatomic, weak) ICSDrawerController *drawer;


@end
