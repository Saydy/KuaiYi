//
//  KYSettingTableController.m
//  KuaiYi
//
//  Created by mac on 16/1/20.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import "KYSettingTableController.h"
#import "KYUserInfo.h"

#import "KYMenuLogViewController.h"
#import "KYRevisePasswordViewController.h"

#import "KYIedaTableController.h"
#import "KYWebViewController.h"

@interface KYSettingTableController ()<UITableViewDelegate>

@end

@implementation KYSettingTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置与分享";
       self.view.backgroundColor = [UIColor whiteColor];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID ];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }

    if (indexPath.row ==  0) {
//  这里的照片可以删掉    最后调试时
        [self tableview:cell  text:@"意见反馈" type:UITableViewCellAccessoryDisclosureIndicator];
    }
    if (indexPath.row ==  1) {
        
        [self tableview:cell  text:@"加号服务说明" type:UITableViewCellAccessoryDisclosureIndicator];
    }
    if (indexPath.row ==  2) {
       
        [self tableview:cell  text:@"修改密码" type:UITableViewCellAccessoryDisclosureIndicator];
    }
    if (indexPath.row ==  3) {
              [self tableview:cell  text:@"注销账号" type:UITableViewCellAccessoryDisclosureIndicator];
    }
    return cell;
}

- (void)tableview: (UITableViewCell *)cell text:(NSString *)text type:(UITableViewCellAccessoryType )type {
  
    
    cell.textLabel.text =text;
    cell.accessoryType = type;
    
}
#pragma mark  点击设置中注册账户 回到为登陆页面
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        [self.navigationController pushViewController: [[KYIedaTableController alloc]initWithStyle:UITableViewStyleGrouped] animated:YES];
    }
    if (indexPath.row == 1) {
        KYWebViewController *web = [[KYWebViewController alloc] init];
        web.title = @"加号服务说明";
        web.linkURL = [[NSBundle mainBundle] pathForResource:@"user_protolo" ofType:@"html"];
        [self.navigationController pushViewController:web animated:YES];
    }
    if (indexPath.row == 2) {
           
        [self.navigationController pushViewController: [[KYRevisePasswordViewController alloc]init] animated:YES];
        
    }
    
    
    if (indexPath.row == 3) {
        
        [KYUserInfo sharedUserInfo].userInfo = nil;
        [self.navigationController popToRootViewControllerAnimated:YES];
        
    }
    
}

@end
