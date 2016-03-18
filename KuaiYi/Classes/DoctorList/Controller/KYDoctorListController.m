//
//  KYDoctorListController.m
//  KuaiYi
//
//  Created by 侯谢送 on 16/1/20.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import "KYDoctorListController.h"
#import "KYDoctorCell.h"
#import "KYDoctors.h"
#import "KYNetWorking.h"
#import "kydoctor.h"
#import "KYMoreView.h"
#import <Masonry/Masonry.h>
#import <MJRefresh/MJRefresh.h>
#import <SVProgressHUD/SVProgressHUD.h>
#import "ViewController.h"
#import "KYNavController.h"

@interface KYDoctorListController ()<UITableViewDataSource>
@property(nonatomic, strong) AFHTTPSessionManager *sessionManager;

@property (strong, nonatomic) NSMutableArray *doctors;

@property (assign, nonatomic) NSInteger index;


@end

@implementation KYDoctorListController

//- (instancetype)initWithCi1_id:(NSInteger)ci1_id ci2_id:(NSInteger)ci2_id ci3_id:(NSInteger)ci3_id
- (instancetype)initWithDict:(NSDictionary *)dict{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
//    self.tableView.dataSource = self;
    self.title = @"选择医生";

    self.tableView.estimatedRowHeight = 100;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    //下拉刷新
    [self setupRefresh];
    

    //加载医生列表
//    [self loadDoctorList];
    
}


- (void)dealloc
{
    NSLog(@"销毁l");

}
#pragma mark - 下拉刷新和上拉加载
- (void)setupRefresh{

//    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
//    [self.tableView addSubview:refreshControl];
//    [refreshControl addTarget:self action:@selector(loadDoctorList:) forControlEvents:UIControlEventValueChanged];
//    [refreshControl beginRefreshing];
    [self loadDoctorList];
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.tableView.mj_header endRefreshing];
    }];
    
    
    
    KYMoreView *loadMore = [[KYMoreView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 35)];
    self.tableView.tableFooterView = loadMore;
    
    loadMore.hidden = YES;
    
}


#pragma mark - 数据源、代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //
    return self.doctors.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    KYDoctorCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DoctorCell"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"KYDoctorCell" owner:nil options:nil] lastObject];
    }
    
    KYDoctor *doctor = self.doctors[indexPath.row];
    cell.doctor = doctor;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    KYDoctor *doctor = self.doctors[indexPath.row];
//    cell.doctor = doctor;
    NSInteger doctor_id = doctor.doctor_id;
    ViewController *doctorInfoVC = [[ViewController alloc] initWithDoctor_id:doctor_id andChoseType:KYDefalt];
    [self.navigationController pushViewController:doctorInfoVC animated:YES];
    
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

//        NSLog(@"%@",NSStringFromCGPoint(scrollView.contentOffset));
//    NSLog(@"123");
//    scrollView.delegate = self;
    if (self.doctors.count == 0) {
        return;
    }
    if (self.tableView.tableFooterView.hidden == NO) {
        return;
    }

    
    
    CGFloat result = self.tableView.contentSize.height - scrollView.bounds.size.height;

    if (result < scrollView.contentOffset.y) {
        self.tableView.tableFooterView.hidden = NO;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [self loadMoreDoctorlist];
        });
    }
}




#pragma mark - 请求数据
- (void)loadDoctorList {

//    NSDictionary *dict = @{@"login_token":@"985c96ce43bb5ef69de3e1ad8afaa83f",@"ci1_id":@(1),@"ci2_id":@(3),@"ci3_id":@(3),@"diagnosis_type":@(0),@"is_confirmed":@(1),@"user_id":@(1000089),@"complications":@[@"",@"",@"",@"",@"",@""],@"has_diagnosis":@(2)}
    NSInteger index = 1;
    NSDictionary *dict = @{@"ci1_id":@(self.ci1_id),@"ci2_id":@(self.ci2_id),@"ci3_id":@(self.ci3_id),@"diagnosis_type":@(0),@"page_size":@(15),@"is_confirmed":@(1),@"user_id":@(1000089), @"page":@(index),@"has_diagnosis":@(2)};
    self.index = index;
    NSLog(@"%ld",self.index);
    [SVProgressHUD showWithStatus:@"正在加载"];
//    __weak typeof(self) weakSelf = self;
    [self.sessionManager POST:@"http://iosapi.itcast.cn/matchDoctors.json.php" parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        [refreshControl endRefreshing];
        [SVProgressHUD dismiss];
        NSString *str =  [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        
        NSRange range = [str rangeOfString:@"{"];
        NSString *newstr = [str substringFromIndex:range.location];
        //
        NSData *data = [newstr dataUsingEncoding:NSUTF8StringEncoding];
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSLog(@"%@",dict[@"data"]);
        NSArray *arr = [NSArray arrayWithArray:dict[@"data"]];
//            NSLog(@"%@",arr);
            NSMutableArray *arrM = [NSMutableArray array];
            for (NSDictionary *dictM in arr) {
                KYDoctor *doctor = [KYDoctor dotorWithDict:dictM];
                [arrM addObject:doctor];
                [self.doctors addObjectsFromArray:arrM];
                [arrM removeAllObjects];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
            
        });
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);

        [SVProgressHUD dismiss];
    }];
    
}

- (void)loadMoreDoctorlist {

    self.index ++;
    NSDictionary *dict = @{@"ci1_id":@(1),@"ci2_id":@(3),@"ci3_id":@(3),@"diagnosis_type":@(0),@"page_size":@(15),@"is_confirmed":@(1),@"user_id":@(1000089), @"page":@(self.index ),@"has_diagnosis":@(2)};
    NSLog(@"%ld",self.index);
//    NSDictionary *dictM = [NSDictionary dictionaryWithDictionary:dict];
    [self.sessionManager POST:@"http://iosapi.itcast.cn/matchDoctors.json.php" parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        self.tableView.tableFooterView.hidden = YES;

        NSString *str =  [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
//                NSLog(@"%@",str);

        NSRange range = [str rangeOfString:@"{"];
        NSString *newstr = [str substringFromIndex:range.location];
        NSData *data = [newstr dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];

        NSLog(@"%@",dict[@"data"]);
//      [dict[@"da]
        if ([dict[@"data"] isKindOfClass:[NSArray class]] ) {
            NSArray *arr = [NSArray arrayWithArray:dict[@"data"]];
            NSMutableArray *arrM = [NSMutableArray array];
            for (NSDictionary *dictM in arr) {
                
                KYDoctor *doctor = [KYDoctor dotorWithDict:dictM];
                [arrM addObject:doctor];
                [self.doctors addObjectsFromArray:arrM];
                [arrM removeAllObjects];
            }
        }else {
        
            self.tableView.tableFooterView.hidden = NO;
            KYMoreView *loadMore = [[KYMoreView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 35)];
            loadMore.label.text = @"没有更多。。。";
            loadMore.myActivity.hidesWhenStopped = YES;
            [loadMore.myActivity stopAnimating];
            self.tableView.tableFooterView = loadMore;
            return ;
       }
        
       
//
//
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
            
        });
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error.description);
    }];
}


#pragma mark - 懒加载

- (NSMutableArray *)doctors {
    
    if (_doctors == nil) {
        
        _doctors = [NSMutableArray array];
        
    }
    return _doctors;
}

- (AFHTTPSessionManager *)sessionManager {
    
    if (_sessionManager == nil) {
        _sessionManager = [AFHTTPSessionManager manager];
        
        _sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
        _sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
        
        NSSet *set = [NSSet setWithObjects:@"text/plain", @"text/html", nil];
        //        NSLog(@"%@",set);
        
        _sessionManager.responseSerializer.acceptableContentTypes = [_sessionManager.responseSerializer.acceptableContentTypes setByAddingObjectsFromSet:set];
        
    }
    return _sessionManager;
    
    
}

@end
