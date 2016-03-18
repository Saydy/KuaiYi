//
//  KYMManageHeaderView.m
//  KuaiYi
//
//  Created by DaysSummer on 16/1/24.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import "KYMManageHeaderView.h"
#import "KYUserInfo.h"
#import <UIImageView+WebCache.h>
@implementation KYMManageHeaderView

- (void)awakeFromNib {
    KYUserInfoModel *user = [KYUserInfo sharedUserInfo].userInfo;
    if (user == nil) {
        return;
    }
    NSURL *url = [NSURL URLWithString:user.head_photo ];
    [self.heardIcon sd_setImageWithURL:url placeholderImage:[UIImage imageNamed: @"nav_head"]];
    self.nameLable.text = user.true_name;
    self.idLable.text = user.user_id;
    self.telLable.text = user.mobile_number;
    
    self.heardIcon.layer.cornerRadius = self.heardIcon.bounds.size.height /2;
    self.heardIcon.layer.masksToBounds = YES;
    
  }

@end
