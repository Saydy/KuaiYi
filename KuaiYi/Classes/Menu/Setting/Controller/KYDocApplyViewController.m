//
//  KYDocApplyViewController.m
//  KuaiYi
//
//  Created by mac on 16/1/23.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import "KYDocApplyViewController.h"

#import<MJRefresh/MJRefresh.h>

@interface KYDocApplyViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation KYDocApplyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"名医通申请";
    
    //[self setupSourse];
[self setDownSourse];
    self.tableView.tableFooterView = [[UIView alloc]init];
}

- (void)didReceiveMemoryWarning {
[super didReceiveMemoryWarning];
// Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   static NSString *ID = @"list";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    return cell;
}
- (void)setDownSourse {
self.tableView .mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
    [self.tableView.mj_header endRefreshing];
}];

}




//- (void)setDownSourse {
//
//self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
//    [self.tableView.mj_footer endRefreshing];
//}];
//}
@end
