//
//  AppDelegate.m
//  KuaiYi
//
//  Created by DaysSummer on 16/1/19.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import "AppDelegate.h"
#import "KYMenuViewController.h"
#import "KYHomeViewController.h"
#import "ICSDrawerController.h"
#import "KYNavController.h"
#import "KYmainViewController.h"
#import "KYMenuLogViewController.h"
#import "UMSocial.h"

#import <SMS_SDK/SMSSDK.h>

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self setThemeColor];
     [UMSocialData setAppKey:@"56a593b167e58ea29f000128"]; //友盟
    [SMSSDK registerApp:@"f1096a4a4eb9"
             withSecret:@"b34176657075ec80449fb018c073713a"]; // 短信验证
   
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [[UIColor alloc] initWithRed:235 / 255.0 green:235 / 255.0 blue:241 / 255.0 alpha:1];

//    KYMenuViewController *leftVC = [[KYMenuViewController alloc] init];
    KYMenuLogViewController *leftVC = [[KYMenuLogViewController alloc] init];
    KYHomeViewController *main = [[KYHomeViewController alloc] init];
    KYNavController *navC =
    [[KYNavController alloc] initWithRootViewController:main];
    ICSDrawerController *drawer =
    [[ICSDrawerController alloc] initWithLeftViewController:leftVC
                                       centerViewController:navC];
    
    
    self.window.rootViewController = drawer;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)setThemeColor {
    UINavigationBar.appearance.barTintColor = THEMECOLOR;
    UINavigationBar.appearance.tintColor = [UIColor whiteColor];
    [UINavigationBar.appearance setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state.
    // This can occur for certain types of temporary interruptions (such as an
    // incoming phone call or SMS message) or when the user quits the application
    // and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down
    // OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate
    // timers, and store enough application state information to restore your
    // application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called
    // instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state;
    // here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the
    // application was inactive. If the application was previously in the
    // background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if
    // appropriate. See also applicationDidEnterBackground:.
}

@end
