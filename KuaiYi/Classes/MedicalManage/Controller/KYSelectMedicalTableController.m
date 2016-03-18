//
//  KYSelectMedicalTableController.m
//  KuaiYi
//
//  Created by DaysSummer on 16/1/25.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import "KYSelectMedicalTableController.h"
#import <SVProgressHUD.h>

@interface KYSelectMedicalTableController ()
@property (nonatomic ,strong) NSArray *medicals;
@property (nonatomic ,strong) responseTitleArr response;



@end

@implementation KYSelectMedicalTableController

- (instancetype)initWithStringArr:(NSArray *)stringArr Response:(responseTitleArr)response{
    if (self = [super init]) {
        self.selectMedicals = [NSMutableArray arrayWithArray:stringArr];
        self.response = response;

    }
    return self;
}
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"选择症状";
    [SVProgressHUD showWithStatus:@"正在加载"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SVProgressHUD dismiss];
    });
    
    UIBarButtonItem *item_ok = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(item_okClick)];
    self.navigationItem.rightBarButtonItem = item_ok;
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.medicals.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellID = @"medicalbaseCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.accessoryType = UITableViewCellAccessoryNone;
    for (NSString *item in self.selectMedicals) {
        if ([cell.textLabel.text isEqualToString:item]) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
    }
    cell.textLabel.text = self.medicals[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell.accessoryType == UITableViewCellAccessoryNone) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        [self.selectMedicals addObject:cell.textLabel.text];
    }else {
        cell.accessoryType = UITableViewCellAccessoryNone;
        [self.selectMedicals removeObject:cell.textLabel.text];
    }
    NSLog(@"%zd" ,self.selectMedicals.count);
}

- (void)item_okClick {
    self.response(self.selectMedicals);
    [self.navigationController popViewControllerAnimated:YES];
}
- (NSMutableArray *)medicals {
    if (!_medicals) {
        _medicals = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Medical" ofType:@"plist"]];
    }
    return _medicals.copy;
}
- (NSMutableArray *)selectMedicals {
    if (!_selectMedicals) {
        _selectMedicals = [NSMutableArray array];
    }
    return _selectMedicals;
}
@end
