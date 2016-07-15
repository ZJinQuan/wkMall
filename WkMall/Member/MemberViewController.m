//
//  MemberViewController.m
//  WkMall
//
//  Created by QUAN on 16/6/15.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import "MemberViewController.h"
#import "AccountViewController.h"
#import "CartViewController.h"
#import "OrderViewController.h"
#import "LoginViewController.h"

@interface MemberViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *memberView;

@end

@implementation MemberViewController

-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [_memberView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"memberCell"];
    
    LoginViewController *loginVC = [[LoginViewController alloc] init];
    loginVC.title = @"登录";
    
    [loginVC setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:loginVC animated:YES];
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.row) {
        case 0:{
            
            AccountViewController *accountVC = [[AccountViewController alloc] init];
            accountVC.title = @"账户信息";
            
            [accountVC setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:accountVC animated:YES];
        }
            break;
        case 1:{
            
            CartViewController *cartVC = [[CartViewController alloc] init];
            cartVC.title = @"购物车";
            
            [cartVC setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:cartVC animated:YES];
        }
            break;
        case 2:{
            
            OrderViewController *orderVC = [[OrderViewController alloc] init];
            orderVC.title = @"我的订单";
            
            [orderVC setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:orderVC animated:YES];
        }
            break;
            
        default:
            break;
    }
    
}

@end
