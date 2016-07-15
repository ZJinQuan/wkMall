//
//  CartCell.h
//  WkMall
//
//  Created by QUAN on 16/7/12.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CartCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *stateLab;

@property (nonatomic, assign) BOOL state;

@end
