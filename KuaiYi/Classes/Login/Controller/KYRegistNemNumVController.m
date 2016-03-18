//
//  KYRegistNemNumVController.m
//  KuaiYi
//
//  Created by mac on 16/1/22.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import "KYRegistNemNumVController.h"
#import "KYUserLoginVController.h"
@interface KYRegistNemNumVController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneNumTField;
@property (weak, nonatomic) IBOutlet UITextField *verifyNumTField;
@property (weak, nonatomic) IBOutlet UIButton *acceptVerityNumBtn;

@end

@implementation KYRegistNemNumVController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"用户注册";
    //添加文本框中的图片
    //创建一个view - 添加一个imageView -- 将view添加到textfield中（leftView属性，rightView属性）
    
    //手机号文本框
    UIView *phoneView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 30, 50)];
    
    UIImageView *phoneImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"shouji-icon"]];
    phoneImageView.center = CGPointMake(phoneView.bounds.size.width / 2, phoneView.bounds.size.height / 2);
    
    [phoneView addSubview:phoneImageView];
    
    self.phoneNumTField.leftViewMode = UITextFieldViewModeAlways;
    self.phoneNumTField.leftView = phoneView;
    
    //验证码文本框
    UIView *verifyView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 30, 50)];
    
    UIImageView *verifyImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"iconfont-suo"]];
    verifyImageView.center = CGPointMake(verifyView.bounds.size.width / 2, verifyView.bounds.size.height / 2);
    
    [verifyView addSubview:verifyImageView];
    
    self.verifyNumTField.leftViewMode = UITextFieldViewModeAlways;
    self.verifyNumTField.leftView = verifyView;
    
    
    [self.acceptVerityNumBtn.layer setMasksToBounds:YES];
    [self.acceptVerityNumBtn.layer setCornerRadius:8.0]; //设置矩圆角半径
    [self.acceptVerityNumBtn.layer setBorderWidth:2.0];   //边框宽度
    [self.acceptVerityNumBtn.layer setBorderColor:THEMECOLOR.CGColor];//边框颜色
    
    [self.acceptVerityNumBtn.titleLabel setTextColor:THEMECOLOR];
    
}

- (IBAction)haveAccountCanLoginBtn:(id)sender {
    KYUserLoginVController *userLoginVC = [[KYUserLoginVController alloc]init];
    
    [self.navigationController pushViewController:userLoginVC animated:YES];
    
}

@end
