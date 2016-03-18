//
//  Status.m
//  demo
//
//  Created by xll on 16/1/20.
//  Copyright © 2016年 xll12. All rights reserved.
//

#import "Status.h"

@implementation Status
- (instancetype)initWithDic:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
//截取
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{}
@end
