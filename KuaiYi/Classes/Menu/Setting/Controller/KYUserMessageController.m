//
//  KYUserMessageController.m
//  KuaiYi
//
//  Created by mac on 16/1/21.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import "KYUserMessageController.h"
#import "KYUserInfo.h"
#import "KYUserInfoModel.h"
#import <UIImageView+WebCache.h>

#import <SVProgressHUD.h>
#import "KYDetailsPiker.h"
#import "KYpicker.h"
#import "KYProvincesTableView.h"

@interface KYUserMessageController ()<UITableViewDataSource,UITableViewDelegate,UIPickerViewDataSource,UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *heardIcon;
@property (weak, nonatomic) IBOutlet UILabel *nameLable;
@property (weak, nonatomic) IBOutlet UILabel *idLable;
@property (weak, nonatomic) IBOutlet UILabel *telLable;
@property (strong,nonatomic)KYDetailsPiker *piker;
@end

@implementation KYUserMessageController

#pragma mark 获取单利中的数据
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    KYUserInfoModel *user = [KYUserInfo sharedUserInfo].userInfo;
    if (user == nil) {
        return;
    }
    NSURL *url = [NSURL URLWithString:user.head_photo ];
    [self.heardIcon sd_setImageWithURL:url placeholderImage:[UIImage imageNamed: @"nav_head"]];
    self.nameLable.text = user.true_name;
    self.idLable.text = user.user_id;
    self.telLable.text = user.mobile_number;
                            
   }
- (void)viewDidLoad {
    [super viewDidLoad];
    self.heardIcon.layer.cornerRadius = self.heardIcon.bounds.size.height /2 ;
    self.heardIcon.layer.masksToBounds = YES;
     self.title =@"个人信息修改";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//分组样式 第一行  行高设置 没有行高
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
        
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    if (indexPath.section == 0  ) {
        
        
        if (indexPath.row ==0){
            
            cell.textLabel.text = @"身高";
            cell.detailTextLabel.text = @"0cm";
            
            
        }else if (indexPath.row == 1){
            cell.textLabel.text = @"体重";
             cell.detailTextLabel.text = @"0Kg";
        }else if (indexPath.row == 2){
            cell.textLabel.text = @"省份";
              cell.detailTextLabel.text = @"";
        }
       
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (indexPath.row == 0) {
        [self picker:cell title:@"身高(cm)" unit:@"(cm)"];
       
    }else if(indexPath.row ==1){
        [self picker:cell title:@"体重(kg)" unit:@"(kg)"];
    }else if(indexPath.row == 2){
        KYProvincesTableView *provinces = [KYProvincesTableView provinces];
        KYpicker *picker = [[KYpicker alloc] initWithSize:CGSizeMake(300, 500) view:self.view Title:@"省份" piker:provinces finished:^{
            cell.detailTextLabel.text = provinces.lastProvince.name;
            
        }];
        [picker show];
    }
}
- (void)picker:(UITableViewCell *)cell title:(NSString *)title unit:(NSString *)unit{
//    UIView *black = [[UIView alloc]initWithFrame:SCREEN_BOUNDS];
//    black.backgroundColor = [UIColor blackColor];
//    black.alpha = 0.4;
//    KYDetailsPiker *piker = [[NSBundle mainBundle]loadNibNamed:@"KYDetailsPiker" owner:nil options:nil ].firstObject;
//   
//    piker.center = self.view.center;
    UIPickerView *pickView = [[UIPickerView alloc]init];
     pickView.tintColor = THEMECOLOR;
    pickView.delegate = self;
    pickView.dataSource = self;
    
    KYpicker *picker = [[KYpicker alloc] initWithSize:CGSizeMake(300, 300) view:self.view Title:title piker:pickView finished:^{
        
        NSInteger s1;
        NSInteger s2;
        NSInteger s3;
            s1 = [pickView selectedRowInComponent:0];
            s2 = [pickView selectedRowInComponent:1];
             s3 = [pickView selectedRowInComponent:2];
        
        NSMutableString *str = [NSMutableString string];
        
        if (s1) {
            [str appendFormat:@"%zd",s1];
        }
        if (s1 || s2) {
            [str appendFormat:@"%zd",s2];
        }
        [str appendFormat:@"%zd",s3];

        
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@%@",str,unit];

    }];
//    picker.frame = SCREEN_BOUNDS;
    
    [picker show];
    
}
- (void)CommicClick{


}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}

- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 10;
}
- (NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    return   [ NSString stringWithFormat:@"%zd",row ];
    
    

}



@end
