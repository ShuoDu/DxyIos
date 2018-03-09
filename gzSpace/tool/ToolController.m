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
        flowLayout.itemSize = CGSizeMake((WIDTH-50)/3, 120);
        //最小行间距(默认为10)
        flowLayout.minimumLineSpacing = 15;
        //最小item间距（默认为10）
        flowLayout.minimumInteritemSpacing = 15;
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
    cell.layer.masksToBounds = YES;
    cell.layer.cornerRadius = 18;
    NSArray * dic = self.dataArray[indexPath.row];
    cell.title.text = dic[0];
    cell.backgroundColor = [UIColor whiteColor];
    cell.img.image = [UIImage imageNamed:dic[1]];
 
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
        used.titles = @"二手信息";
        used.dataArray = [[NSMutableArray alloc]initWithObjects:@{@"物品名称":@"请输入物品名称(如:iphonex)"},@{@"新旧程度":@"请输入新旧程度(如:9成新)"},@{@"生产日期":@"请输入产品生产日期"},@{@"价格":@"请输入价格"},@{@"联系人":@"请输入联系人"},@{@"手机":@"请输入手机号"},nil];
        used.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:used animated:YES];
    } else if (indexPath.row == 6) {
        UserMessageController *used = [[UserMessageController alloc]init];
        used.titles = @"维修服务";
        used.dataArray = [[NSMutableArray alloc]initWithObjects:@{@"公司名称":@"请输入公司名称"},@{@"维修范围":@"请输入维修范围(如:家电,手机)"},@{@"地址":@"请输入公司地址"},@{@"服务范围":@"请输入服务范围(如:新野县)"},@{@"联系人":@"请输入联系人"},@{@"手机":@"请输入手机号"},nil];
        used.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:used animated:YES];
    } else if (indexPath.row == 7) {
        UserMessageController *used = [[UserMessageController alloc]init];
        used.titles = @"打折活动";
        used.dataArray = [[NSMutableArray alloc]initWithObjects:@{@"商户名称":@"请输入名称"},@{@"活动标题":@"如:万德隆洗衣机打折了"},@{@"地址":@"请输入公司地址"},@{@"服务范围":@"如:新野县"},@{@"联系人":@"请输入联系人"},@{@"手机":@"请输入手机号"},nil];
        used.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:used animated:YES];
    } else if (indexPath.row == 8) {
        UserMessageController *used = [[UserMessageController alloc]init];
        used.titles = @"擅长技能";
        used.dataArray = [[NSMutableArray alloc]initWithObjects:@{@"擅长技能":@"请输入技能(如:写程序)"},@{@"价格":@"如:100/小时"},@{@"服务范围":@"如:新野县"},@{@"联系人":@"请输入联系人"},@{@"手机":@"请输入手机号"},nil];
        used.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:used animated:YES];
    
}
}
@end
