//
//  KYMoreView.m
//  KuaiYi
//
//  Created by 侯谢送 on 16/1/21.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import "KYMoreView.h"
#import <Masonry/Masonry.h>

@interface KYMoreView ()




@end

@implementation KYMoreView

- (void)layoutSubviews {

//    self.backgroundColor = [UIColor orangeColor];
}

//+ (instancetype)loadMoreView {
//
//    return [[[NSBundle mainBundle] loadNibNamed:@"KYMoreView" owner:nil options:nil] lastObject];
//}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *label = [[UILabel alloc] init];
        [self addSubview:label];
        self.label = label;
        label.text = @"正在加载。。。";
        label.textColor = [UIColor grayColor];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self);
            make.centerY.mas_equalTo(self);
        }];
        
        UIActivityIndicatorView *myActivity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        myActivity.hidesWhenStopped = YES;
        [myActivity startAnimating];
        self.myActivity = myActivity;
//        myActivity.isAnimating = YES;
        [self addSubview:myActivity];
        [myActivity mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_right).offset(-20);
            make.centerY.equalTo(self);
        }];
    }
    return self;
}


@end
