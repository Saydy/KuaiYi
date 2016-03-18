//
//  UIButton+CycleBtn.h
//  demo
//
//  Created by xll on 16/1/20.
//  Copyright © 2016年 xll12. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (CycleBtn)
+(UIButton*)creatBtnWithImageName:(NSString*)imageName andTitle:(NSString*)title andNumber:(NSString*)num andFontSize:(CGFloat)fronsize;
@end
