//
//  MapViewController.m
//  WkMall
//
//  Created by QUAN on 16/6/15.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import "MapViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface MapViewController ()<MKMapViewDelegate, CLLocationManagerDelegate>
{
    CLLocationManager *_manager;
    MKMapView *_mapView;
}
@property (nonatomic,strong) CLLocationManager *manager;
@property (nonatomic,strong) MKMapView *mapView;;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;
@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self creatMapView];
    [self settingNav];
}

-(void)settingNav{

    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth - 16, 44)];
    view.backgroundColor = [UIColor clearColor];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(view.width - 50, 0, 50, 44)];
    btn.centerY = view.centerY;
    [btn setImage:[UIImage imageNamed:@"btn_navigation"] forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UITextField *text = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, btn.x - 8, 40)];
    text.centerY = view.centerY;
    text.textAlignment = NSTextAlignmentCenter;
    text.layer.cornerRadius = 5;
    text.layer.masksToBounds = YES;
    text.placeholder = @"目的地(商城名或商户名)";
    text.backgroundColor = [UIColor whiteColor];

    [view addSubview:btn];
    [view addSubview:text];
    
    self.navigationItem.titleView = view;

    self.segment.selectedSegmentIndex = 0;
    
    [self.view bringSubviewToFront:self.segment];
    
}

- (void)creatMapView {
    //定位管理
    self.manager = [[CLLocationManager alloc] init];
    CGFloat v = [[[UIDevice currentDevice] systemVersion] doubleValue];
    if (v >= 8.0) {
        //申请验证
        [self.manager requestAlwaysAuthorization];
    }
    
    self.manager.delegate = self;
    
    [self.manager startUpdatingLocation];
    //实例化地图
    self.mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
    //设置地图的类型
    self.mapView.mapType = MKMapTypeStandard;
    
    //设置 地图显示的区域范围(地图在视图上的中心点)
    [self.mapView setRegion:MKCoordinateRegionMake([[self.manager location] coordinate], MKCoordinateSpanMake(0.1, 0.1))];
    
    //是否显示用户位置
    self.mapView.showsUserLocation = YES;
    
    //设置代理
    self.mapView.delegate = self;
    
    //粘贴到视图上
    [self.view addSubview:self.mapView];
    
}

- (void)btnClick:(UIButton *)button {
    
    //回到用户原来当前位置
    //获取用户位置
    CLLocation * userLocation = self.mapView.userLocation.location;
    
    self.mapView.region = MKCoordinateRegionMake(userLocation.coordinate, MKCoordinateSpanMake(0.01, 0.01));
    
}

#pragma mark - MKMapViewDelegate


@end
