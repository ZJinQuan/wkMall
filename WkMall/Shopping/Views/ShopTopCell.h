//
//  ShopTopCell.h
//  WkMall
//
//  Created by QUAN on 16/7/13.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScrollImage.h"
#import "ShopViewController.h"

@interface ShopTopCell : UICollectionViewCell

@property (nonatomic, strong) ScrollImage *scrollImage;

@property (nonatomic, strong) ShopViewController * shopVC;

@property (nonatomic, weak) id<ScrollImageDelegate> delegate;

@property (weak, nonatomic) IBOutlet UIView *selectView;
@end
