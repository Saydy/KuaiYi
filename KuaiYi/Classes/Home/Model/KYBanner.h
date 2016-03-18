//
//  KYBanner.h
//  KuaiYi
//
//  Created by EndLess on 16/1/20.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Data,Banners;
@interface KYBanner : NSObject
//@property (nonatomic, copy) NSString *banner_title;
//@property (nonatomic, copy) NSString *banner_img_url;
//@property (nonatomic, copy) NSString *banner_link;
//@property (nonatomic, copy) NSString *banner_id;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) Data *data;

@property (nonatomic, copy) NSString *code;

@end


@interface Data : NSObject

@property (nonatomic, strong) NSArray<Banners *> *banners;

@end

@interface Banners : NSObject

@property (nonatomic, copy) NSString *banner_title;

@property (nonatomic, copy) NSString *banner_img_url;

@property (nonatomic, copy) NSString *banner_link;

@property (nonatomic, copy) NSString *banner_id;

@end

