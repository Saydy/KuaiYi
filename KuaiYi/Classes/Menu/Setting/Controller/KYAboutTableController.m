//
//  KYAboutTableController.m
//  KuaiYi
//
//  Created by mac on 16/1/21.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import "KYAboutTableController.h"
#import "KYWebViewController.h"
#import <SVProgressHUD.h>

@interface KYAboutTableController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation KYAboutTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"关于产品";
    [self heardView];
 
  
}
- (void)heardView{
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 300)];
    
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ｌｏｇｏ"]];
    imageView.image = [UIImage imageNamed:@"ｌｏｇｏ"];
    imageView.center = CGPointMake(SCREEN_WIDTH/2, 150);
    [headerView addSubview:imageView];
    
    self.tableView.tableHeaderView = headerView;
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID ];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if (indexPath.row == 0){
    cell.textLabel.text = @"用户协议";
   
    }else if (indexPath.row == 1) {
         cell.textLabel.text = @"检查更新";
    }
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row ==0) {
        KYWebViewController *web = [[KYWebViewController alloc] init];
        web.title = @"用户协议";
        web.linkURL = [[NSBundle mainBundle] pathForResource:@"user_protolo" ofType:@"html"];
        [self.navigationController pushViewController:web animated:YES];
    }
    if (indexPath.row ==1) {
        /*   两种方式  弹出窗口
         UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"版本" message:@"最新" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
         
         [self.tableView addSubview:alert];
         [alert show];
         */
        [SVProgressHUD showInfoWithStatus:@"已经是最新版本!"];
        
        
    }


}



#pragma mark 添加头部试图

//- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    UIView *view = [[UIView alloc]init];
//   
//    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ｌｏｇｏ"]];
//    imageView.image = [UIImage imageNamed:@"ｌｏｇｏ"];
//    imageView.center = CGPointMake(SCREEN_WIDTH/2, 150);
//    [view addSubview:imageView];
//    
//    return view;
//
//}
//添加头部试图的时候  行高也要同时创建
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    return 25;
//
//}
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]init];
    
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 200;
}


@end
