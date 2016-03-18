//
//  KYHomeCollectionViewCell.m
//  KuaiYi
//
//  Created by EndLess on 16/1/20.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import "KYHomeCollectionViewCell.h"


@implementation KYHomeCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, (SCREEN_WIDTH - 80) / 3, (SCREEN_WIDTH - 80) / 3)];
        self.imageView.contentMode = UIViewContentModeCenter;
        [self.imageView setUserInteractionEnabled:true];
        [self addSubview:self.imageView];
        self.descLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, (SCREEN_WIDTH - 80) / 3, (SCREEN_WIDTH - 80) / 3, 20)];
        self.descLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.descLabel];
    }
    return self;
}


@end
