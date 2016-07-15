//
//  ShopViewController.m
//  WkMall
//
//  Created by QUAN on 16/6/15.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import "ShopViewController.h"
#import "ScrollImage.h"
#import "ShopCell.h"
#import "CommodityViewController.h"
#import "ShopTopCell.h"

@interface ShopViewController ()<ScrollImageDelegate,UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *shopCollView;

@property (nonatomic, strong) UIButton *starButton;

@end

@implementation ShopViewController

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.translucent = NO;
    
}

-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];

    //导航栏
    [self initnav];
    
    UICollectionViewFlowLayout *flowLayout= [[UICollectionViewFlowLayout alloc] init];
    
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    CGFloat W = (kScreenWidth - 10) / 2 - 2.5;
    
    flowLayout.itemSize = CGSizeMake(W, W + 50);
    
    flowLayout.minimumLineSpacing = 5;
    flowLayout.minimumInteritemSpacing = 0;
    
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    self.shopCollView.collectionViewLayout = flowLayout;
    
    
    [self.shopCollView registerNib:[UINib nibWithNibName:@"ShopCell" bundle:nil] forCellWithReuseIdentifier:@"ShopCell"];
    [self.shopCollView registerNib:[UINib nibWithNibName:@"ShopTopCell" bundle:nil] forCellWithReuseIdentifier:@"shopTopCell"];
    
    self.shopCollView.backgroundView.backgroundColor = [UIColor yellowColor];
    
    self.shopCollView.backgroundColor = [UIColor whiteColor];

    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(clickClassify:) name:@"clickClassify" object:nil];
}
-(void) clickClassify: (NSNotification *)notf{
    
    [self.shopCollView setContentOffset:CGPointMake(0, 0) animated:YES];
    [self.shopCollView reloadData];
    
}

#pragma mark UICollectionViewDelegate and UICollectionViewDataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    return 9;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CGSize size;
    
    if (indexPath.section == 0) {
        size = CGSizeMake(kScreenWidth, 190);
        
    }else{
        
        CGFloat W = (kScreenWidth ) / 2 - 2.5;
        
        size = CGSizeMake(W, W + 50);
    }
    
    return size;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0) {
        
        static NSString *cellID = @"shopTopCell";
        
        ShopTopCell * cell  = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
        
        cell.delegate = self;
        cell.shopVC = self;
        
        return cell;
        
    }else{
        
        static NSString *cellID = @"ShopCell";
        
        ShopCell * cell  = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
        
        return cell;
        
    }
    return nil;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    NSLog(@"%ld",(long)indexPath.item);
    
    CommodityViewController *commVC = [[CommodityViewController alloc] init];
    
    [self.navigationController pushViewController:commVC animated:YES];
    
}

-(void) initnav{
    
    self.title = @"SHOP";
    
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"location"] style:UIBarButtonItemStyleDone target:self action:@selector(clickRight)];
    
    rightBtn.tintColor = [UIColor whiteColor];
    
    self.navigationItem.rightBarButtonItem = rightBtn;
    
}

-(void) clickRight{
    
}


@end
