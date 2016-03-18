//
//  KYWebViewController.m
//  KuaiYi
//
//  Created by EndLess on 16/1/20.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import "KYWebViewController.h"

@interface KYWebViewController ()

@end

@implementation KYWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIWebView * webview = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:self.linkURL]];
    [self.view addSubview: webview];
    [webview loadRequest:request];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
