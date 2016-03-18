//
//  KYFooterView.h
//  KuaiYi
//
//  Created by DaysSummer on 16/1/26.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KYFooterView : UIView
@property (nonatomic ,strong) NSArray *labels;

@property (weak, nonatomic) IBOutlet UIView *labelsView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *labelsViewLayout;
@property (weak, nonatomic) IBOutlet UITextView *describeTextView;
@property (weak, nonatomic) IBOutlet UIButton *addTagBtn;
@property (weak, nonatomic) IBOutlet UIButton *addPhoto;
@property (weak, nonatomic) IBOutlet UIImageView *photoImage;
@property (weak, nonatomic) IBOutlet UILabel *textTipLabel;


@end
