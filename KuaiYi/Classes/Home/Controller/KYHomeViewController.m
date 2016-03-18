//
//  KYHomeViewController.m
//  KuaiYi
//
//  Created by DaysSummer on 16/1/22.
//  Copyright © 2016年 SayDy. All rights reserved.
//

#import "AddressChoicePickerView.h"
#import "KYBanner.h"
#import "KYCollectionReusableView.h"
#import "KYDoctorListController.h"
#import "KYHomeCollectionViewCell.h"
#import "KYHomeViewController.h"
#import "KYMedicalCaseController.h"
#import "KYNetWorking.h"
#import "KYWebViewController.h"
#import "MJExtensionConst.h"
#import "NSObject+MJClass.h"
#import "NSObject+MJCoding.h"
#import "NSObject+MJKeyValue.h"
#import "NSObject+MJProperty.h"
#import "NSString+MJExtension.h"
#import "SDCycleScrollView.h"
#import "KYWeatherModle.h"
#import "KYWeatherView.h"
#import <UIImageView+WebCache.h>
#import <SVProgressHUD.h>

@interface
KYHomeViewController ()<SDCycleScrollViewDelegate, UICollectionViewDataSource,
                        UICollectionViewDelegate,
                        UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UIView* cycleView;
@property (weak, nonatomic) IBOutlet UIView* btnsView;
@property (nonatomic, copy) NSString* city;

@property (nonatomic, strong) NSMutableArray* URLarray;
@property (nonatomic, strong) NSMutableArray* LinkArray;
@property (strong, nonatomic) UICollectionView* collectionView;
@property (strong, nonatomic) NSMutableArray* iconArr;
@property (nonatomic, strong) NSMutableArray* nameArray;
@property (nonatomic, strong) KYWeatherModle* weatherModel;
@property (nonatomic, strong) KYWeatherView* weatherView;
@property (weak, nonatomic) IBOutlet KYWeatherView* weatherTopView;

@end

@implementation KYHomeViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.title = @"快医";
    self.city = @"北京";

  [self setupUI];
  [self loadDate];
  [self setCollectionView];
  [self setWhetherView];
  [self loadWeather];

  [self.weatherView.city addTarget:self
                            action:@selector(pickCity)
                  forControlEvents:UIControlEventTouchDown];
  [self.view bringSubviewToFront:self.weatherView];
    [self.view insertSubview:self.weatherView atIndex:100];
}
- (void)viewDidAppear:(BOOL)animated
{
  [super viewDidAppear:animated];
  self.collectionView.frame = self.btnsView.frame;
}
- (void)setupUI
{
  //添加跳转按钮
  UIBarButtonItem* item =
    [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_line"]
                                     style:UIBarButtonItemStylePlain
                                    target:self
                                    action:@selector(jump)];

  self.navigationItem.leftBarButtonItem = item;
}
- (void)setCollectionView
{
  // collectionView
  for (int i = 0; i < 6; i++) {
    [self.iconArr
      addObject:[UIImage
                  imageNamed:[NSString stringWithFormat:@"icon_%d", i + 1]]];
  }

  UICollectionViewFlowLayout* flowLayout =
    [[UICollectionViewFlowLayout alloc] init];
  [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
  self.collectionView =
    [[UICollectionView alloc] initWithFrame:self.btnsView.frame
                       collectionViewLayout:flowLayout];
  [self.collectionView registerClass:[KYHomeCollectionViewCell class]
          forCellWithReuseIdentifier:@"MyCollectionCell"];
  self.collectionView.showsVerticalScrollIndicator = NO;
  self.collectionView.backgroundColor = [UIColor whiteColor];
  [self.view addSubview:self.collectionView];

  self.collectionView.dataSource = self;
  self.collectionView.delegate = self;
  //    self.collectionView.frame = self.btnsView.frame;
  [self.collectionView registerClass:[KYCollectionReusableView class]
          forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                 withReuseIdentifier:@"Header"];
}
- (void)setWhetherView
{
  // whetherView创建
  KYWeatherView* weatherView = [KYWeatherView createView];
  weatherView.frame = self.weatherTopView.frame;
    self.weatherView = weatherView;
  [self.view addSubview:weatherView];
    
}
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
      NSMutableArray* arrayM = [NSMutableArray array];
      NSMutableArray* arrayM2 = [NSMutableArray array];
      KYBanner* banner = [KYBanner mj_objectWithKeyValues:responseObject];
      for (int i = 0; i < 3; ++i) {

        NSString* imgurl = banner.data.banners[i].banner_img_url;
        NSString* linkUrl = banner.data.banners[i].banner_link;
          NSLog(@"%@",linkUrl);
        [arrayM addObject:imgurl];
        [arrayM2 addObject:linkUrl];
      }
      self.LinkArray = arrayM2;
      self.URLarray = arrayM;
      [self show];

    }
    failure:^(NSError* error) {
      NSLog(@"%@", error.description);
    }];
}

//显示图片轮播
- (void)show
{
  SDCycleScrollView* cycleScrollView = [SDCycleScrollView
    cycleScrollViewWithFrame:self.cycleView.bounds
                    delegate:self
            placeholderImage:[UIImage imageNamed:@"placeholder"]];
  cycleScrollView.delegate = self;
//  cycleScrollView.currentPageDotImage =
//    [UIImage imageNamed:@"pageControlCurrentDot"];
//  cycleScrollView.pageDotImage = [UIImage imageNamed:@"pageControlDot"];
  cycleScrollView.imageURLStringsGroup = _URLarray;

  [self.cycleView addSubview:cycleScrollView];

  [self.view bringSubviewToFront:self.collectionView];
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
//多少组
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)collectionView
{
  return 1;
}
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
//点击事件
- (void)collectionView:(UICollectionView*)collectionView
  didSelectItemAtIndexPath:(NSIndexPath*)indexPath
{
    if (indexPath.row + 1 == 6) {
        KYWebViewController *web = [[KYWebViewController alloc] init];
        web.linkURL = @"http://202.106.210.115:18080/hyde-pluto-h360/nt/appEntrance.htm";
        [self.navigationController pushViewController:web animated:YES];
        return;
    }
  NSLog(@"diandiandian");
  KYMedicalCaseController* medicalController =
    [[KYMedicalCaseController alloc] initWithCi1_id:indexPath.row + 1];
  [self.navigationController pushViewController:medicalController animated:YES];
}

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

//- (CGSize)collectionView:(UICollectionView*)collectionView
//                  layout:(UICollectionViewLayout*)collectionViewLayout
// referenceSizeForHeaderInSection:(NSInteger)section
//{
//    return CGSizeMake(300, 20);
//}

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
//获取天气
- (void)loadWeather
{
  KYNetWorking* netWorkTool = [KYNetWorking sharedNetWorking];
  NSDictionary* dict = @{
    @"location" : self.city,
    @"output" : @"json",
    @"ak" : @"17IvzuqmKrK1cGwNL6VQebF9"
  };

  NSString* url = @"http://api.map.baidu.com/telematics/v3/weather";

  [netWorkTool GETWithURlString:url
    parameterDict:dict
    success:^(NSDictionary* responseObject) {

        KYWeatherModle* weather =
        [KYWeatherModle mj_objectWithKeyValues:responseObject];
        
        if (weather.results == nil) {
            [SVProgressHUD showInfoWithStatus:@"暂不支持该城市"];
            self.weatherView.temp.text = nil;
            [self.weatherView.city setTitle:@"选择城市" forState:UIControlStateNormal];
            self.weatherView.date.text = nil;
            self.weatherView.day.text = nil;
            self.weatherView.image.image= nil;
            return ;
        }
        
      self.weatherView.temp.text =
        weather.results[0].weather_data[0].temperature;
        [self.weatherView.city setTitle:weather.results[0].currentCity forState:UIControlStateNormal];
      self.weatherView.date.text = weather.date;
      self.weatherView.day.text = weather.results[0].weather_data[0].weather;
        NSURL *url = [NSURL URLWithString: weather.results[0].weather_data[0].dayPictureUrl];
        [self.weatherView.image sd_setImageWithURL:url];
    }
    failure:^(NSError* error) {
        [SVProgressHUD showErrorWithStatus:@"获取数据失败"];
      NSLog(@"2%@", error);
    }];
}
- (void)pickCity
{
  AddressChoicePickerView* addressPickerView =
    [[AddressChoicePickerView alloc] init];
  addressPickerView.block =
    ^(AddressChoicePickerView* view, UIButton* btn, AreaObject* locate) {
      self.city = locate.city;

      [self loadWeather];
    };
  [addressPickerView show];
}

@end
