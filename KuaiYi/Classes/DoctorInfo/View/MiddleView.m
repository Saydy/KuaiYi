//
//  MiddleView.m
//  demo
//
//  Created by xll on 16/1/20.
//  Copyright © 2016年 xll12. All rights reserved.
//

#import "MiddleView.h"
#import "Status.h"
#import "UIButton+CycleBtn.h"
#import "Masonry.h"


@interface MiddleView ()
@property (strong,nonatomic) UIButton * conditionBtn;
@property (strong,nonatomic) UIButton * profileBtn;
@property (strong,nonatomic) UIButton * timeBtn;
@property (weak,nonatomic) UIView * sliderView;
@property (weak,nonatomic) UIButton * currentBtn;
@end
@implementation MiddleView
- (instancetype)initWithType:(InfoType)type
{
    self = [super init];
    if (self) {
        [self SetUpUIWithType:type];
    }
    return self;
}
-(void)SetUpUIWithType:(InfoType)type{
    [self addSubview:self.conditionBtn];
    [self addSubview:self.profileBtn];
    [self addSubview:self.timeBtn];
    
//    [self.conditionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.left.bottom.equalTo(self);
//    }];
//    [self.profileBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.bottom.equalTo(self);
//        make.left.equalTo(self.conditionBtn.mas_right);
//        make.width.equalTo(self.timeBtn);
//    }];
//    [self.timeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.bottom.right.equalTo(self);
//        make.left.equalTo(self.profileBtn.mas_right);
//        make.width.equalTo(self.conditionBtn);
//    }];
    
    CGSize size = [UIScreen mainScreen].bounds.size;
    CGFloat w = size.width / 3;
    if (type == KYGuanZhu) {
       w = size.width / 2;
    }
    
    // 创建滑块
    [self CreatSliderViewWithWidth:w];
    [self clickBtn:self.conditionBtn];
    self.conditionBtn.frame = CGRectMake(0, 0,w,45);
    self.profileBtn.frame = CGRectMake(w, 0,w,45);
    self.timeBtn.frame = CGRectMake(2*w, 0 ,w,45);
    //设置线相关
    UIView * line1 = [self creatLine];
    UIView * line2 = [self creatLine];
    UIView * line3 = [self creatLine];
    const double scale = 0.6;
    [self.profileBtn addSubview:line1];
    [self.timeBtn addSubview:line2];
//    [self addSubview:line1];
//    [self addSubview:line2];
    [self addSubview:line3];
    
    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {

//        make.left.equalTo(self).offset([UIScreen mainScreen].bounds.size.width/3);
//        make.centerY.equalTo(self);
//        make.height.equalTo(self.mas_height).multipliedBy(scale);
//        make.width.equalTo(@0.5);
        
        make.left.centerY.equalTo(self.profileBtn);
        make.height.equalTo(self.profileBtn.mas_height).multipliedBy(scale);
        make.width.equalTo(@0.5);
        
    }];
    
    [line2 mas_makeConstraints:^(MASConstraintMaker *make) {

//        make.left.equalTo(self).offset(([UIScreen mainScreen].bounds.size.width/3)*2.0);
//        make.centerY.equalTo(self);
//        make.height.equalTo(self.mas_height).multipliedBy(scale);
//        make.width.equalTo(@0.5);
        make.left.centerY.equalTo(self.timeBtn);
        make.height.equalTo(self.timeBtn.mas_height).multipliedBy(scale);
        make.width.equalTo(@0.5);
       
    }];
    [line3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.equalTo(self);
        make.width.equalTo(self);
        make.height.equalTo(@1);
    }];
   
}
//创建滑条
-(void)CreatSliderViewWithWidth:(CGFloat)width{
    UIView * sliderView = [[UIView alloc]initWithFrame:CGRectMake(0, 36, width * 0.68, 3)];
    sliderView.backgroundColor = [UIColor colorWithRed:(76/255.0) green:(196/255.0) blue:(195/255.0) alpha:0.8];
    sliderView.layer.cornerRadius = sliderView.frame.size.height * .5;
    sliderView.layer.masksToBounds = YES;
    [self addSubview:sliderView];
    
//    CGPoint temp = sliderView.center;
//    temp.x = self.conditionBtn.center.x;
//    sliderView.center = temp;
    self.sliderView = sliderView;
    


}
-(void)layoutSubviews{
    [super layoutSubviews];
    CGPoint temp = self.sliderView.center;
    temp.x = self.conditionBtn.center.x;
    self.sliderView.center = temp;

}
//做线
-(UIView*)creatLine{
    UIView * line = [[UIView alloc]init];
    line.backgroundColor =[UIColor colorWithRed:(205/255.0) green:(205/255.0) blue:(205/255.0) alpha:.9];
    return line;
}
-(void)clickBtn:(UIButton*)sender{
    if (self.SenderBlock) {
        self.SenderBlock(sender.tag);
    }
    [self.currentBtn setTitleColor:[UIColor colorWithRed:(43/255.0) green:(43/255.0) blue:(43/255.0) alpha:0.8] forState:UIControlStateNormal];
    [sender setTitleColor:[UIColor colorWithRed:(76/255.0) green:(196/255.0) blue:(195/255.0) alpha:0.8] forState:UIControlStateNormal];
    self.currentBtn = sender;
    [UIView animateWithDuration:0.25 animations:^{
        CGPoint temp = self.sliderView.center;
        temp.x = sender.center.x;
        self.sliderView.center = temp;
      
    }];
    
    
}
//懒加载
-(UIButton *)conditionBtn{
    if (_conditionBtn == nil) {
        _conditionBtn = [UIButton creatBtnWithImageName:nil andTitle:@"接诊条件" andNumber:nil andFontSize:16.0];
        _conditionBtn.tag = 0;
        [_conditionBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _conditionBtn;
}
-(UIButton*)profileBtn{
    if (_profileBtn == nil ) {
        _profileBtn = [UIButton creatBtnWithImageName:nil andTitle:@"医生简介" andNumber:nil andFontSize:16.0];
        _profileBtn.tag = 1;
         [_profileBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _profileBtn;
}
-(UIButton *)timeBtn{
    if (_timeBtn == nil) {
        _timeBtn = [UIButton creatBtnWithImageName:nil andTitle:@"就诊时间" andNumber:nil andFontSize:16.0];
        _timeBtn.tag = 2;
         [_timeBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _timeBtn;
}
@end
