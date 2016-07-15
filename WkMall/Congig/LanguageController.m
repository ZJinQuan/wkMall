//
//  LanguageController.m
//  WkMall
//
//  Created by QUAN on 16/7/12.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import "LanguageController.h"

@interface LanguageController ()

@end

@implementation LanguageController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark UITableViewDelegate
-(CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 12;
}

#pragma mark UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSArray *arr = @[@"中文", @"English", @"w języku polskim"];
    
    cell.textLabel.text = arr[indexPath.row];
    
    return cell;
}

/**
 *  当前行已经被选中时调用
 */
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    [cell setAccessoryType:UITableViewCellAccessoryCheckmark];

}

/**
 *  当前行被取消选中时调用
 */
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell setAccessoryType:UITableViewCellAccessoryNone];
    
}

@end
