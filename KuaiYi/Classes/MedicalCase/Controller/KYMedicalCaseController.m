//
//  KYMedicalCaseController.m
//  KuaiYi
//
//  Created by DaysSummer on 16/1/22.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import "KYMedicalCaseController.h"
#import "KYDoctorListController.h"
#import "KYSearchTableController.h"
#import "KYThorough.h"
#import "KYSimultan.h"
#import "KYSimultaneousTableController.h"
#import <SVProgressHUD.h>
#import "KYDiagnosisTableController.h"
#import "KYNetWorking.h"
#import "KYWebViewController.h"

@interface KYMedicalCaseController ()
@property (weak, nonatomic) IBOutlet UIButton *select_ok;
@property (weak, nonatomic) IBOutlet UILabel *numLabel;
@property (weak, nonatomic) IBOutlet UILabel *MedicalType;

@property (weak, nonatomic) IBOutlet UIView *thoroughView;
@property (weak, nonatomic) IBOutlet UILabel *thorough_TextLabel;

@property (weak, nonatomic) IBOutlet UILabel *simultan_TextLabel;
@property (weak, nonatomic) IBOutlet UIButton *definite_yes;
@property (weak, nonatomic) IBOutlet UIButton *definite_not;

@property (weak, nonatomic) IBOutlet UIButton *treat_yes;
@property (weak, nonatomic) IBOutlet UIButton *treat_not;

@property (weak, nonatomic) IBOutlet UIView *wayView;
@property (weak, nonatomic) IBOutlet UILabel *wayView_TextLabel;


// 疾病类型 1-肿瘤 2-心血管 3-神经科 4-血液科 5-骨科 6-公益活动
@property (nonatomic ,assign) NSInteger ci1_id;
// 疾病细分一级id
@property (nonatomic ,strong) KYThorough *ci2;

@property (nonatomic ,assign) NSInteger ci2_id;
// 疾病细分二级id
@property (nonatomic ,assign) NSInteger ci3_id;
// 并发症
@property (nonatomic ,strong) NSArray *complications;
// 是否确诊 1-是 2-否*
@property (nonatomic ,assign)NSInteger is_confirmed;
// 是否接受过治疗 1-是 2-否
@property (nonatomic ,assign) NSInteger has_diagnosis;
// 就诊类型 2-手术治疗   3 – 保留治疗  4 –药物治疗
@property (nonatomic ,assign) NSInteger diagnosis_type;

@end

@implementation KYMedicalCaseController
- (instancetype)initWithCi1_id:(NSInteger)ci1_id
{
    self = [super init];
    if (self) {
        self.ci1_id = ci1_id;
    }
    return self;
}
+ (instancetype)MedicalCaseControllerWithCi1_id:(NSInteger)ci1_id {
    return [[self alloc] initWithCi1_id:ci1_id];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%zd" ,self.ci1_id);
    self.title = @"疾病详情选择";
    UIBarButtonItem *helpItem = [[UIBarButtonItem alloc] initWithTitle:@"预约须知" style:UIBarButtonItemStylePlain target:self action:@selector(help)];
    self.navigationItem.rightBarButtonItems = @[helpItem];

    [self setupMedicalType:self.ci1_id];
}

- (void)setupMedicalType:(NSInteger)ci1_id {
    
    NSString *medicalName;
    // 疾病类型 1-肿瘤 2-心血管 3-神经科 4-血液科 5-骨科 6-公益活动
    switch (self.ci1_id) {
        case 1:
            medicalName = @"肿瘤";
            break;
        case 2:
            medicalName = @"心血管";
            break;
        case 3:
            medicalName = @"神经科";
            break;
        case 4:
            medicalName = @"血液科";
            break;
        case 5:
            medicalName = @"骨科";
            break;
        default:
            medicalName = @"其他";
            break;
    }
    self.MedicalType.text = [NSString stringWithFormat:@"疾病类型:%@疾病", medicalName];
}

- (IBAction)thoroughTouch {
    NSLog(@"thoroughTouch");
    typeof(self) weakSelf = self;
    KYSearchTableController *search = [KYSearchTableController SearchWithResponse:^(KYThorough *response) {
        weakSelf.ci2 = response;
        weakSelf.ci2_id = response.ci2_id;
        weakSelf.ci3_id = response.ci3_id;
        weakSelf.thorough_TextLabel.textColor = [UIColor blackColor];
        weakSelf.thorough_TextLabel.text = response.ci3_name;
        self.select_ok.enabled = YES;

        [self loadData];
    }];
    
    self.simultan_TextLabel.text = @"请选择并发症(可多选)";
    self.simultan_TextLabel.textColor = [UIColor lightGrayColor];
    
    search.cid_1 = self.ci1_id;
    [self.navigationController pushViewController:search animated:YES];
}
- (IBAction)simultaneouslyTouch {
    if (self.ci2 == nil) {
        [SVProgressHUD showInfoWithStatus:@"请先选择疾病细分"];
        return;
    }
    NSLog(@"simultaneouslyTouch");
    KYSimultaneousTableController *simuVC = [[KYSimultaneousTableController alloc] initWithResponse:^(NSArray *arr) {
        NSLog(@"%@",arr);
        if (!arr) {
            return ;
        }
        self.complications = arr;
        NSMutableString *strM = [NSMutableString string];
        for (KYSimultan *item in arr) {
            [strM appendFormat:@"%@," ,item.complication_name];
        }
        [strM deleteCharactersInRange:NSMakeRange(strM.length-1, 1)];
        self.simultan_TextLabel.text = strM;
        self.simultan_TextLabel.textColor = [UIColor blackColor];
    }];

    [self.navigationController pushViewController:simuVC animated:YES];
}
- (IBAction)wayTouch {
    NSLog(@"wayTouch");
    KYDiagnosisTableController *diagnosis = [[KYDiagnosisTableController alloc] initWithResponse:^(NSInteger index) {
        self.diagnosis_type = index;
        NSLog(@"%zd" , index);
        NSString *title;
        // 就诊类型 2-手术治疗   3 – 保留治疗  4 –药物治疗

        switch (index) {
            case 2:
                title = @"手术治疗";
                break;
            case 3:
                title = @"保守治疗";
                break;
            case 4:
                title = @"药物治疗";
                break;
            default:
                title = @"";
                break;
        }
        self.wayView_TextLabel.textColor = [UIColor blackColor];
        self.wayView_TextLabel.text = title;
    }];
    [self.navigationController pushViewController:diagnosis animated:YES];
}
- (IBAction)definiteyes:(UIButton *)sender {
    sender.selected = YES;
    self.definite_not.selected = NO;
    self.is_confirmed = 1;
}
- (IBAction)definitenot:(UIButton *)sender {
    sender.selected = YES;
    self.definite_yes.selected = NO;
    self.is_confirmed = 2;
}

- (IBAction)treatyes:(UIButton *)sender {
    sender.selected = YES;
    self.treat_not.selected = NO;
    self.wayView.hidden = NO;
    self.has_diagnosis = 1;
}
- (IBAction)treatnot:(UIButton *)sender {
    sender.selected = YES;
    self.treat_yes.selected = NO;
    self.wayView.hidden = YES;
    self.has_diagnosis = 2;
}
- (IBAction)didSelectClick:(UIButton *)sender {
    KYDoctorListController *doctorListVC = [[KYDoctorListController alloc] initWithDict:@{@"ci1_id" : @(1),@"ci2_id" : @(3),@"ci3_id" : @(3)}];
    [self.navigationController pushViewController:doctorListVC animated:YES];
}
- (void)loadData {
    NSLog(@"%zd" ,self.ci1_id);
    [[KYNetWorking sharedNetWorking] POSTWithURlString:@"matchedDoctorCount.json.php" parameterDict:@{@"ci1_id":@(1),@"ci2_id":@(3),@"ci3_id":@(3),@"diagnosis_type":@(0),@"is_confirmed":@(1),@"user_id":@(1000089), @"has_diagnosis":@(2)} success:^(NSDictionary *responseObject) {
        NSLog(@"测试%@" ,responseObject);
        self.numLabel.text = [NSString stringWithFormat:@"%@",responseObject[@"data"][@"doctor_count"]];
    } failure:^(NSError *error) {
        NSLog(@"%@" ,error);
    }];
}
- (void)help {
    KYWebViewController *web = [[KYWebViewController alloc] init];
    web.title = @"用户须知";
    web.linkURL = [[NSBundle mainBundle] pathForResource:@"user_protolo" ofType:@"html"];
    [self.navigationController pushViewController:web animated:YES];
}
@end
