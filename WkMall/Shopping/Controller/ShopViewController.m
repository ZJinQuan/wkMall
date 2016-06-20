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

@interface ShopViewController ()<ScrollImageDelegate,UICollectionViewDelegate, UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UIView *topImage;
@property (weak, nonatomic) IBOutlet UICollectionView *shopCollView;
@property (weak, nonatomic) IBOutlet UIButton *dianQiBtn;
@property (weak, nonatomic) IBOutlet UIButton *fuZhuangBtn;
@property (weak, nonatomic) IBOutlet UIButton *foodBtn;
@property (weak, nonatomic) IBOutlet UIButton *jiaJuBtn;
@property (weak, nonatomic) IBOutlet UIButton *shanPinBtn;
@property (weak, nonatomic) IBOutlet UIButton *qiPeiBtn;

@property (weak, nonatomic) IBOutlet UIView *selectView;

@property (nonatomic, strong) UIButton *starButton;

@end

@implementation ShopViewController

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.translucent = NO;
    
}

-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
    //图片轮播器
    NSArray *imageArr = @[@"china", @"bannner"];
    
    ScrollImage *scrl = [[ScrollImage alloc] initWithCurrentController:self imageNames:imageArr viewFrame:self.topImage.bounds placeholderImage:[UIImage imageNamed:@""]];
    
    scrl.delegate = self;
    scrl.timeInterval = 2.0;
    
    [self.topImage addSubview:scrl.view];

    
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
    
//    [self.shopCollView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellid"];
    
    self.shopCollView.backgroundView.backgroundColor = [UIColor yellowColor];
    
    self.shopCollView.backgroundColor = [UIColor whiteColor];
    
//    self.shopCollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 5);

}

- (IBAction)clickClassifyBtn:(UIButton *)sender {
    
    if(sender != self.starButton){
        self.starButton.selected=NO;
        self.starButton=sender;
    }
    self.starButton.selected=YES;
 
    [UIView animateWithDuration:0.3 animations:^{
        
        self.selectView.x = sender.x;
        
    }];

    [self.shopCollView setContentOffset:CGPointMake(0, 0) animated:YES];
    [self.shopCollView reloadData];
}

#pragma mark UICollectionViewDelegate and UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 9;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *cellID = @"ShopCell";
    
    ShopCell * cell  = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    
//    cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
 
    return cell;
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
