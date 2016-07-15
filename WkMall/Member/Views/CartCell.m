//
//  CartCell.m
//  WkMall
//
//  Created by QUAN on 16/7/12.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import "CartCell.h"

@interface CartCell ()


@end

@implementation CartCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _stateLab.hidden = _state;
    
}

@end
