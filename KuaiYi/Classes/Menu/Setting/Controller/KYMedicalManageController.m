//
//  KYMedicalManageController.m
//  KuaiYi
//
//  Created by mac on 16/1/22.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import "KYMedicalManageController.h"
#import "KYUserInfo.h"
#import "KYUserInfoModel.h"
#import <UIImageView+WebCache.h>
@interface KYMedicalManageController ()
@property (weak, nonatomic) IBOutlet UIImageView *heardIcon;
@property (weak, nonatomic) IBOutlet UILabel *nameLable;
@property (weak, nonatomic) IBOutlet UILabel *idLable;
@property (weak, nonatomic) IBOutlet UILabel *telLable;


@end

@implementation KYMedicalManageController
#pragma mark 赋值
- (void)viewDidLoad {
    [super viewDidLoad];
    KYUserInfoModel *user = [KYUserInfo sharedUserInfo].userInfo;
    if (user == nil) {
        return;
    }
    NSURL *url = [NSURL URLWithString:user.head_photo];
    [self.heardIcon sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"nav_head"]];
    self.nameLable.text = user.true_name;
    self.idLable.text = user.user_id;
    self.telLable.text = user.mobile_number;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
