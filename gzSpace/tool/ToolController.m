//
//  ToolController.m
//  gzSpace
//
//  Created by 智享单车 on 2018/1/20.
//  Copyright © 2018年 智享单车. All rights reserved.
//

#import "ToolController.h"
#import "UseGzController.h"
#import "UseGzJiaController.h"
#import "ScanController.h"
#import "ToolsCollectionViewCell.h"
#import "SendHouseController.h"
#import "RentCarController.h"
#import "SellHousesController.h"
#import "LocalServiceController.h"
#import "UserMessageController.h"
#import "CarSharingController.h"
#import "DaZheController.h"
static NSString * identifier = @"cxCellID";
static CGFloat kMagin = 10.f;
static NSString * headIdentifier = @"cxHeadID";
@interface ToolController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, strong) UICollectionView * collectionView;
@property(nonatomic,copy)NSArray *dataArray;
@end

@implementation ToolController

- (void)loadView {
    [super loadView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
     self.navigationItem.title = @"发布";
    [self.view addSubview:self.collectionView];
     self.dataArray = @[@[@"房屋出租",@"zufang"],@[@"房屋出售",@"maifang"],@[@"汽车出租",@"zuche"],@[@"拼车信息",@"pinche"],@[@"本地服务",@"qita"],@[@"二手信息",@"ershou"],@[@"家政服务",@"maifang"],@[@"打折活动",@"tuangou"],@[@"擅长技能",@"qita"]];
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        //自动网格布局
        UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc]init];
        //设置单元格大小
        flowLayout.itemSize = CGSizeMake((WIDTH-50)/3, 100);
        //最小行间距(默认为10)
        flowLayout.minimumLineSpacing = 10;
        //最小item间距（默认为10）
        flowLayout.minimumInteritemSpacing = 10;
        //设置senction的内边距
        flowLayout.sectionInset = UIEdgeInsetsMake(kMagin, kMagin, kMagin, kMagin);
        //网格布局
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 10, WIDTH, HEIGHT) collectionViewLayout:flowLayout];
        [_collectionView registerNib:[UINib nibWithNibName:@"ToolsCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"storeCell"];
        //注册cell
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:identifier];
        //设置数据源代理
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
    }
    return _collectionView;
}

//有多少的分组
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

//每个分组里有多少个item
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    //根据identifier从缓冲池里去出cell
    ToolsCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"storeCell" forIndexPath:indexPath];
//    cell.layer.masksToBounds = YES;
    cell.layer.cornerRadius = 18;
    NSArray * dic = self.dataArray[indexPath.row];
    cell.title.text = dic[0];
    cell.backgroundColor = [UIColor whiteColor];
    cell.img.image = [UIImage imageNamed:dic[1]];
    //添加阴影
    cell.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    cell.layer.shadowOffset = CGSizeMake(0, -5);
    cell.layer.shadowOpacity = 0.3;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        SendHouseController *house = [[SendHouseController alloc]init];
        house.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:house animated:YES];
    } else if (indexPath.row == 1) {
        SellHousesController *houses = [[SellHousesController alloc]init];
        houses.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:houses animated:YES];
    } else if (indexPath.row == 2) {
        RentCarController *rentCar = [[RentCarController alloc]init];
        rentCar.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:rentCar animated:YES];
    } else if (indexPath.row == 3) {
        CarSharingController *shareCar = [[CarSharingController alloc]init];
        shareCar.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:shareCar animated:YES];
    } else if (indexPath.row == 4) {
        LocalServiceController *local = [[LocalServiceController alloc]init];
        local.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:local animated:YES];
    } else if (indexPath.row == 5) {
        UserMessageController *used = [[UserMessageController alloc]init];
        used.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:used animated:YES];
    } else if (indexPath.row == 6) {
        UserMessageController *used = [[UserMessageController alloc]init];
        used.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:used animated:YES];
    } else if (indexPath.row == 7) {
        DaZheController *dz = [[DaZheController alloc]init];
        dz.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:dz animated:YES];
    } else if (indexPath.row == 8) {
        UserMessageController *used = [[UserMessageController alloc]init];
        used.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:used animated:YES];
    }
    
}




@end
