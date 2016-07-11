//
//  MemberViewController.m
//  WkMall
//
//  Created by QUAN on 16/6/15.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import "MemberViewController.h"

@interface MemberViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *memberView;

@end

@implementation MemberViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [_memberView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"memberCell"];
    
}

#pragma mark UITableViewDelegate and UITableViewDataSource
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 15;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"memberCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    NSArray *titleArr = @[@"账户信息", @"购物车", @"我的订单"];
    
    cell.textLabel.text = titleArr[indexPath.row];
    
    
    return cell;
}

@end
