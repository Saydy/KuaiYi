//
//  KYMenuViewController.m
//  KuaiYi
//
//  Created by mac on 16/1/19.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import "KYMenuViewController.h"
#import "KYNavController.h"
#import "KYSettingTableController.h"

#import "KYAboutTableController.h"
#import "KYFavoritesTableController.h"

#import "KYUserInfo.h"

#import <UIImageView+WebCache.h>
#import "KYUserMessageController.h"
#import "KYManageViewController.h"
#import "KYDocApplyViewController.h"
#import "UMSocial.h"

@interface KYMenuViewController ()<UITableViewDataSource,UITableViewDelegate,UMSocialUIDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *telNum;


@end

@implementation KYMenuViewController




- (IBAction)ViewClick:(UIButton *)sender {
    [self.drawer reloadCenterViewControllerUsingBlock:^{
         KYUserMessageController *mes = [[KYUserMessageController alloc]init];
        
        [(KYNavController *)self.drawer.centerViewController pushViewController:mes animated:YES];
    }];

  
    
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    KYUserInfoModel *user = [KYUserInfo sharedUserInfo].userInfo;
    if (user == nil) {
        return;
    }
    NSURL *url = [NSURL URLWithString:user.head_photo];
    [self.iconView  sd_setImageWithURL:url placeholderImage:[UIImage imageNamed: @"nav_head"]];
   
    self.telNum.text = user.true_name;
    


}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.iconView.layer.cornerRadius = self.iconView.bounds.size.height /2 ;
    self.iconView.layer.masksToBounds = YES;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
    

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        
    }
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
   
    if (indexPath.section == 0  ) {
       
       
        if (indexPath.row ==0){
            
            cell.textLabel.text = @"名医通申请";
        }else if (indexPath.row == 1){
            cell.textLabel.text = @"病例管理";
        }else if (indexPath.row == 2){
            cell.textLabel.text = @"关注医生";
        }
        
    } if(indexPath.section == 1) {
        
        
        if (indexPath.row ==0){
            
            cell.textLabel.text = @"设置与帮助";
        }else if (indexPath.row == 1){
            cell.textLabel.text = @"关于产品";
        }else if (indexPath.row == 2){
            cell.textLabel.text = @"分享给好友";
        }
        
    }
    return cell;
}
 
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
      [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if(indexPath.section == 0 && indexPath.row ==0 ){
        [self.drawer reloadCenterViewControllerUsingBlock:^{
           KYDocApplyViewController  *set = [[KYDocApplyViewController alloc]init];
            
            
            [(KYNavController *)self.drawer.centerViewController pushViewController:set animated:YES];
        }];
    }
    if(indexPath.section == 0 && indexPath.row ==1 ){
        [self.drawer reloadCenterViewControllerUsingBlock:^{
           KYManageViewController *set = [[KYManageViewController alloc]init];
            
            
            [(KYNavController *)self.drawer.centerViewController pushViewController:set animated:YES];
        }];
    }

    if(indexPath.section == 0 && indexPath.row ==2 ){
        [self.drawer reloadCenterViewControllerUsingBlock:^{
            KYFavoritesTableController *set = [[KYFavoritesTableController alloc]init];
            
            
            [(KYNavController *)self.drawer.centerViewController pushViewController:set animated:YES];
        }];
    }

    if(indexPath.section == 1 && indexPath.row ==0 ){
[self.drawer reloadCenterViewControllerUsingBlock:^{
    KYSettingTableController *set = [[KYSettingTableController alloc]initWithStyle:UITableViewStyleGrouped];

    
    [(KYNavController *)self.drawer.centerViewController pushViewController:set animated:YES];
}];
    }

    if(indexPath.section == 1 && indexPath.row ==1 ){
        [self.drawer reloadCenterViewControllerUsingBlock:^{
            KYAboutTableController *set = [[KYAboutTableController alloc]initWithStyle:UITableViewStyleGrouped];
            
            
            [(KYNavController *)self.drawer.centerViewController pushViewController:set animated:YES];
        }];
    }
    if(indexPath.section == 1 && indexPath.row ==2){
        [UMSocialSnsService presentSnsIconSheetView:self
                                             appKey:@"56a593b167e58ea29f000128"
                                          shareText:@"你要分享的文字"
                                         shareImage:[UIImage imageNamed:@"sun"]
                                    shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,UMShareToWechatSession,UMShareToQQ,UMShareToQzone,nil]
                                           delegate:self];

    }

    

}


@end
