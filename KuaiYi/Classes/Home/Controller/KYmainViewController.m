//
//  KYmainViewController.m
//  KuaiYi
//
//  Created by EndLess on 16/1/19.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import "KYBanner.h"
#import "KYCollectionReusableView.h"
#import "KYHomeCollectionViewCell.h"
#import "KYNetWorking.h"
#import "KYWebViewController.h"
#import "KYmainViewController.h"
#import "MJExtensionConst.h"
#import "NSObject+MJClass.h"
#import "NSObject+MJCoding.h"
#import "NSObject+MJKeyValue.h"
#import "NSObject+MJProperty.h"
#import "NSString+MJExtension.h"
#import "SDCycleScrollView.h"
#import "KYMedicalCaseController.h"
#import "KYDoctorListController.h"
#import "KYWeatherModle.h"
#import "KYWeatherView.h"
#import "AddressChoicePickerView.h"


@interface
KYmainViewController ()<SDCycleScrollViewDelegate, UICollectionViewDataSource,
                        UICollectionViewDelegate,
                        UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) NSMutableArray* URLarray;
@property (nonatomic, strong) NSMutableArray* LinkArray;
@property (strong, nonatomic) UICollectionView* collectionView;
@property (strong, nonatomic) NSMutableArray* iconArr;
@property (nonatomic, strong) NSMutableArray* nameArray;

@end

@implementation KYmainViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  [self loadDate];

  //添加跳转按钮

    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_line"] style:UIBarButtonItemStylePlain target:self action:@selector(jump)];

  self.navigationItem.leftBarButtonItem = item;
    // 测试按钮
    UIBarButtonItem *testItem = [[UIBarButtonItem alloc] initWithTitle:@"测试" style:UIBarButtonItemStylePlain target:self action:@selector(testJump)];
    self.navigationItem.rightBarButtonItem = testItem;

   
    
  // collectionView
  for (int i = 0; i < 6; i++) {
    [self.iconArr addObject:[UIImage imageNamed:[NSString stringWithFormat:@"icon_%d",i+1]]];
  }

  UICollectionViewFlowLayout* flowLayout =
    [[UICollectionViewFlowLayout alloc] init];
  [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
  self.collectionView =
    [[UICollectionView alloc] initWithFrame:[[UIScreen mainScreen] bounds]
                       collectionViewLayout:flowLayout];
  [self.collectionView registerClass:[KYHomeCollectionViewCell class]
          forCellWithReuseIdentifier:@"MyCollectionCell"];

  self.collectionView.backgroundColor = [UIColor whiteColor];
  [self.view addSubview:self.collectionView];

  self.collectionView.dataSource = self;
  self.collectionView.delegate = self;
  self.collectionView.frame = CGRectMake(
    0, [UIScreen mainScreen].bounds.size.height - 400, SCREEN_WIDTH, 400);
  [self.collectionView registerClass:[KYCollectionReusableView class]
          forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                 withReuseIdentifier:@"Header"];
}
// 测试页面
- (void)testJump {
    KYDoctorListController *doctorListVC = [[KYDoctorListController alloc] initWithDict:@{@"ci1_id" : @(1),@"ci2_id" : @(3),@"ci3_id" : @(3)}];
    [self.navigationController pushViewController:doctorListVC animated:YES];
}
//显示图片轮播
- (void)show
{
  UIScrollView* showView = [[UIScrollView alloc] initWithFrame:self.view.frame];
  showView.contentSize =
    CGSizeMake(self.view.frame.size.width, self.view.frame.size.height);
  [self.view addSubview:showView];
  SDCycleScrollView* cycleScrollView = [SDCycleScrollView
    cycleScrollViewWithFrame:CGRectMake(0, 150,
                                        [UIScreen mainScreen].bounds.size.width,
                                        240)
                    delegate:self
            placeholderImage:[UIImage imageNamed:@"placeholder"]];
  cycleScrollView.delegate = self;
  cycleScrollView.currentPageDotImage =
    [UIImage imageNamed:@"pageControlCurrentDot"];
  cycleScrollView.pageDotImage = [UIImage imageNamed:@"pageControlDot"];
  cycleScrollView.imageURLStringsGroup = _URLarray;

  [showView addSubview:cycleScrollView];

    [self.view bringSubviewToFront:self.collectionView];
}

//跳转动作
- (void)jump
{

  if ([self.KYdelegate respondsToSelector:@selector(openDrawer)]) {
    [self.KYdelegate openDrawer];
  }
}
//获取网络数据创建模型
- (void)loadDate
{

  NSDictionary* paramDic = @{
    @"login_token" : @"985c96ce43bb5ef69de3e1ad8afaa83f",
    @"page_size" : @(10),
    @"page" : @(1)
  };
  KYNetWorking* netWorkTool = [KYNetWorking sharedNetWorking];

  [netWorkTool POSTWithURlString:@"http://iosapi.itcast.cn/banners.json.php"
    parameterDict:paramDic
    success:^(NSDictionary* responseObject) {
      // NSLog(@"%@", responseObject);
      NSMutableArray* arrayM = [NSMutableArray array];
      NSMutableArray* arrayM2 = [NSMutableArray array];
      KYBanner* banner = [KYBanner mj_objectWithKeyValues:responseObject];
      for (int i = 0; i < 3; ++i) {

        NSString* imgurl = banner.data.banners[i].banner_img_url;
        NSString* linkUrl = banner.data.banners[i].banner_link;
        [arrayM addObject:imgurl];
        [arrayM2 addObject:linkUrl];

        // NSLog(@"%@",banner.data.banners[i].banner_img_url);
      }
      self.LinkArray = arrayM2;
      self.URLarray = arrayM;

      [self show];

    }
    failure:^(NSError* error) {
      NSLog(@"%@", error.description);
    }];
}
//点击跳转webView
- (void)cycleScrollView:(SDCycleScrollView*)cycleScrollView
   didSelectItemAtIndex:(NSInteger)index
{
  // NSLog(@"---点击了第%ld张图片", (long)index);
  KYWebViewController* web = [[KYWebViewController alloc] init];
  web.linkURL = _LinkArray[index];

  [self.navigationController pushViewController:web animated:YES];
}

#pragma mark - UICollectionViewDataSource
//一组几个
- (NSInteger)collectionView:(UICollectionView*)collectionView
     numberOfItemsInSection:(NSInteger)section
{
  return self.iconArr.count;
}

// cell文字和图片设置
- (UICollectionViewCell*)collectionView:(UICollectionView*)collectionView
                 cellForItemAtIndexPath:(NSIndexPath*)indexPath
{

  KYHomeCollectionViewCell* cell =
    [collectionView dequeueReusableCellWithReuseIdentifier:@"MyCollectionCell"
                                              forIndexPath:indexPath];
  cell.imageView.image = [self.iconArr objectAtIndex:indexPath.row];
  cell.descLabel.text = self.nameArray[indexPath.row];

  return cell;
}

//多少组
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)collectionView
{
  return 1;
}

- (UICollectionReusableView*)collectionView:(UICollectionView*)collectionView
          viewForSupplementaryElementOfKind:(NSString*)kind
                                atIndexPath:(NSIndexPath*)indexPath
{

  UICollectionReusableView* reusable = nil;
  if (kind == UICollectionElementKindSectionHeader) {

    KYCollectionReusableView* view =
      [collectionView dequeueReusableSupplementaryViewOfKind:
                        UICollectionElementKindSectionHeader
                                         withReuseIdentifier:@"Header"
                                                forIndexPath:indexPath];

    reusable = view;
  }
  return reusable;
}

#pragma mark - UICollectionViewDelegate
//点击事件
- (void)collectionView:(UICollectionView*)collectionView
  didSelectItemAtIndexPath:(NSIndexPath*)indexPath
{
  NSLog(@"diandiandian");
    KYMedicalCaseController *medicalController = [[KYMedicalCaseController alloc] initWithCi1_id:indexPath.row + 1];
    [self.navigationController pushViewController:medicalController animated:YES];
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView*)collectionView
                  layout:(UICollectionViewLayout*)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath*)indexPath
{
  return CGSizeMake((SCREEN_WIDTH - 80) / 3, (SCREEN_WIDTH - 80) / 3 + 20);
}

- (UIEdgeInsets)collectionView:(UICollectionView*)collectionView
                        layout:(UICollectionViewLayout*)collectionViewLayout
        insetForSectionAtIndex:(NSInteger)section
{
  return UIEdgeInsetsMake(20, 20, 10, 20);
}

- (CGSize)collectionView:(UICollectionView*)collectionView
                           layout:(UICollectionViewLayout*)collectionViewLayout
  referenceSizeForHeaderInSection:(NSInteger)section
{
  return CGSizeMake(300, 20);
}
- (NSMutableArray*)iconArr
{
  if (_iconArr == nil) {
    _iconArr = [NSMutableArray array];
  }
  return _iconArr;
}
- (NSMutableArray*)nameArray
{
  if (_nameArray == nil) {
    _nameArray = [NSMutableArray array];
    NSString* name1 = @"肿瘤";
    NSString* name2 = @"心血管";
    NSString* name3 = @"神经科";
    NSString* name4 = @"血液科";
    NSString* name5 = @"骨科";
    NSString* name6 = @"公益活动";

    [_nameArray addObject:name1];
    [_nameArray addObject:name2];
    [_nameArray addObject:name3];
    [_nameArray addObject:name4];
    [_nameArray addObject:name5];
    [_nameArray addObject:name6];
  }
  return _nameArray;
}



@end