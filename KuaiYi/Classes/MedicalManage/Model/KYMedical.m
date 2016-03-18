//
//  KYMedical.m
//  KuaiYi
//
//  Created by DaysSummer on 16/1/26.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import "KYMedical.h"

@interface KYMedical () <NSCoding>

@end
@implementation KYMedical
- (void)encodeWithCoder:(NSCoder *)aCoder {
//    @property (nonatomic ,copy) NSString *name;
//    @property (nonatomic ,copy) NSString *name2;
//    @property (nonatomic ,strong) NSArray *labels;
//    
//    @property (nonatomic ,copy) NSString *text;
//    @property (nonatomic ,copy) NSString *time;
    //    @property (nonatomic ,strong) UIImage *image;
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.name2 forKey:@"name2"];
    
    [aCoder encodeObject:self.labels forKey:@"labels"];
    [aCoder encodeObject:self.text forKey:@"text"];
    
    [aCoder encodeObject:self.time forKey:@"time"];
    [aCoder encodeObject:self.image forKey:@"image"];
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self.name = [aDecoder decodeObjectForKey:@"name"];
    self.name2 = [aDecoder decodeObjectForKey:@"name2"];
    
    self.labels = [aDecoder decodeObjectForKey:@"labels"];
    self.text = [aDecoder decodeObjectForKey:@"text"];
    
    self.time = [aDecoder decodeObjectForKey:@"time"];
    self.image = [aDecoder decodeObjectForKey:@"image"];
    return self;
}
@end
