//
//  ListCell.m
//  WkMall
//
//  Created by QUAN on 16/6/16.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import "ListCell.h"

@interface ListCell ()




@end

@implementation ListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.iconImage.image = self.imageName;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
