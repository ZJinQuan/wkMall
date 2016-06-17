//
//  DetailsViewController.m
//  WkMall
//
//  Created by QUAN on 16/6/16.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *waresScrollView;

@property (nonatomic, strong) UIPageControl *page;
@end

@implementation DetailsViewController

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    NSArray *imageArr = [NSArray arrayWithObjects:@"kettle-big",@"kettle-big", nil];
    
    for (int i = 0; i < imageArr.count; i++) {
        
        UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth * i, 0, kScreenWidth, self.waresScrollView.height)];
        
        imageV.image = [UIImage imageNamed:imageArr[i]];
        
        [self.waresScrollView addSubview:imageV];
    }
    
    UIPageControl *page = [[UIPageControl alloc] initWithFrame:CGRectMake(0, _waresScrollView.height - 20, _waresScrollView.width, 20)];
    
    page.numberOfPages = imageArr.count;
    page.currentPage = 0;
    page.pageIndicatorTintColor = RGBA(110, 110, 110, 1);
    page.currentPageIndicatorTintColor = RGBA(222, 124, 64, 1);
    
    [self.view addSubview:page];
    
    self.page = page;
    
    self.waresScrollView.contentSize = CGSizeMake(kScreenWidth * 2, 0);
    self.waresScrollView.pagingEnabled = YES;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"MODA";

}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    NSInteger index = fabs(scrollView.contentOffset.x) / scrollView.frame.size.width;
    NSLog(@"%ld",(long)index);
    
    [self.page setCurrentPage:index];
    
}


@end
