//
//  KYIedaTableController.m
//  KuaiYi
//
//  Created by mac on 16/1/23.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import "KYIedaTableController.h"

@interface KYIedaTableController ()<UITableViewDelegate>

@end

@implementation KYIedaTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    //整个tableview的头;
    UITableViewCell *heard =[[NSBundle mainBundle]loadNibNamed:@"KYIedaView" owner:self options:nil ].firstObject;
    self.tableView.tableHeaderView = heard;
    self.title = @"意见反馈";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"idea";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID ] ;
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
        if (indexPath.row == 0) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

        cell.textLabel.text = @"客户电话:400-633-1113";
            cell.textLabel.font = [UIFont systemFontOfSize:15];
    }else if (indexPath.row == 1){
    cell.textLabel.text = @"用户交流群:464768569";
         cell.textLabel.font = [UIFont systemFontOfSize:15];
    
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%@",indexPath);
    if (indexPath.row == 0) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"是否拨打电话" message:@"400-633-1113" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"拨打", nil];
        
//        [self.tableView addSubview:alert];
        [alert show];
    }

}


//每组之间的标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"欢迎联系我们";
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 25;
    
}



@end
