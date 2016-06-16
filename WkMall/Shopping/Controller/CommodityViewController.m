//
//  CommodityViewController.m
//  WkMall
//
//  Created by QUAN on 16/6/16.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import "CommodityViewController.h"
#import "ListViewController.h"

@interface CommodityViewController ()

@end

@implementation CommodityViewController

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.translucent = YES;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsCompact];
    self.navigationController.navigationBar.shadowImage=[UIImage new];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    

    
}

- (IBAction)clickEnterBtn:(id)sender {
    
    ListViewController *listVC = [[ListViewController alloc] init];
    
    [self.navigationController pushViewController:listVC animated:YES];
}

@end
