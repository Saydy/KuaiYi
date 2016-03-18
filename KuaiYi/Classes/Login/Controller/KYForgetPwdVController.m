//
//  KYForgetPwdVController.m
//  KuaiYi
//
//  Created by mac on 16/1/22.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import "KYForgetPwdVController.h"
#import <SVProgressHUD.h>
#import <SMS_SDK/SMSSDK.h>

#import "KYNetWorking.h"
#import "KYUserInfoModel.h"
#import "KYUserInfo.h"
#import <MJExtension.h>
@interface KYForgetPwdVController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneNumTField;
@property (weak, nonatomic) IBOutlet UITextField *verifyNumTField;
@property (weak, nonatomic) IBOutlet UIButton *acceptVerityNumBtn;

@end

@implementation KYForgetPwdVController

- (void)viewDidLoad {
    [super viewDidLoad];
    //标题
    self.title = @"找回密码";
    //添加文本框中的图片
    //创建一个view - 添加一个imageView -- 将view添加到textfield中（leftView属性，rightView属性）
    UIView *phoneView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 30, 50)];
    
    UIImageView *phoneImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"shouji-icon"]];
    phoneImageView.center = CGPointMake(phoneView.bounds.size.width / 2, phoneView.bounds.size.height / 2);
    
    [phoneView addSubview:phoneImageView];
    
    self.phoneNumTField.leftViewMode = UITextFieldViewModeAlways;
    self.phoneNumTField.leftView = phoneView;
    
    
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)CAPTCHAClick:(id)sender {
    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:self.phoneNumTField.text zone:@"86" customIdentifier:nil result:^(NSError *error) {
        if (!error) {
            NSLog(@"获取验证码成功");
            [SVProgressHUD showSuccessWithStatus:@"发送成功!"];
        } else {
            NSLog(@"错误信息：%@",error);
            [SVProgressHUD showErrorWithStatus:@"发送失败"];
        };
    }];
 
    
}
- (IBAction)nexClick:(id)sender {
    [SMSSDK commitVerificationCode:self.verifyNumTField.text phoneNumber:self.phoneNumTField.text zone:@"86" result:^(NSError *error) {
        
        if (!error) {
            
            NSLog(@"验证成功");
            [SVProgressHUD showSuccessWithStatus:@"验证成功!"];
            NSDictionary *dict  = @{@"login_token":@"985c96ce43bb5ef69de3e1ad8afaa83f"};
            
            [[KYNetWorking sharedNetWorking] POSTWithURlString:@"http://iosapi.itcast.cn/carelinkQuickLogin.json.php" parameterDict:dict success:^(NSDictionary *responseObject) {
                
                if (responseObject == nil) {
                    NSLog(@"接受了错误的数据！");
                    return ;
                }
                
                //获取到数据之后进行字典转模型
                //字典
                NSDictionary *dict  = responseObject[@"data"];
                
                //模型
                KYUserInfoModel *userInfo = [KYUserInfoModel mj_objectWithKeyValues:dict];
                [KYUserInfo sharedUserInfo].userInfo = userInfo;
                [self.navigationController popToRootViewControllerAnimated:YES];
            } failure:^(NSError *error) {
                NSLog(@"error = %@",error);
            }];

        }
    }];
     }
@end
