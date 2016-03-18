//
//  TopView.m
//  demo
//
//  Created by xll on 16/1/20.
//  Copyright © 2016年 xll12. All rights reserved.
//

#import "TopView.h"
#import "Status.h"
#import "UIImageView+WebCache.h"

@interface TopView ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *positionLabel;
@property (weak, nonatomic) IBOutlet UILabel *placeLabel;

@end
@implementation TopView

-(void)setData:(Status *)data{
    _data = data;
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:data.doctor_portrait] placeholderImage:[UIImage imageNamed:@"image"]];
    self.nameLabel.text = data.doctor_name;
    self.positionLabel.text = data.doctor_title_name;
    self.placeLabel.text = [NSString stringWithFormat:@"%@-%@",data.hospital_name,data.department_name];


}
-(void)layoutSubviews{
    [super layoutSubviews];
    self.iconView.layer.cornerRadius = self.iconView.bounds.size.width * 0.5;
    self.iconView.layer.masksToBounds = YES;
}

@end
