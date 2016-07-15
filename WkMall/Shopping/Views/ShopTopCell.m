//
//  ShopTopCell.m
//  WkMall
//
//  Created by QUAN on 16/7/13.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import "ShopTopCell.h"

@interface ShopTopCell ()
@property (weak, nonatomic) IBOutlet UIView *scrollView;

@property (nonatomic, strong) UIButton *starButton;
@end

@implementation ShopTopCell

-(ScrollImage *)scrollImage{
    
    if (_scrollImage == nil) {
        
        NSArray *imageArr = @[@"china", @"bannner"];
        _scrollImage = [[ScrollImage alloc] initWithCurrentController:_shopVC imageNames:imageArr viewFrame:CGRectMake(0, 0, kScreenWidth, 155) placeholderImage:[UIImage imageNamed:@""]];
        _scrollImage.delegate = self.delegate;
        _scrollImage.timeInterval = 2.0;
        
    }
    return _scrollImage;
}

- (IBAction)clickClassifyBtn:(UIButton *)sender {
    
    if(sender != self.starButton){
        self.starButton.selected=NO;
        self.starButton=sender;
    }
    self.starButton.selected=YES;
    
    [UIView animateWithDuration:0.3 animations:^{
        
        self.selectView.x = sender.x;
        
    }];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"clickClassify" object:nil];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    [self.scrollView addSubview:self.scrollImage.view];
}

@end
