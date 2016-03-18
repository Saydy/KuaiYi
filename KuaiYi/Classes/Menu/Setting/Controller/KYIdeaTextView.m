//
//  KYIdeaTextView.m
//  KuaiYi
//
//  Created by mac on 16/1/24.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import "KYIdeaTextView.h"
#import <SVProgressHUD.h>

@interface KYIdeaTextView ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *textLable;
@property (weak, nonatomic) IBOutlet UILabel *num;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIButton *sendBtn;

@end


@implementation KYIdeaTextView
- (IBAction)sendClick:(UIButton *)sender {
    [SVProgressHUD showSuccessWithStatus:@"提交成功"];
    self.textView.text = nil;
    self.textLable.hidden = NO;
    self.num.text = [NSString stringWithFormat:@"%zd", 200 ];
    
}
- (void)awakeFromNib{
    [super awakeFromNib];
    self.textView .delegate = self;

}
- (void)textViewDidChange:(UITextView *)textView{
    self.textLable.hidden = self.textView.hasText;
    self.num.text = [NSString stringWithFormat:@"%zd", 200 - self.textView.text.length];
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if (textView.text.length >199){
        return NO;
    }
    return YES;
}
@end
