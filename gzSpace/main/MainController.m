//
//  MainController.m
//  gzSpace
//
//  Created by 智享单车 on 2017/12/11.
//  Copyright © 2017年 智享单车. All rights reserved.
//

#import "MainController.h"
#import "MainHeadView.h"
#import "MainOneCell.h"
#import "MainTwoCell.h"
#import "UIColor+YYAdd.h"
#import "SpaceController.h"
#import "TentingHouseController.h"
#import "SellHouseController.h"
#import "ZuCheController.h"
#import "WorkController.h"
#import "QiTaController.h"
#import "PinCheController.h"
#import "MessageOneCell.h"
#import "MessageTwoCell.h"
static NSString *oneCellID = @"MainOneCell";
static NSString *twoCellID = @"MessageTwoCell";
static NSString *oneMessage = @"MessageOneCell";
@interface MainController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *myTableView;
}
@property(nonatomic,strong)MainHeadView *headView;
@property(nonatomic,strong)NSMutableArray *btnArray;
@end

@implementation MainController

- (void)loadView {
    [super loadView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"大新野";
    self.tabBarItem.title = @"首页";

    myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-114) style:UITableViewStylePlain];
    myTableView.delegate = self;
    myTableView.dataSource = self;
//    myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    myTableView.backgroundColor = NewViewBack;
    [myTableView registerNib:[UINib nibWithNibName:@"MessageOneCell" bundle:nil] forCellReuseIdentifier:oneMessage];
    [myTableView registerNib:[UINib nibWithNibName:@"MessageTwoCell" bundle:nil] forCellReuseIdentifier:twoCellID];
    //1 去除掉自动布局添加的边距
    myTableView.layoutMargins = UIEdgeInsetsMake(0, 0, 0, 0);
    //2 去掉iOS7的separatorInset边距
    myTableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    myTableView.separatorColor = [UIColor colorWithHexString:@"DCDCDC"];

    self.headView = [MainHeadView ins:^(NSInteger tag) {
        if (tag == 401) {
            SpaceController *space = [[SpaceController alloc]init];
            [space setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:space animated:YES];
        }else if (tag == 402){
            TentingHouseController *tening = [[TentingHouseController alloc]init];
            [tening setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:tening animated:YES];
        }else if (tag == 403){
            SellHouseController *tening = [[SellHouseController alloc]init];
            [tening setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:tening animated:YES];
        }else if (tag == 404){
            ZuCheController *tening = [[ZuCheController alloc]init];
            [tening setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:tening animated:YES];
        }else if (tag == 405){
            PinCheController *pinChe = [[PinCheController alloc]init];
             [pinChe setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:pinChe animated:YES];
        }
        else if (tag == 406){
            WorkController *work = [[WorkController alloc]init];
             [work setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:work animated:YES];
        }
        else if (tag == 407){
            
        }
        else if (tag == 408){
            QiTaController *other = [[QiTaController alloc]init];
             [other setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:other animated:YES];
        }
    }];
    self.headView.frame = CGRectMake(0, 0, WIDTH, 365);
    myTableView.tableHeaderView = self.headView;
    [self.view addSubview:myTableView];
}


#pragma mark - UITableViewDelaget
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row/2 == 0) {
        return 120;
    }
    return 143;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 40)];//创建一个视图
    headerView.backgroundColor = [UIColor clearColor];
    headerView.layer.borderWidth = 0.5;
    headerView.layer.borderColor = [UIColor colorWithHexString:@"DCDCDC"].CGColor;
    UIScrollView *myScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 40)];
    myScroll.backgroundColor = [UIColor whiteColor];
    [myScroll setContentSize:CGSizeMake(WIDTH+20, 40)];
    [myScroll setShowsHorizontalScrollIndicator:NO];
    [headerView addSubview:myScroll];
    NSArray *dataArray = @[@"头条",@"政府",@"教育",@"活动",@"汽车",@"其他"];
    self.btnArray = [[NSMutableArray alloc]init];
    for (int i=0; i<dataArray.count; i++) {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(15+(65*i), 0, 65, 40)];
        btn.backgroundColor = [UIColor whiteColor];
        btn.tag = 600+i;
        btn.font = [UIFont systemFontOfSize:15];
        [btn setTitle:dataArray[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
        if(btn.tag == 600){
            btn.font = [UIFont systemFontOfSize:17];
         [btn setTitleColor:MainNavColor forState:UIControlStateNormal];
        }
        [btn addTarget:self action:@selector(messageAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [myScroll addSubview:btn];
        [self.btnArray addObject:btn];
    }
  
    return headerView;
}

- (void)messageAction:(UIButton *)btn {
    for (int i=0; i<self.btnArray.count; i++) {
        UIButton *btf = self.btnArray[i];
        if (btf.tag == btn.tag) {
             btn.font = [UIFont systemFontOfSize:17];
            [btn setTitleColor:MainNavColor forState:UIControlStateNormal];
        }else {
            UIButton *btt = (UIButton *)[self.view  viewWithTag:btf.tag];
             btt.font = [UIFont systemFontOfSize:15];
            [btt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {

    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 15;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0,WIDTH, 1)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell  * cell = [tableView dequeueReusableCellWithIdentifier:oneCellID];
    if (indexPath.row/2 == 0) {
        MessageTwoCell *cellOne = [tableView dequeueReusableCellWithIdentifier:twoCellID];
        cell = cellOne;
    } else {
        MessageOneCell *mesOne = [tableView dequeueReusableCellWithIdentifier:oneMessage];
        cell = mesOne;
    }
      cell.layoutMargins = UIEdgeInsetsMake(0, 0, 0, 0);
     cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;

}

@end
