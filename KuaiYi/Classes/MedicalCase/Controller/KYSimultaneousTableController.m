//
//  KYSimultaneousTableController.m
//  KuaiYi
//
//  Created by DaysSummer on 16/1/23.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import "KYSimultaneousTableController.h"
#import "KYNetWorking.h"
#import <SVProgressHUD.h>
#import <MJRefresh.h>
#import "KYSimultan.h"
#import <MJExtension.h>

@interface KYSimultaneousTableController ()
@property (nonatomic ,assign) NSInteger index;
@property (nonatomic ,strong) responseArr response;
@property (nonatomic ,strong) NSMutableArray *simus;
@property (nonatomic ,strong) NSMutableArray *selectSimu;

@end

@implementation KYSimultaneousTableController

- (instancetype)initWithResponse:(responseArr)response {
    if (self =[super init]) {
        self.response = response;
    }
    return self;
}
+ (instancetype)SearchWithResponse:(responseArr)response {
    KYSimultaneousTableController *searchVC = [[self alloc] init];
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
    UIBarButtonItem *searchBarButton = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(selectEndClick)];
    self.navigationItem.rightBarButtonItems = @[searchBarButton];

    self.navigationItem.title = @"选择并发症";
}

- (void)selectEndClick {
    if (self.response && self.selectSimu.count) {
        self.response(self.selectSimu);
    }else {
        self.response(nil);
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setupTableView {
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        self.index = 1;
        [self loadListData:self.index];
    }];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self loadListData:self.index];
    }];
}

- (void)loadListData:(NSInteger)index {
    NSLog(@"%zd",index);
    [SVProgressHUD showWithStatus:@"正在加载..."];
    NSDictionary *parameter = @{@"page": @(index),@"page_size":@(15),@"ci2_id":@(3)};
    [[KYNetWorking sharedNetWorking] POSTWithURlString:@"complicationList.json.php" parameterDict:parameter success:^(NSDictionary *responseObject) {
        
        [SVProgressHUD dismiss];
        NSArray *arr = responseObject[@"data"];
        NSMutableArray * arrM = [NSMutableArray array];
        for (NSDictionary *item in arr) {
            KYSimultan *simultan =[KYSimultan simultanWithDict:item];
            [arrM addObject:simultan];
        }
        NSLog(@"%zd" ,arrM.count);
        if (index == 1 ) {
            self.simus = arrM;
        }else {
            [self.simus addObjectsFromArray:arrM];
        }
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
        self.index ++;

    } failure:^(NSError *error) {
        NSLog(@"%@" ,error);
        [SVProgressHUD showErrorWithStatus:@"获取失败"];
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];

    }];
}

#pragma mark - UITableViewDataSouce
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.simus.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    KYSimultan *simu = self.simus[indexPath.row];
    
    static NSString *searchCellID = @"baseCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:searchCellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:searchCellID];
    }
    cell.textLabel.text = simu.complication_name;

    if (simu.select) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}
#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    KYSimultan *simu = self.simus[indexPath.row];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell.accessoryType == UITableViewCellAccessoryNone) {
        [self.selectSimu addObject:simu];

        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        simu.select = YES;
    }else {
        [self.selectSimu removeObject:simu];

        cell.accessoryType = UITableViewCellAccessoryNone;
        simu.select = NO;
    }
    
}

#pragma mark -  延迟加载

- (NSMutableArray *)simus {
    if (!_simus) {
        _simus = [NSMutableArray array];
    }
    return _simus;
}
- (NSMutableArray *)selectSimu {
    if (!_selectSimu) {
        _selectSimu = [NSMutableArray array];
    }
    return _selectSimu;
}

@end
