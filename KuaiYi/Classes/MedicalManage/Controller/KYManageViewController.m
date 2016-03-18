//
//  KYManageViewController.m
//  KuaiYi
//
//  Created by DaysSummer on 16/1/24.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import "KYManageViewController.h"
#import "KYAddMedicalTableController.h"
#import "KYMedicalTableCell.h"

@interface KYManageViewController () <UITableViewDelegate ,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic ,strong) NSMutableArray *medicals;
@property (strong, nonatomic) UIImageView *spaceImage;
@property (nonatomic ,strong) UILabel *spaceLabel;


@end

@implementation KYManageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.medicals =[NSMutableArray arrayWithArray:[KYManageViewController loadFile]];
    if (!self.medicals) {
        self.medicals = [NSMutableArray array];
    }
    
    
    UIView *headerView = [[[NSBundle mainBundle] loadNibNamed:@"KYMManageHeaderView" owner:nil options:nil] lastObject];
    self.tableView.tableHeaderView = headerView;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.rowHeight = 120;
    [self.tableView registerNib:[UINib nibWithNibName:@"KYMedicalTableCell" bundle:nil] forCellReuseIdentifier:@"baseCell"];
    self.title = @"病历管理";
    
    self.spaceImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Edit"]];
    self.spaceImage.center = self.tableView.center;
    [self.tableView addSubview:self.spaceImage];
    
    self.spaceLabel = [[UILabel alloc] initWithFrame:CGRectOffset(self.spaceImage.frame, 0, 80)];
    self.spaceLabel.bounds = CGRectMake(0, 0, 200, 40);
    self.spaceLabel.textAlignment = NSTextAlignmentCenter;
    self.spaceLabel.text = @"病历资料,随心管理";
    [self.tableView addSubview:self.spaceLabel];
}
- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];

}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.medicals.count) {
        self.spaceImage.hidden = YES;
        self.spaceLabel.hidden = YES;
    }else {
        self.spaceImage.hidden = NO;
        self.spaceLabel.hidden = NO;
    }
    
    NSLog(@"%zd" ,self.medicals.count);
    return self.medicals.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    KYMedicalTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"baseCell"];
    KYMedicalTableCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"KYMedicalTableCell" owner:nil options:nil] firstObject];
    KYMedical *medical = self.medicals[self.medicals.count- 1 -indexPath.row];
    NSLog(@"%p",cell);
    cell.backgroundColor = [UIColor clearColor];
    cell.medical = medical;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    KYMedicalTableCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    KYAddMedicalTableController *editMedicalVC = [[KYAddMedicalTableController alloc] initWithMedical:cell.medical Response:^(KYMedical *medical) {
        [self.medicals removeObject:cell.medical];
        if (medical) {
            [self.medicals addObject:medical];
        }
        [self.tableView reloadData];
        [self save];
    }];
    [self.navigationController pushViewController:editMedicalVC animated:YES];
}
- (IBAction)addBtnTouch:(UIButton *)sender {
    KYAddMedicalTableController *addVC = [[KYAddMedicalTableController alloc] initWithResponse:^(KYMedical *medical) {
        NSLog(@"%p",self.medicals);
        [self.medicals addObject:medical];
        [self.tableView reloadData];
        [self save];

    }];
    [self.navigationController pushViewController:addVC animated:YES];
}
- (void)save {
    NSString *homePath=NSHomeDirectory();
    NSString *filePath=[homePath stringByAppendingPathComponent:@"medicals.data"];//后缀也可以是.arc
    //创建个准备归档的数组
    NSArray *arr1=self.medicals;
    BOOL success=[NSKeyedArchiver archiveRootObject:arr1 toFile:filePath];
    if (success) {
        NSLog(@"success");
    }
}
+ (NSArray *)loadFile {
    NSString *homePath=NSHomeDirectory();
    NSString *filePath=[homePath stringByAppendingPathComponent:@"medicals.data"];//后缀也可以是.arc
    NSArray *medical = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    return medical;
}
@end
