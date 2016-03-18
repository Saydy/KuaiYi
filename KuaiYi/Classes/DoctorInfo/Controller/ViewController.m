//
//  ViewController.m
//  demo
//
//  Created by xll on 16/1/20.
//  Copyright © 2016年 xll12. All rights reserved.
//

#import "ViewController.h"
#import "TopView.h"
#import "NextTopView.h"
//#import "MiddleView.h"
#import "MYScrollView.h"
#import "Masonry.h"
#import "Status.h"
#import "KYNetWorking.h"


@interface ViewController ()<UIScrollViewDelegate>
@property (weak,nonatomic) TopView * topView;
@property (strong,nonatomic) NextTopView * nextTopView;
@property (strong,nonatomic) MiddleView * middleView;
@property (weak,nonatomic) MYScrollView * myscrollView;
@property (assign,nonatomic) InfoType type;

@end

@implementation ViewController
- (instancetype)initWithDoctor_id:(NSInteger)ID andChoseType:(InfoType)type
{
    self = [super init];
    if (self) {
        self.view.backgroundColor = [UIColor colorWithRed:(245/255.0) green:(245/255.0) blue:(245/255.0) alpha:1];
        self.title = @"医生基本信息";
        [self loadView123WithDoctor_id:200000100];
        [self SetUpUIWithType:type];
       
        
    }
    return self;
}

-(void)loadView123WithDoctor_id:(NSInteger)ID{
    //第一部分拉取
    KYNetWorking * netWorkTool = [KYNetWorking sharedNetWorking];
    NSDictionary * parameter = @{@"user_id":@(1000089),@"doctor_id":@(300000315)};
     [netWorkTool POSTWithURlString:@"getDoctorInfo.json.php" parameterDict:parameter success:^(NSDictionary *responseObject) {
         
         Status * data = [[Status alloc]initWithDic:responseObject[@"data"]];
         self.topView.data = data;
         [self.myscrollView.diagnoseTimeView sendHospitalName:data.hospital_name];
     } failure:^(NSError *error) {
         NSLog(@"第一次拉取失败");
     }];
   
   
    //第二部分拉取
    NSDictionary * dict1 = @{@"doctor_id":@(300000315)};
    [netWorkTool POSTWithURlString:@"doctorReceivingSetting.json.php" parameterDict:dict1 success:^(NSDictionary *responseObject) {
        
        NSDictionary * dictOfdata = responseObject[@"data"];
        
        NSArray * arr =  dictOfdata[@"receiving_settings"];
        self.myscrollView.conditionView.conditionArr = arr;
        [self.myscrollView.conditionView SetUpUI];
    } failure:^(NSError *error) {
        NSLog(@"第二部分拉取失败");
    }];

    
    //第三部分拉取
    [netWorkTool POSTWithURlString:@"getIntroduction.json.php" parameterDict:dict1 success:^(NSDictionary *responseObject) {
        NSDictionary * dictOfdata = responseObject[@"data"];
        NSString * introductionText = dictOfdata[@"introduction"];
        self.myscrollView.doctorInfoView.introductionText = introductionText;
        [self.myscrollView.doctorInfoView SetUpUI];
        
    } failure:^(NSError *error) {
        NSLog(@"第三部分拉取失败");
    }];
   
    
    //第四部分拉取
    [netWorkTool POSTWithURlString:@"doctorDuties.json.php" parameterDict:dict1 success:^(NSDictionary *responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
    
   
}

//搭建界面
-(void)SetUpUIWithType:(InfoType)type{
    self.type = type;
    MYScrollView * myscrollView = [[MYScrollView alloc]initWithType:type];
    myscrollView.backgroundColor = [UIColor whiteColor];
    myscrollView.delegate = self;
    self.myscrollView = myscrollView;
    [self.view addSubview:self.topView];
    [self.view addSubview:self.nextTopView];
    [self.view addSubview:self.middleView];
    [self.view addSubview:myscrollView];
        
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(@64);
        make.height.equalTo(@56);
    }];
    [self.nextTopView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.topView.mas_bottom);
        make.height.equalTo(@30);
    }];
    [self.middleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nextTopView.mas_bottom).with.offset(8.0);
        make.left.right.equalTo(self.view);
        make.height.equalTo(@40);
    }];
    
    [myscrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.middleView.mas_bottom);
        make.left.right.equalTo(self.view);
        make.height.equalTo(@381);
    }];
    
    if (type == KYGuanZhu) {
        CGFloat x =0;
        CGFloat y = 190 + 381;
        CGFloat w = [UIScreen mainScreen].bounds.size.width;
        CGFloat h = [UIScreen mainScreen].bounds.size.height - y;
        UIView * bottomView = [[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
        bottomView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:bottomView];
        UIButton * btn = [[UIButton alloc]init];
        [bottomView addSubview:btn];
        [btn setBackgroundImage:[UIImage imageNamed:@"btn"] forState:UIControlStateNormal];
        [btn setTitle:@"咨询医生" forState:UIControlStateNormal];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.view).offset(-10);
            make.height.equalTo(@(h*0.4));
            make.width.equalTo(@(w * 0.68));
            make.left.equalTo(@((w - (w * 0.68))* 0.5));
            
        }];
        NSLog(@"%@",NSStringFromCGRect(btn.frame));
    
    }
    
}



-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    UIButton * btn =  self.myscrollView.diagnoseTimeView.currentBtn;
    [btn setBackgroundColor:[UIColor clearColor]];
       
    

    
}

//懒加载TopView
-(TopView *)topView{
    if (_topView == nil) {
        _topView = [[NSBundle mainBundle]loadNibNamed:@"TopView" owner:nil options:nil].firstObject;
    }
    return _topView;
}
-(NextTopView *)nextTopView{
    if (_nextTopView == nil) {
        _nextTopView = [[NextTopView alloc]init];
        _nextTopView.backgroundColor = [UIColor whiteColor];
    }
    return _nextTopView;
}
-(MiddleView *)middleView{
    if (_middleView == nil) {
//        _middleView = [[MiddleView alloc]init];
        _middleView = [[MiddleView alloc]initWithType:self.type];
        NSLog(@"%u",self.type);
        _middleView.backgroundColor = [UIColor whiteColor];
        __weak typeof(self) weakSelf = self;
        _middleView.SenderBlock = ^(NSInteger  tag){
            [weakSelf.myscrollView setContentOffset:CGPointMake(tag *[UIScreen mainScreen].bounds.size.width , 0) animated:YES];
        
        };
    }
    return _middleView;
}

@end

