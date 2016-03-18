//
//  KYFavoritesTableController.m
//  KuaiYi
//
//  Created by DaysSummer on 16/1/20.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import "KYFavoritesTableController.h"
#import "KYNetWorking.h"
#import "KYFavDoctor.h"
#import "KYFavTableViewCell.h"

#import <MJRefresh/MJRefresh.h>
#import "ViewController.h"

@interface KYFavoritesTableController ()
@property (nonatomic ,strong) NSMutableArray *favDoctors;
@property (nonatomic,assign)NSInteger index;
@end

@implementation KYFavoritesTableController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"关注的医生";
    self.tableView.rowHeight = 94;
    
    [self loadSourse];
    [self setupFresh];
    [self setdownFresh];
    
}
#pragma mark 加载更多数据
- (void)loadSourse{
    [[KYNetWorking sharedNetWorking] POSTWithURlString:@"http://iosapi.itcast.cn/doctorList.json.php" parameterDict:@{@"user_id":@(1000089),@"page_size":@(15),@"page":@1} success:^(NSDictionary *responseObject) {
        NSArray *doctorDicts = responseObject[@"data"];
        NSMutableArray *arrM =[NSMutableArray array];
        for (NSDictionary *dict in doctorDicts) {
            [arrM addObject: [KYFavDoctor FavDoctorWithDict:dict]];
        }
        self.favDoctors = arrM;
//        NSLog(@"%@",doctorDicts);
//        NSLog(@"%@",[NSThread currentThread]);
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];

    } failure:^(NSError *error) {
        NSLog(@"%@" ,error);
        [self.tableView.mj_header endRefreshing];

    }];


}

#pragma  mark - 加载更多数据
- (void)loadMore{
    [[KYNetWorking sharedNetWorking] POSTWithURlString:@"http://iosapi.itcast.cn/doctorList.json.php" parameterDict:@{@"user_id":@(1000089),@"page_size":@(15),@"page":@(++self.index)} success:^(NSDictionary *responseObject) {
        NSArray *doctorDicts = responseObject[@"data"];
        NSLog(@"%zd",self.index);
        NSMutableArray *arrM =[NSMutableArray array];
        for (NSDictionary *dict in doctorDicts) {
            [arrM addObject: [KYFavDoctor FavDoctorWithDict:dict]];
            [self.favDoctors addObjectsFromArray:arrM];
        }
      // self.favDoctors = arrM;
//        NSLog(@"%@",doctorDicts);
//        NSLog(@"%@",[NSThread currentThread]);
        [self.tableView reloadData];
        [self.tableView.mj_footer endRefreshing];

    } failure:^(NSError *error) {
        NSLog(@"%@" ,error);
        [self.tableView.mj_footer endRefreshing];

    }];
    


}

#pragma mark 上拉刷新 和下拉刷新
- (void)setupFresh {
   
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self loadSourse];
       
    }];
    
   
}

- (void)setdownFresh{

    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        
        [self loadMore];
    }];

}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.favDoctors.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"ys";
   KYFavDoctor *doc = self.favDoctors[indexPath.row];
    KYFavTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[NSBundle mainBundle]loadNibNamed:@"KYFavoritesTableCell" owner:nil options:nil ].firstObject;
        cell.doctor = doc;
    }

    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    KYFavDoctor *doctor = self.favDoctors[indexPath.row];
    //    cell.doctor = doctor;
    NSInteger doctor_id = doctor.doctor_id;
    ViewController *doctorInfoVC = [[ViewController alloc] initWithDoctor_id:doctor_id andChoseType:KYGuanZhu];
    [self.navigationController pushViewController:doctorInfoVC animated:YES];
}

@end
