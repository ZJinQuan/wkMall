//
//  ListViewController.m
//  WkMall
//
//  Created by QUAN on 16/6/16.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import "ListViewController.h"
#import "ListCell.h"

@interface ListViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *listTableView;

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"MODA";
    
//    [self.listTableView registerClass:[ListCell class] forCellReuseIdentifier:@"ListCell"];
    
    [self.listTableView registerNib:[UINib nibWithNibName:@"ListCell" bundle:nil] forCellReuseIdentifier:@"ListCell"];
    
    
}
#pragma mark UITableViewDelegate and UITableViewDataSource
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"ListCell";
    
    ListCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    NSArray *arr = [NSArray arrayWithObjects:@"rice cooker.png", @"kettle", nil];
    
    cell.iconImage.image = [UIImage imageNamed:arr[indexPath.row]];

    return cell;
}




@end
