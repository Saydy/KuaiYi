//
//  KYaddTypeTableController.m
//  KuaiYi
//
//  Created by DaysSummer on 16/1/25.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import "KYaddTypeTableController.h"

@interface KYaddTypeTableController ()
@property (nonatomic ,strong) response response;
@end

@implementation KYaddTypeTableController
- (instancetype)initWithResponse:(response)response {
    if (self =[super init]) {
        self.response = response;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"typeBaseCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *text;
    switch (indexPath.row) {
        case 0:
            text = @"肿瘤";
            break;
        case 1:
            text = @"心脑血管病";
            break;
        case 2:
            text = @"神经病";
            break;
        case 3:
            text = @"血液病";
            break;
        case 4:
            text = @"骨科病";
            break;
        default:
            break;
    }
    cell.textLabel.text = text;
}
// 疾病类型 1-肿瘤 2-心血管 3-神经科 4-血液科 5-骨科 6-公益活动

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.response(indexPath.row + 1);
    [self.navigationController popViewControllerAnimated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.1;
}
@end
