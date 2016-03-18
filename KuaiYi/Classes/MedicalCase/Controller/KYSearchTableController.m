//
//  KYSearchTableController.m
//  KuaiYi
//
//  Created by DaysSummer on 16/1/22.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import "KYSearchTableController.h"
#import "KYNetWorking.h"
#import "KYThorough.h"
#import <SVProgressHUD.h>
#import <MJRefresh.h>

@interface KYSearchTableController ()
@property (nonatomic ,strong) NSMutableArray *thoroughs;
@property (nonatomic ,assign) NSInteger index;
@property (nonatomic ,strong) responseSearch response;

@end

@implementation KYSearchTableController

- (instancetype)initWithResponse:(responseSearch)response {
    if (self =[super init]) {
        self.response = response;
    }
    return self;
}
+ (instancetype)SearchWithResponse:(responseSearch)response {
    KYSearchTableController *searchVC = [[self alloc] init];
    searchVC.response =response;
    return searchVC;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupNavi];
    [self setupTableView];
    [self loadListData:++self.index];
}

- (void)setupNavi {
    UIBarButtonItem *searchBarButton = [[UIBarButtonItem alloc] initWithTitle:@"搜索" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.rightBarButtonItems = @[searchBarButton];
    
    UISearchBar *titleView = [[UISearchBar alloc] init];
    titleView.placeholder = @"疾病细分搜索";
    self.navigationItem.titleView = titleView;
}
- (void)setupTableView {
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        self.index = 0;
        [self loadListData:++self.index];
    }];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self loadListData:++self.index];
    }];
}

- (void)loadListData:(NSInteger)index {
    [SVProgressHUD showWithStatus:@"正在加载..."];
    NSDictionary *parameter = @{@"page": @(index),@"page_size":@(15),@"ci1_id":@(self.cid_1),@"keyword":@""};
    [[KYNetWorking sharedNetWorking] POSTWithURlString:@"searchCI3List.json.php" parameterDict:parameter success:^(NSDictionary *responseObject) {
        [SVProgressHUD dismiss];
        NSArray *arr = responseObject[@"data"];
        NSMutableArray * arrM = [NSMutableArray array];
        for (NSDictionary *item in arr) {
            [arrM addObject:[KYThorough thoroughWithDict:item]];
        }
        if (index == 1 ) {
            self.thoroughs = arrM;
        }else {
            [self.thoroughs addObjectsFromArray:arrM];
        }
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
    } failure:^(NSError *error) {
        NSLog(@"%@" ,error);
        [SVProgressHUD showErrorWithStatus:@"获取失败"];
        [self.tableView.mj_header endRefreshing];
    }];
}

#pragma mark - UITableViewDataSouce
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.thoroughs.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    KYThorough *thorough = self.thoroughs[indexPath.row];
    
    static NSString *searchCellID = @"baseCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:searchCellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:searchCellID];
    }
    cell.textLabel.text = thorough.ci3_name;
    return cell;
}
#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    KYThorough *through = self.thoroughs[indexPath.row];
    if (self.response) {
        self.response(through);
    }
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark -  延迟加载
- (NSMutableArray *)thoroughs {
    if (!_thoroughs) {
        _thoroughs = [NSMutableArray array];
    }
    return _thoroughs;
}
- (void)dealloc {
    NSLog(@"销毁 - %s" ,__FUNCTION__);
}
@end
