//
//  KYUserLoginVController.m
//  KuaiYi
//
//  Created by mac on 16/1/20.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import "KYUserLoginVController.h"
#import "KYNetWorking.h"
#import "KYUserInfoModel.h"
#import "MJExtension.h"
#import "KYUserInfo.h"
#import "KYRegistNemNumVController.h"
#import "KYForgetPwdVController.h"
#import "KYRegistLoginVController.h"


@interface KYUserLoginVController ()
@property (weak, nonatomic) IBOutlet UITextField *userNameField;
@property (weak, nonatomic) IBOutlet UITextField *passWordField;

@end

@implementation KYUserLoginVController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"用户登录";
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 50)];
    UIImageView *userNameIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"shouji-icon"]];
    userNameIcon.center = CGPointMake(leftView.bounds.size.width / 2, leftView.bounds.size.height / 2);
    [leftView addSubview:userNameIcon];
    self.userNameField.leftViewMode = UITextFieldViewModeAlways;
    self.userNameField.leftView = leftView;

    
    UIView *passWordView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 50)];
    UIImageView *passWordIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"iconfont-suo"]];
    passWordIcon.center = CGPointMake(leftView.bounds.size.width / 2, leftView.bounds.size.height / 2);
    [passWordView addSubview:passWordIcon];
    self.passWordField.leftViewMode = UITextFieldViewModeAlways;
    self.passWordField.leftView = passWordView;

}
//登录按钮
- (IBAction)userLoginButton:(id)sender {
    
    //发送网络请求，获取数据
    
    //网络请求的参数
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

//通过短信验证码登录
- (IBAction)byMsgVerifyNumLogin:(id)sender {
    
    KYRegistLoginVController *registLogin = [[KYRegistLoginVController alloc]init];
    
    [self.navigationController pushViewController:registLogin animated:YES];
    
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
