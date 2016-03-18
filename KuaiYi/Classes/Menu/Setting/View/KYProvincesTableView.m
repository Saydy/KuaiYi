//
//  KYProvincesTableView.m
//  KuaiYi
//
//  Created by DaysSummer on 16/1/27.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import "KYProvincesTableView.h"
#import <MJExtension.h>
#import "KYProvince.h"

@interface KYProvincesTableView ()<UITableViewDataSource ,UITableViewDelegate>
@property (nonatomic ,strong) NSArray *provinces;
@property (nonatomic ,strong) NSString *lastCell;



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
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"baseCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"baseCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    KYProvince *province = self.provinces[indexPath.row];
    if (province.mark) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    cell.textLabel.text = province.name;
    return cell;
}
#pragma mark - UITableViewDelegate 
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.lastProvince.mark = NO;
    
    KYProvince *province = self.provinces[indexPath.row];
    province.mark = YES;
    self.lastProvince = province;
    
    [tableView reloadData];
//     = cell;
}
#pragma mark - 延迟加载
- (NSArray *)provinces {
    if (!_provinces) {
        
        NSArray *arr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"provinces.plist" ofType:nil]];
        NSMutableArray *arrM = [NSMutableArray array];
        for (NSDictionary *dict in arr) {
            [arrM addObject:[KYProvince provinceWithDict:dict]];
        }
        _provinces = arrM;
        
    }
    return _provinces;
}
@end
