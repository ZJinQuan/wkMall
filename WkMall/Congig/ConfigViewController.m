//
//  ConfigViewController.m
//  WkMall
//
//  Created by QUAN on 16/6/15.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import "ConfigViewController.h"

@interface ConfigViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *configView;

@end

@implementation ConfigViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [_configView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"configCell"];
}


#pragma mark UITableViewDelegate and UITableViewDataSource
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 15;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"configCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    NSArray *titleArr = @[@"语言设置", @"关于我们"];
    
    cell.textLabel.text = titleArr[indexPath.row];
    
    
    return cell;
}


@end
