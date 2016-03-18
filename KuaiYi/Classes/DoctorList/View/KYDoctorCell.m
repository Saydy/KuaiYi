//
//  KYDoctorCell.m
//  KuaiYi
//
//  Created by 侯谢送 on 16/1/20.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import "KYDoctorCell.h"
#import "KYDoctor.h"
#import "UIImageView+WebCache.h"

@interface KYDoctorCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *doctor_name;
@property (weak, nonatomic) IBOutlet UILabel *doctor_title_name;

@property (weak, nonatomic) IBOutlet UILabel *doctor_hospital_name;
@property (weak, nonatomic) IBOutlet UILabel *operation_count;
@property (weak, nonatomic) IBOutlet UILabel *flower;
@property (weak, nonatomic) IBOutlet UILabel *banner;
@property (weak, nonatomic) IBOutlet UILabel *accuracy;

@end

@implementation KYDoctorCell

- (void)setDoctor:(KYDoctor *)doctor {
    
    _doctor = doctor;
    
    NSURL *url = [NSURL URLWithString:doctor.doctor_portrait];
    [self.iconImage sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"image"]];
    self.iconImage.layer.cornerRadius = 35;
    self.iconImage.clipsToBounds = YES;
    self.doctor_name.text = doctor.doctor_name;
    self.doctor_title_name.text = doctor.doctor_title_name;
    self.doctor_hospital_name.text = doctor.doctor_hospital_name;
        self.operation_count.text = [NSString stringWithFormat:@"%ld",doctor.operation_count];
    self.flower.text = [NSString stringWithFormat:@"%ld",doctor.flower];
    self.banner.text = [NSString stringWithFormat:@"%ld",doctor.banner];
    self.accuracy.text = doctor.accuracy;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}



@end
