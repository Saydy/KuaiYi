//
//  KYRevisePasswordViewController.m
//  KuaiYi
//
//  Created by mac on 16/1/23.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import "KYRevisePasswordViewController.h"
#import <SVProgressHUD.h>

@interface KYRevisePasswordViewController ()
@property (weak, nonatomic) IBOutlet UITextField *oldPasswordField;
@property (weak, nonatomic) IBOutlet UITextField *nevwPasswordField;

@property (weak, nonatomic) IBOutlet UITextField *againPassword;
@end

@implementation KYRevisePasswordViewController
- (IBAction)clickBtn:(id)sender {
    //NSLog(@"确定修改密码");
    if (self.nevwPasswordField.text == self.againPassword.text && (![self.nevwPasswordField.text  isEqual: @""] && ![self.againPassword.text  isEqual: @""]&& ![self.oldPasswordField.text  isEqual: @""]) ){
        
        [SVProgressHUD showSuccessWithStatus:@"修改密码成功"];
        [self.navigationController popToRootViewControllerAnimated:YES];
        
    }else if (self.nevwPasswordField.text != self.againPassword.text ){
        [SVProgressHUD showErrorWithStatus:@"你输入的密码不正确,请再次输入"];
    
    }
        
    
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加文本框中的图片
    //创建一个view - 添加一个imageView -- 将view添加到textfield中（leftView属性，rightView属性）

    [self textField:self.oldPasswordField];
    [self textField:self.nevwPasswordField];
    [self textField:self.againPassword];
}
- (void)textField:(UITextField *)textField {

    
    UIView *addView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    UIImageView *addImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"iconfont-suo"]];
    addImage.center = CGPointMake(addView.bounds.size.width/2, addView.bounds.size.height/2);
    [addView addSubview:addImage];
    textField.leftViewMode = UITextFieldViewModeAlways;
    textField.leftView = addView;

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
