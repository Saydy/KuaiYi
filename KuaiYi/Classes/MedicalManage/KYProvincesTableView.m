//
//  KYProvincesTableView.m
//  KuaiYi
//
//  Created by DaysSummer on 16/1/27.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import "KYProvincesTableView.h"

@interface KYProvincesTableView ()<UITableViewDataSource ,UITableViewDelegate>
@property (nonatomic ,strong) NSArray *provinces;
@property (nonatomic ,strong) UITableViewCell *lastCell;


@end
@implementation KYProvincesTableView
+ (instancetype)provinces {
    KYProvincesTableView *provinces = [[KYProvincesTableView alloc] init];
    provinces.delegate = provinces;
    provinces.dataSource = provinces;
    return provinces;
}


#pragma mark - UITableViewDataSouce
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.provinces.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dict = self.provinces[indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"baseCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"baseCell"];
    }
    cell.textLabel.text = dict[@"name"];
    return cell;
}
#pragma mark - UITableViewDelegate 
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.lastCell.accessoryType = UITableViewCellAccessoryNone;
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    self.lastCell = cell;
}
#pragma mark - 延迟加载
- (NSArray *)provinces {
    if (!_provinces) {
        _provinces = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"provinces.plist" ofType:nil]];
    }
    return _provinces;
}
@end
