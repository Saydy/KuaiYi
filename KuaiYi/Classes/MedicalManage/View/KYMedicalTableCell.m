//
//  KYMedicalTableCell.m
//  KuaiYi
//
//  Created by DaysSummer on 16/1/24.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import "KYMedicalTableCell.h"

@interface KYMedicalTableCell ()
@property (weak, nonatomic) IBOutlet UIView *cubeView;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *timeLbael;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *photoImage;

@end
@implementation KYMedicalTableCell

- (void)awakeFromNib {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.cubeView.layer.cornerRadius = 5;
    self.cubeView.layer.borderWidth = 0.5;
    self.cubeView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    // Configure the view for the selected state
    self.iconImageView.layer.cornerRadius = 5;
    self.iconImageView.layer.masksToBounds = YES;
    self.iconImageView.layer.borderWidth = 0.5;
    self.iconImageView.layer.borderColor = [UIColor lightGrayColor].CGColor;
}
- (void)setMedical:(KYMedical *)medical {
    _medical = medical;
    
    self.nameLabel.text = medical.name;
    self.textLabel.text = medical.text;
    self.timeLbael.text = medical.time;
    if (medical.image) {
        self.photoImage.image = medical.image;
    }
}
@end
