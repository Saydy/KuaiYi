//
//  KYDetailsPiker.m
//  KuaiYi
//
//  Created by mac on 16/1/24.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import "KYDetailsPiker.h"
#import "KYUserMessageController.h"


@interface KYDetailsPiker ()
@property(nonatomic,strong)KYUserMessageController *usermessage;
@end


@implementation KYDetailsPiker

- (void)awakeFromNib{

    [super awakeFromNib];
    self.layer.cornerRadius = 15;
  
}
- (IBAction)cancel:(id)sender {
    
}
- (IBAction)commit:(id)sender {

}

@end
