//
//  KYFooterView.m
//  KuaiYi
//
//  Created by DaysSummer on 16/1/26.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import "KYFooterView.h"

@interface KYFooterView () <UITextViewDelegate>
@property (nonatomic ,strong) NSMutableArray *saveLabels;

@property (weak, nonatomic) IBOutlet UIButton *addBtn;
@end

@implementation KYFooterView

- (void)awakeFromNib {
    self.describeTextView.layer.cornerRadius = 5;
    self.describeTextView.layer.masksToBounds = YES;
    self.describeTextView.layer.borderWidth = 0.5;
    self.describeTextView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.describeTextView.delegate = self;
    
    self.addBtn.layer.cornerRadius = 5;
    self.addBtn.layer.masksToBounds = YES;
    self.addBtn.layer.borderWidth = 0.5;
    self.addBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
}

- (void)textViewDidChange:(UITextView *)textView {
    self.textTipLabel.hidden = self.describeTextView.hasText;
}

- (void)setLabels:(NSArray *)labels {
    _labels = labels;
    
    
    CGFloat w = 0;
    CGFloat h = 20;
    CGFloat x = 10;
    CGFloat y = 10;
    
    if (!self.labels.count) {
        self.labelsViewLayout.constant = 0;
    }else {
        if (self.labelsViewLayout.constant < h) {
            self.labelsViewLayout.constant = y + h + 8;;
        }
    }
    for (UILabel *label in self.saveLabels) {
        [label removeFromSuperview];
    }
    for (int i = 0; i < labels.count; i ++) {
        w = (14 * [labels[i] length]) + 2 * 5;
        if (x + w > self.labelsView.bounds.size.width) {
            y += h + 5;
            x = 10;
            self.labelsViewLayout.constant = y + h + 8;
        }else {
            
        }
        
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(x, y, w, h);
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:14];
        label.layer.borderWidth = 2;
        label.layer.borderColor = THEMECOLOR.CGColor;
        label.text = labels[i];
        [self.labelsView addSubview:label];
        x = label.frame.origin.x + label.frame.size.width + 10;
        [self.saveLabels addObject:label];
    }
}
- (NSMutableArray *)saveLabels {
    if (!_saveLabels) {
        _saveLabels = [NSMutableArray array];
    }
    return _saveLabels;
}


@end
