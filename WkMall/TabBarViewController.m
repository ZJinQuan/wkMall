//
//  TabBarViewController.m
//  WkMall
//
//  Created by QUAN on 16/6/15.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import "TabBarViewController.h"
#import "MainViewController.h"
#import "MemberViewController.h"
#import "MapViewController.h"
#import "ConfigViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //加载子控制器
    [self addChildViewController:[[MainViewController alloc] init] andTitle:@"Shopping" andImageName:@"home_shopping" addSeledImage:@"home_shoppingpre"];
    
    [self addChildViewController:[[MemberViewController alloc] init] andTitle:@"Member" andImageName:@"home_member" addSeledImage:@"home_memberpre"];
    
    [self addChildViewController:[[MapViewController alloc] init] andTitle:@"Map" andImageName:@"home_map" addSeledImage:@"home_mappre"];
    
    [self addChildViewController:[[ConfigViewController alloc] init] andTitle:@"Config" andImageName:@"config" addSeledImage:@"home_configpre"];
    
}

-(void) addChildViewController: (UIViewController *)childController andTitle:(NSString *)title andImageName: (NSString *)image addSeledImage:(NSString *)selectImage{
    
    childController.title = title;
    
    [childController.tabBarItem setImage:[UIImage imageNamed:image]];
    [childController.tabBarItem setSelectedImage:[UIImage imageNamed:selectImage]];
    
    UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:childController];
    
    [self addChildViewController:navVC];
}


@end
