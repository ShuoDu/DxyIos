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
#import "OtherToolCell.h"
static NSString * identifier = @"cxCellID";
static CGFloat kMagin = 10.f;
static NSString * headIdentifier = @"cxHeadID";
@interface ToolController ()<UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView * collectionView;
@end

@implementation ToolController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collectionView];
}


- (UICollectionView *)collectionView {
    if (!_collectionView) {
        //自动网格布局
        UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc]init];
        //设置单元格大小
        flowLayout.itemSize = CGSizeMake((WIDTH-50)/4, 100);
        //最小行间距(默认为10)
        flowLayout.minimumLineSpacing = 10;
        //最小item间距（默认为10）
        flowLayout.minimumInteritemSpacing = 10;
        //设置senction的内边距
        flowLayout.sectionInset = UIEdgeInsetsMake(kMagin, kMagin, kMagin, kMagin);
        //网格布局
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, HEIGHT-340, WIDTH, 300) collectionViewLayout:flowLayout];
        [_collectionView registerNib:[UINib nibWithNibName:@"OtherToolCell" bundle:nil] forCellWithReuseIdentifier:@"storeCell"];
        //注册cell
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:identifier];
        //设置数据源代理
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.dataSource = self;
    }
    return _collectionView;
}

//有多少的分组
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

//每个分组里有多少个item
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 8;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    //根据identifier从缓冲池里去出cell
    OtherToolCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"storeCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}

- (IBAction)cancleAction:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (IBAction)oneAction:(id)sender {
    UseGzController *useGz = [[UseGzController alloc]init];
    UINavigationController *useGzNav = [[UINavigationController alloc]initWithRootViewController:useGz];
    [self presentViewController:useGzNav animated:YES completion:nil];
}

- (IBAction)twoAction:(id)sender {
    ScanController *scanView = [[ScanController alloc]init];
    UINavigationController *scanNav = [[UINavigationController alloc]initWithRootViewController:scanView];
    [self presentViewController:scanNav animated:YES completion:nil];
}

- (IBAction)threeAction:(id)sender {
    UseGzJiaController *useGz = [[UseGzJiaController alloc]init];
    UINavigationController *useGzjNav = [[UINavigationController alloc]initWithRootViewController:useGz];
    [self presentViewController:useGzjNav animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
