//
//  DetailsViewController.m
//  WkMall
//
//  Created by QUAN on 16/6/16.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIButton *starButton;

@property (weak, nonatomic) IBOutlet UIScrollView *waresScrollView;

@property (nonatomic, strong) UIPageControl *pageControl;
@end

@implementation DetailsViewController


-(UIPageControl *)pageControl{
    
    if (_pageControl == nil) {
        
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, _waresScrollView.height - 20, _waresScrollView.width, 20)];
        _pageControl.pageIndicatorTintColor = RGBA(110, 110, 110, 1);
        _pageControl.currentPageIndicatorTintColor = RGBA(222, 124, 64, 1);
        _pageControl.userInteractionEnabled = NO;
        _pageControl.currentPage = 0;
    }
    
    return _pageControl;
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    NSArray *imageArr = [NSArray arrayWithObjects:@"kettle-big",@"kettle-big",@"kettle-big", nil];
    
    for (int i = 0; i < imageArr.count; i++) {
        
        UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth * i, 0, kScreenWidth, self.waresScrollView.height)];
        
        imageV.image = [UIImage imageNamed:imageArr[i]];
        
        [self.waresScrollView addSubview:imageV];
    }
    
    self.pageControl.numberOfPages = imageArr.count;
    
    [self.view addSubview:self.pageControl];
    
    self.waresScrollView.contentSize = CGSizeMake(kScreenWidth * imageArr.count, 0);
    self.waresScrollView.pagingEnabled = YES;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"MODA";

}
- (IBAction)clickShowBtn:(UIButton *)sender {
    
    if(sender != self.starButton){
        self.starButton.enabled=YES;
        self.starButton=sender;
    }
    
    CGPoint point = self.waresScrollView.contentOffset;
    
    switch (sender.tag) {
        case 110:{
            
            if (point.x != 0) {
                
                [UIView animateWithDuration:0.2 animations:^{
                   
                    [self.waresScrollView setContentOffset:CGPointMake(point.x - kScreenWidth, 0) animated:NO];
                }];
                
            }
        }
            break;
        case 111:{
            
            if (point.x != kScreenWidth * 2) {
                
                [UIView animateWithDuration:0.2 animations:^{
                   
                    [self.waresScrollView setContentOffset:CGPointMake(point.x + kScreenWidth, 0) animated:NO];
                    
                }];
                
            }
        }
            break;
            
        default:
            break;
    }

    [self scrollViewDidEndDecelerating:_waresScrollView];
    
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    NSInteger index = fabs(scrollView.contentOffset.x) / scrollView.frame.size.width;
    NSLog(@"%ld",(long)index);
    
    [_pageControl setCurrentPage:index];
    
//    
//    if (self.waresScrollView.contentOffset.x == 0 || self.waresScrollView.contentOffset.x == kScreenWidth * 2) {
//        self.starButton.enabled = NO;
//    }else{
//        self.starButton.enabled = YES;
//    }
    
}


@end
