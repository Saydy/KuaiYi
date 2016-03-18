//
//  DiagnoseTimeView.m
//  demo
//
//  Created by xll on 16/1/22.
//  Copyright © 2016年 xll12. All rights reserved.
//

#import "DiagnoseTimeView.h"
#import "DrawView.h"
#import "Masonry.h"
#import "KYButtonTypeone.h"
#import "KYButtonTypeTwo.h"
#import "UIButton+CycleBtn.h"
#import "ChoseView.h"

@interface DiagnoseTimeView ()
@property (weak,nonatomic) NSString * place;

@end
@implementation DiagnoseTimeView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self SetUpUI];
    }
    return self;
}
-(void)SetUpUI{
//    UIButton * btn = [UIButton creatBtnWithImageName:@"img_star" andTitle:self.place andNumber:@"" andFontSize:20];
//    btn.frame = CGRectMake(0, 0,  self.bounds.size.width, 45);
//    [self addSubview:btn];
    DrawView * draw = [[DrawView alloc]initWithFrame:CGRectMake(0, 45, self.bounds.size.width,45)];
    draw.backgroundColor = [UIColor whiteColor];
    [self addSubview:draw];
    
    UIView * line = [[UIView alloc]init];
    [self addSubview:line];
    line.backgroundColor = [UIColor colorWithRed:(205/255.0) green:(205/255.0) blue:(205/255.0) alpha:0.6];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(@45);
        make.height.equalTo(@1);
        
    }];
    
    CGFloat x = 0.0;
    CGFloat y = draw.frame.origin.y + draw.frame.size.height;
    CGFloat w = 40;
    CGFloat h = 63.0;
    NSArray * arr = @[@"",@"上午",@"下午",@"晚上"];
    for (int i = 0;i < arr.count; i++) {
        [self CreatButtonTypeOneWithFrame:CGRectMake(x, y + i * h, w,h) andTitle:arr[i]];
    }
    
    CGFloat w2 = ([UIScreen mainScreen].bounds.size.width - w)/7.0;
    for (int i = 0 ; i < 7; i++) {
        [self CreatButtonTypeTwoWithFrame:CGRectMake(w + i * w2 , y, w2, h)];
        
    }
    
    
    int a = arc4random_uniform(21);
    int b = arc4random_uniform(21);
    int c = arc4random_uniform(21);
    for (int i = 0; i < 21 ;i++) {
        int row = i / 7;
        int col = i % 7;
        
//        [self CreatButtonTypeThreeWithFrame:CGRectMake(w + col*w2,y + h + row*h, w2, h)];
        KYButtonTypeThree * btn3 = [[KYButtonTypeThree alloc]initWithFrame:CGRectMake(w + col*w2,y + h + row*h, w2, h)];
        [self addSubview:btn3];
        if (i == a || i == b || i ==c ) {
            ChoseView * view =[[ChoseView alloc]initWithFrame:CGRectMake(0, 0, ([UIScreen mainScreen].bounds.size.width - 40)/7.0, 63)];
            view.backgroundColor = [UIColor colorWithRed:(207/255.0) green:(207/255.0) blue:(207/255.0) alpha:0.3];
            [btn3 addSubview:view];
            
        }
        
        [btn3 addTarget:self action:@selector(ClickChooseBtn:) forControlEvents:UIControlEventTouchUpInside];
    }


}

-(void)CreatButtonTypeOneWithFrame:(CGRect)rect andTitle:(NSString *)title{
    KYButtonTypeone * btn = [[KYButtonTypeone alloc]initWithFrame:rect];
    //    btn.backgroundColor = [UIColor yellowColor];
    if (![title  isEqual: @""]) {
        CGFloat top = (btn.frame.size.height - 34) * 0.5;
        CGFloat left = (btn.frame.size.width - 20) * 0.5;
        btn.contentEdgeInsets = UIEdgeInsetsMake(top, left, top, left);
        [btn setTitle:title forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.titleLabel.numberOfLines = 0;
        [btn setTitleColor:[UIColor colorWithRed:(43/255.0) green:(43/255.0) blue:(43/255.0) alpha:0.8] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:17.0];
    }
    [self addSubview:btn];
    
    
}

-(void)CreatButtonTypeTwoWithFrame:(CGRect)rect{
    KYButtonTypeTwo * btn2 = [[KYButtonTypeTwo alloc]initWithFrame:rect];
    //    btn2.backgroundColor = [UIColor yellowColor];
    [self addSubview:btn2];
    
}

-(void)CreatButtonTypeThreeWithFrame:(CGRect)rect{
//    KYButtonTypeThree * btn3 = [[KYButtonTypeThree alloc]initWithFrame:rect];
//    //    btn3.backgroundColor = [UIColor yellowColor];
//    [self addSubview:btn3];
//    ChoseView * view =[[ChoseView alloc]initWithFrame:CGRectMake(0, 0, ([UIScreen mainScreen].bounds.size.width - 40)/7.0, 63)];
//    view.backgroundColor = [UIColor colorWithRed:(207/255.0) green:(207/255.0) blue:(207/255.0) alpha:0.3];
//    [btn3 addSubview:view];
//    
//    [btn3 addTarget:self action:@selector(ClickChooseBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    
}

-(void)ClickChooseBtn:(KYButtonTypeThree *)sender{
    self.currentBtn.backgroundColor = [UIColor clearColor];
    sender.backgroundColor = [UIColor colorWithRed:(221/255.0) green:(253/255.0) blue:(229/255.0) alpha:0.8];
    self.currentBtn = sender;
    
    
    
}
-(void)sendHospitalName:(NSString*)name{
    UIButton * btn = [UIButton creatBtnWithImageName:@"img_star" andTitle:name andNumber:nil andFontSize:20];
    btn.frame = CGRectMake(0, 0,  self.bounds.size.width, 45);
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 3, 0, 0);
    btn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 5, 0);
    [self addSubview:btn];
}
@end
