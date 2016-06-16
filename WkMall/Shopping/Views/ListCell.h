//
//  ListCell.h
//  WkMall
//
//  Created by QUAN on 16/6/16.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListCell : UITableViewCell

@property (nonatomic, strong) UIImage *imageName;
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@end
