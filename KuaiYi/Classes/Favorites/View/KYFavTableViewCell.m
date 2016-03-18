//
//  KYFavTableViewCell.m
//  KuaiYi
//
//  Created by mac on 16/1/22.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import "KYFavTableViewCell.h"
#import "KYFavDoctor.h"

#import <UIImageView+WebCache.h>



@interface KYFavTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *docPhone;
@property (weak, nonatomic) IBOutlet UILabel *docNameLable;
@property (weak, nonatomic) IBOutlet UILabel *professionalLable;
@property (weak, nonatomic) IBOutlet UILabel *hospitalLable;
@property (weak, nonatomic) IBOutlet UILabel *appointmentLable;
@property (weak, nonatomic) IBOutlet UILabel *flowersLable;
@property (weak, nonatomic) IBOutlet UILabel *silkbannerLable;

@end

@implementation KYFavTableViewCell

- (void)awakeFromNib {
    self.docPhone.layer.cornerRadius = self.docPhone.bounds.size.height/2;
    self.docPhone.layer.masksToBounds = YES;
   
}
#pragma mark  模型赋值
- (void)setDoctor:(KYFavDoctor *)doctor {
    _doctor=doctor;
    
    NSURL *url = [NSURL URLWithString:doctor.doctor_portrait];
    [self.docPhone sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"photo"]];
    self.docNameLable .text= doctor.doctor_name;
    self.professionalLable.text = doctor.doctor_title_name;
    self.hospitalLable.text = doctor.hospital_name;
    self.appointmentLable.text = [NSString stringWithFormat:@"%ld",(long)doctor.operation_count] ;
    self.flowersLable.text =[NSString stringWithFormat:@"%ld",(long)doctor.flower] ;
    self.silkbannerLable.text = [NSString stringWithFormat:@"%ld",(long)doctor.banner];
  }
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
