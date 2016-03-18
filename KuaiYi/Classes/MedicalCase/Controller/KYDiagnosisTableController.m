//
//  KYDiagnosisTableController.m
//  KuaiYi
//
//  Created by DaysSummer on 16/1/23.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import "KYDiagnosisTableController.h"

@interface KYDiagnosisTableController ()
@property (nonatomic ,strong) responseDiagnosis response;
@end

@implementation KYDiagnosisTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (instancetype)initWithResponse:(responseDiagnosis)response {
    if (self =[super init]) {
        self.response = response;
    }
    return self;
}
+ (instancetype)SearchWithResponse:(responseDiagnosis)response {
    KYDiagnosisTableController *searchVC = [[self alloc] init];
    searchVC.response =response;
    return searchVC;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellBaseID = @"baseID";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:cellBaseID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellBaseID];
    }
    NSString *title;
    switch (indexPath.row) {
        case 0:
            title = @"手术治疗";
            break;
        case 1:
            title = @"保留治疗";
            break;
        case 2:
            title = @"药物治疗";
            break;
        default:
            title = @"其他";
            break;
    }
    cell.textLabel.text = title;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.response) {
        self.response(indexPath.row + 2);
    }
    [self.navigationController popViewControllerAnimated:YES];
}
@end
