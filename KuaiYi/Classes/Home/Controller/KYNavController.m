//
//  KYNavController.m
//  KuaiYi
//
//  Created by EndLess on 16/1/19.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import "KYNavController.h"
#import "SDCycleScrollView.h"
#import <SVProgressHUD.h>

@interface KYNavController ()

@end

@implementation KYNavController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

  
    for (UIViewController *vc in self.viewControllers) {
        if ([vc isKindOfClass:[KYHomeViewController class]]) {
            KYHomeViewController *mainVC = (KYHomeViewController *)vc;
            mainVC.KYdelegate = self;
        }
    }
  

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)openDrawer
{
    [self.drawer open];
    
}

//关闭用户交互
- (void)drawerControllerWillOpen:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = NO;
}

- (void)drawerControllerDidOpen:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = NO;
}

- (void)drawerControllerWillClose:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = NO;
}

- (void)drawerControllerDidClose:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = YES;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    UIBarButtonItem *barBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"fanhui"] style:UIBarButtonItemStylePlain target:self action:@selector(pop)];
    viewController.navigationItem.leftBarButtonItem = barBtn;
    
    [super pushViewController:viewController animated:animated];
}
- (void)pop {
    [SVProgressHUD dismiss];
    [self popViewControllerAnimated:YES];
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
