//
//  NextTopView.m
//  demo
//
//  Created by xll on 16/1/20.
//  Copyright © 2016年 xll12. All rights reserved.
//

#import "NextTopView.h"
#import "Status.h"
#import "Masonry.h"
#import "UIButton+CycleBtn.h"
@interface NextTopView ()
@property (strong,nonatomic) UIButton * orderBtn;
@property (strong,nonatomic) UIButton * flowerBtn;
@property (strong,nonatomic) UIButton * flagBtn;
@end
@implementation NextTopView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self SetUpUI];
    }
    return self;
}
//设置页面
-(void)SetUpUI{
    [self addSubview:self.orderBtn];
    [self addSubview:self.flowerBtn];
    [self addSubview:self.flagBtn];
    [self.orderBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.equalTo(self);
    }];
    [self.flowerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.left.equalTo(self.orderBtn.mas_right);
        make.width.equalTo(self.flagBtn);
    }];
    [self.flagBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.right.equalTo(self);
        make.left.equalTo(self.flowerBtn.mas_right);
        make.width.equalTo(self.orderBtn);
    }];

//    //设置线相关
    UIView * line1 = [self creatLine];
    UIView * line2 = [self creatLine];
    const double scale = 0.6;
    [self addSubview:line1];
    [self addSubview:line2];
    
    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset([UIScreen mainScreen].bounds.size.width/3);
        make.centerY.equalTo(self);
        make.height.equalTo(self.mas_height).multipliedBy(scale);
        make.width.equalTo(@0.5);
    }];
    [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(([UIScreen mainScreen].bounds.size.width/3)*2.0);
        make.centerY.equalTo(self);
        make.height.equalTo(self.mas_height).multipliedBy(scale);
        make.width.equalTo(@0.5);
    }];
}

//做线
-(UIView*)creatLine{
    UIView * line = [[UIView alloc]init];
    line.backgroundColor = [UIColor colorWithRed:(205/255.0) green:(205/255.0) blue:(205/255.0) alpha:.9];
    return line;
}
//加载数据
-(void)setData:(Status *)data{
    _data = data;
}
//懒加载
-(UIButton *)orderBtn{
    if (_orderBtn == nil) {
        _orderBtn = [UIButton creatBtnWithImageName:@"yiyuan" andTitle:@"预约量" andNumber:@"0" andFontSize:13.0];
    }
    return _orderBtn;
}
-(UIButton *)flowerBtn{
    if (_flowerBtn == nil) {
        _flowerBtn = [UIButton creatBtnWithImageName:@"hua" andTitle:@"鲜花量" andNumber:@"0" andFontSize:13.0];
    }
    return _flowerBtn;
}
-(UIButton *)flagBtn{
    if (_flagBtn == nil) {
        _flagBtn = [UIButton creatBtnWithImageName:@"shoucang" andTitle:@"锦旗量" andNumber:@"0" andFontSize:13.0];
    }
    return _flagBtn;
}
@end
