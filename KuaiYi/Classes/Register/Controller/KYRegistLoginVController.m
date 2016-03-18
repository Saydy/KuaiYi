//
//  KYRegistLoginVController.m
//  KuaiYi
//
//  Created by mac on 16/1/22.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import "KYRegistLoginVController.h"
#import "KYRegistNemNumVController.h"
#import "KYForgetPwdVController.h"
#import <SVProgressHUD.h>
#import <SMS_SDK/SMSSDK.h>

#import "KYNetWorking.h"
#import "KYUserInfo.h"
#import <MJExtension.h>
#import "KYUserInfoModel.h"

@interface KYRegistLoginVController ()
@property (weak, nonatomic) IBOutlet UIButton *acceptverifyNumBtn;
@property (weak, nonatomic) IBOutlet UITextField *putNum;
@property (weak, nonatomic) IBOutlet UITextField *inputCAPTCHA;

@end

@implementation KYRegistLoginVController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //标题
    self.title = @"用户登录";
    
    [self.acceptverifyNumBtn.layer setMasksToBounds:YES];
    [self.acceptverifyNumBtn.layer setCornerRadius:4.0]; //设置矩圆角半径
    [self.acceptverifyNumBtn.layer setBorderWidth:2.0];   //边框宽度
    [self.acceptverifyNumBtn.layer setBorderColor:THEMECOLOR.CGColor];//边框颜色
    
    [self.acceptverifyNumBtn.titleLabel setTextColor:THEMECOLOR];
    
}
//点击获取验证码
- (IBAction)CAPTCHAClick:(id)sender {

    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:self.putNum.text zone:@"86" customIdentifier:nil result:^(NSError *error) {
        if (!error) {
                     NSLog(@"获取验证码成功");
            [SVProgressHUD showSuccessWithStatus:@"发送成功!"];
                 } else {
                     NSLog(@"错误信息：%@",error);
                     [SVProgressHUD showErrorWithStatus:@"发送失败"];
                 };
    }];
}
//登陆按钮
- (IBAction)loginBtn:(id)sender {
    [SMSSDK commitVerificationCode:self.inputCAPTCHA.text phoneNumber:self.putNum.text zone:@"86" result:^(NSError *error) {
        
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
        else
        {
            NSLog(@"错误信息：%@",error);
            [SVProgressHUD showErrorWithStatus:@"验证失败"];
            
        }
    }];
    
    
    
}
//通过账号密码登录
- (IBAction)registPwdLoginButton:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}
//注册账号
- (IBAction)registAccountButton:(id)sender {
    
    KYRegistNemNumVController *registNemNumVC = [[KYRegistNemNumVController alloc]init];
    
    [self.navigationController pushViewController:registNemNumVC animated:YES];
}


//忘记密码
- (IBAction)forgetPwdButton:(id)sender {
    
    KYForgetPwdVController *forgetPwdVC = [[KYForgetPwdVController alloc]init];
    [self.navigationController pushViewController:forgetPwdVC animated:YES];
    
}

@end
