//
//  KYCollectionReusableView.m
//  KuaiYi
//
//  Created by EndLess on 16/1/20.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import "KYCollectionReusableView.h"

@implementation KYCollectionReusableView
- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.title = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 300, 20)];
        self.title.textColor = [UIColor blackColor];
        [self addSubview:self.title];
    }
    return self;
}
@end
