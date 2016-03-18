//
//  DiagnoseTimeView.h
//  demo
//
//  Created by xll on 16/1/22.
//  Copyright © 2016年 xll12. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KYButtonTypeThree.h"
@interface DiagnoseTimeView : UIView
@property (weak,nonatomic) KYButtonTypeThree * currentBtn;
-(void)sendHospitalName:(NSString*)name;
@end
