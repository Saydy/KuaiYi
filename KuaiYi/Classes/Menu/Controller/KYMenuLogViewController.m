//
//  KYMenuLogViewController.m
//  KuaiYi
//
//  Created by mac on 16/1/20.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import "KYMenuLogViewController.h"

#import "KYUserLoginVController.h"
#import "KYSettingTableController.h"
#import "KYNavController.h"
#import "KYRegistNemNumVController.h"

@interface KYMenuLogViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *image;

@end

@implementation KYMenuLogViewController
- (IBAction)loginButton:(UIButton *)sender {
    
    KYUserLoginVController *user = [[KYUserLoginVController alloc]init];
    [self.navigationController pushViewController:user animated:YES];
            [self.drawer reloadCenterViewControllerUsingBlock:^{
                
            [(KYNavController *)self.drawer.centerViewController pushViewController:user animated:YES];
        }];
  

}
- (IBAction)register:(id)sender {
    KYRegistNemNumVController *registNemNumVC = [[KYRegistNemNumVController alloc]init];
    
    [self.navigationController pushViewController:registNemNumVC animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.image.layer.cornerRadius = self.image.bounds.size.height /2;
    self.image.layer.masksToBounds = YES;
    
}
- (void)drawerControllerWillOpen:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = NO;
}

- (void)drawerControllerDidOpen:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = YES;
}

- (void)drawerControllerWillClose:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = NO;
}

- (void)drawerControllerDidClose:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
