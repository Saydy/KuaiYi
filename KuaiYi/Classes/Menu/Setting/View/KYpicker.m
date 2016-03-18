//
//  KYpicker.m
//  KuaiYi
//
//  Created by mac on 16/1/26.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import "KYpicker.h"
#import "KYDetailsPiker.h"
@interface KYpicker ()
@property(nonatomic,copy)finished finished;



@end
@implementation KYpicker
- (instancetype)initWithSize:(CGSize)size view:(UIView *)addView Title:(NSString *)title piker:(UIView *)piker finished:(finished)finished{
    if (self = [super initWithFrame:SCREEN_BOUNDS]) {
        self.finished = finished;
        
        UIView *black = [[UIView alloc]initWithFrame:SCREEN_BOUNDS];
        black.backgroundColor = [UIColor blackColor];
        black.alpha = 0.4;
        
        KYDetailsPiker *detailspiker = [[NSBundle mainBundle]loadNibNamed:@"KYDetailsPiker" owner:nil options:nil ].firstObject;
        detailspiker.title.text = title;
        detailspiker.frame = CGRectMake(0, 0,size.width, size.height);
        
        detailspiker.center = black.center;
        [detailspiker.cancle addTarget:self action:@selector(cancleClick) forControlEvents:UIControlEventTouchUpInside];
        [detailspiker.commit addTarget:self action:@selector(commitClick) forControlEvents:UIControlEventTouchUpInside];
        
        piker.frame =CGRectMake(0, 0, 280, size.height - 100);
        [detailspiker.pickView addSubview:piker];
        
        self.alpha = 0;
        
        [self addSubview:black];
        [self addSubview:detailspiker];
        [addView addSubview:self];
    }
    return self;
}

- (void)show {
    [UIView animateWithDuration:0.25 animations:^{
        self.alpha = 1;
    }];
}

- (void)cancleClick {
    [UIView animateWithDuration:0.25 animations:^{
        self.alpha = 0 ;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}
- (void)commitClick {
    self.finished();
    [self cancleClick];
}
@end
