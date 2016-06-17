//
//  MainViewController.m
//  WkMall
//
//  Created by QUAN on 16/6/15.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import "MainViewController.h"
#import "ShopViewController.h"
#import "ScrollImage.h"

@interface MainViewController ()<ScrollImageDelegate>

@property (weak, nonatomic) IBOutlet UIView *mainScrollView;

@end

@implementation MainViewController

-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
    NSArray *imageArr = @[@"bannner", @"china"];

    ScrollImage *scrl = [[ScrollImage alloc] initWithCurrentController:self imageNames:imageArr viewFrame:self.mainScrollView.bounds placeholderImage:[UIImage imageNamed:@""]];
    
    scrl.delegate = self;
    scrl.timeInterval = 2.0;
    
    
    [self.mainScrollView addSubview:scrl.view];
}

-(void)viewDidDisappear:(BOOL)animated{
    
    [super viewDidDisappear:animated];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"MALL";
    
}

- (IBAction)clickEnterBtn:(id)sender {
    
    ShopViewController *shopVC = [[ShopViewController alloc] init];
    
    [shopVC setHidesBottomBarWhenPushed:YES];
    
    [self.navigationController pushViewController:shopVC animated:YES];

}

@end
