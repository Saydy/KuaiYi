//
//  KYAddMedicalTableController.m
//  KuaiYi
//
//  Created by DaysSummer on 16/1/24.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import "KYAddMedicalTableController.h"
#import "KYaddTypeTableController.h"
#import "KYSearchTableController.h"
#import <SVProgressHUD.h>
#import "KYSelectMedicalTableController.h"
#import "KYFooterView.h"
#import "KYFooterView.h"
#import "KYMedical.h"

@interface KYAddMedicalTableController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate ,UITableViewDataSource ,UITableViewDelegate>
@property (nonatomic ,assign)NSInteger cid_1;
@property (nonatomic ,strong) response response;
@property (nonatomic ,copy) NSString *typeString;
@property (nonatomic ,copy) NSString *type2String;
@property (nonatomic ,copy) responseMedical responseMedical;
@property (nonatomic ,strong) UIImage *photo;

@property (nonatomic ,strong) KYMedical *saveMedical;

@property (nonatomic ,weak) UITableView *tableView;


@end

@implementation KYAddMedicalTableController
- (instancetype)initWithResponse:(responseMedical)response
{
    self = [super init];
    if (self) {
        self.responseMedical = response;;
    }
    return self;
}
- (instancetype)initWithMedical:(KYMedical *)medical Response:(responseMedical)response {
    self = [super init];
    if (self) {
        self.responseMedical = response;;
        self.typeString = medical.name;
        self.type2String = medical.name2;
        self.saveMedical = medical;
        
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *tabview = [[UITableView alloc] initWithFrame:SCREEN_BOUNDS style:UITableViewStyleGrouped];
    [self.view addSubview:tabview];
    tabview.delegate = self;
    tabview.dataSource = self;
    self.tableView = tabview;
    
    KYFooterView *footerView = [[[NSBundle mainBundle] loadNibNamed:@"KYFooterView" owner:nil options:nil] firstObject];
    [footerView.addTagBtn addTarget:self action:@selector(addTagBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [footerView.addPhoto addTarget:self action:@selector(addPhotoClick) forControlEvents:UIControlEventTouchUpInside];

    self.tableView.tableFooterView = footerView;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.estimatedRowHeight = 44;
    self.title = @"添加病历";
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;

    UIBarButtonItem *commitBarItem = [[UIBarButtonItem alloc] initWithTitle:@"提交" style:UIBarButtonItemStylePlain target:self action:@selector(commitBarItemClick)];
    self.navigationItem.rightBarButtonItems = @[commitBarItem];

    if (self.saveMedical) {
        footerView.labels = self.saveMedical.labels;
        footerView.describeTextView.text = self.saveMedical.text;
        [footerView.photoImage setImage:self.saveMedical.image];
        self.photo = self.saveMedical.image;
        [footerView.addPhoto setTitle:nil forState:UIControlStateNormal];
        self.title = @"修改病历";
        footerView.textTipLabel.hidden = YES;
        
        UIButton *delectBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 44, SCREEN_WIDTH, 44)];
        [delectBtn addTarget:self action:@selector(delBtnClick) forControlEvents:UIControlEventTouchUpInside];
        delectBtn.backgroundColor = [UIColor whiteColor];
        delectBtn.layer.borderWidth = 0.5;
        delectBtn.layer.borderColor = [UIColor grayColor].CGColor;
        [delectBtn setTitle:@"删除病历" forState:UIControlStateNormal];
        [delectBtn setTitleColor:THEMECOLOR forState:UIControlStateNormal];
        delectBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        [self.view addSubview:delectBtn];

    }


}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    if (indexPath.section == 0) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        if (indexPath.row == 0) {
            cell.textLabel.text = @"疾病类型:";
            if (self.typeString) {
                cell.detailTextLabel.text = self.typeString;
            }else {
                cell.detailTextLabel.text = @"请选择";
            }
        }else if (indexPath.row == 1) {
            cell.textLabel.text = @"疾病细分:";
            if (self.type2String) {
                cell.detailTextLabel.text = self.type2String;
            }else {
                cell.detailTextLabel.text = @"请选择";
            }
        }
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {

            KYaddTypeTableController *typeVC = [[KYaddTypeTableController alloc] initWithResponse:^(NSInteger index) {
                UITableViewCell *DisCell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
                DisCell.detailTextLabel.text = @"请选择";
                KYFooterView *footerView = (KYFooterView *)[self.tableView tableFooterView];
                footerView.labels = [NSArray array];
                
                self.cid_1 = index;
                NSString *text;
                switch (index) {
                    case 1:
                        text = @"肿瘤";
                        break;
                    case 2:
                        text = @"心脑血管病";
                        break;
                    case 3:
                        text = @"神经病";
                        break;
                    case 4:
                        text = @"血液病";
                        break;
                    case 5:
                        text = @"骨科病";
                        break;
                    default:
                        break;
                }
                self.typeString = text;
                cell.detailTextLabel.text = text;
            }];
            [self.navigationController pushViewController:typeVC animated:YES];
        }else if (indexPath.row == 1) {
            if (self.cid_1 == 0) {
                [SVProgressHUD showInfoWithStatus:@"请先选择疾病类型"];
                return;
            }
            KYSearchTableController *searckVC = [[KYSearchTableController alloc] initWithResponse:^(KYThorough *thorough) {
                self.type2String = thorough.ci3_name;
                cell.detailTextLabel.text = thorough.ci3_name;
            }];
            searckVC.cid_1 = self.cid_1;
            [self.navigationController pushViewController:searckVC animated:YES];
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0.1;
    }
    return 8;
}


- (void)addTagBtnClick {
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
    if ([cell.detailTextLabel.text isEqualToString:@"请选择"]) {
        [SVProgressHUD showInfoWithStatus:@"请先选择疾病细分"];
        return;
    }
    KYFooterView *footerView = (KYFooterView *)[self.tableView tableFooterView];
    NSLog(@"%zd",footerView.labels.count);
    KYSelectMedicalTableController *selectVC = [[KYSelectMedicalTableController alloc] initWithStringArr:footerView.labels Response:^(NSArray *titles) {
        footerView.labels = titles;

    }];
    [self.navigationController pushViewController:selectVC animated:YES];
}
- (void)commitBarItemClick {
    KYFooterView *footerView = (KYFooterView *)[self.tableView tableFooterView];
    if (!self.typeString || !self.type2String || !footerView.describeTextView.hasText) {
        [SVProgressHUD showInfoWithStatus:@"请填写完整"];
        return;
    }
    NSLog(@"%s" ,__func__);

    KYMedical *medical = [[KYMedical alloc] init];
    medical.name =self.typeString;
    medical.name2 = self.type2String;
    medical.text = footerView.describeTextView.text;
    medical.image = self.photo;
    medical.labels = footerView.labels;
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    dateFormat.dateFormat = @"yy-MM-dd HH:mm:ss";
    
    medical.time = [dateFormat stringFromDate:date];
    self.responseMedical(medical);

    [self.navigationController popViewControllerAnimated:YES];
}
- (void)addPhotoClick {
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"选择照片" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [alertVC addAction:[UIAlertAction actionWithTitle:@"选自相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UIImagePickerController *imagePickerVC = [[UIImagePickerController alloc] init];
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
        imagePickerVC.delegate = self;
        [self.navigationController presentViewController:imagePickerVC animated:YES completion:nil];
    }]];
    
    [alertVC addAction:[UIAlertAction actionWithTitle:@"选自相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UIImagePickerController *imagePickerVC = [[UIImagePickerController alloc] init];
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        imagePickerVC.delegate = self;
        [self.navigationController presentViewController:imagePickerVC animated:YES completion:nil];
    }]];
    [alertVC addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {

    }]];
    [self.navigationController presentViewController:alertVC animated:YES completion:nil];
}

- (void)delBtnClick {
    KYMedical *medicalNil;
    self.responseMedical(medicalNil);
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    NSLog(@"%@" ,info);
    UIImage *img = info[UIImagePickerControllerOriginalImage];
    self.photo = img;
    KYFooterView *footerView = (KYFooterView *)[self.tableView tableFooterView];
    [footerView.photoImage setImage:img];
    [footerView.addPhoto setTitle:nil forState:UIControlStateNormal];
//    [self.navigationController popViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
