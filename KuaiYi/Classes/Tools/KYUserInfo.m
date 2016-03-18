//
//  KYUserInfo.m
//  KuaiYi
//
//  Created by DaysSummer on 16/1/20.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import "KYUserInfo.h"
#import "KYMenuViewController.h"
#import "KYMenuLogViewController.h"

#import "ICSDrawerController.h"
#import "KYNavController.h"
#import "KYmainViewController.h"




static KYUserInfo *_INSTANCE;
@implementation KYUserInfo
+ (instancetype)sharedUserInfo {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _INSTANCE = [[self alloc] init];
    });
    return _INSTANCE;
}
- (void)setUserInfo:(KYUserInfoModel *)userInfo {
    _userInfo = userInfo;
    
    if (userInfo) {
        KYMenuViewController *leftVC = [[KYMenuViewController alloc] init];
        
        ICSDrawerController *oldDrawer = (ICSDrawerController *)[UIApplication sharedApplication].keyWindow.rootViewController;
        KYNavController *navC = (KYNavController *)oldDrawer.centerViewController;
        
        ICSDrawerController *drawer = [[ICSDrawerController alloc] initWithLeftViewController:leftVC centerViewController:navC];
        [UIApplication sharedApplication].keyWindow.rootViewController = drawer;
    } else {
        KYMenuLogViewController *leftVC = [[KYMenuLogViewController alloc] init];
        
        ICSDrawerController *oldDrawer = (ICSDrawerController *)[UIApplication sharedApplication].keyWindow.rootViewController;
        KYNavController *navC = (KYNavController *)oldDrawer.centerViewController;
        
        ICSDrawerController *drawer = [[ICSDrawerController alloc] initWithLeftViewController:leftVC centerViewController:navC];
        [UIApplication sharedApplication].keyWindow.rootViewController = drawer;
    }

}

@end
