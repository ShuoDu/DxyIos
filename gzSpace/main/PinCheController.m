//
//  PinCheController.m
//  gzSpace
//
//  Created by 智享单车 on 2018/2/8.
//  Copyright © 2018年 智享单车. All rights reserved.
//

#import "PinCheController.h"
#import "PinCheHeadController.h"
#import "UIColor+YYAdd.h"
#import "MainOneCell.h"
#import "PinCheHeadView.h"
static NSString *oneCellID = @"MainOneCell";
static NSString *twoCellID = @"MainTwoCell";

@interface PinCheController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *myTable;
@end

@implementation PinCheController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"拼车";
    self.myTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-64) style:UITableViewStylePlain];
     self.myTable.delegate = self;
     self.myTable.dataSource = self;
     self.myTable.separatorStyle = UITableViewCellSeparatorStyleNone;
     self.myTable.backgroundColor = NewViewBack;
    [ self.myTable registerNib:[UINib nibWithNibName:@"MainOneCell" bundle:nil] forCellReuseIdentifier:oneCellID];
    [ self.myTable registerNib:[UINib nibWithNibName:@"MainTwoCell" bundle:nil] forCellReuseIdentifier:twoCellID];
    PinCheHeadView *head = [PinCheHeadView ins:^(NSInteger tag) {
    }];
    [self.myTable setTableHeaderView:head];
    [self.view addSubview:self.myTable];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 20)];//创建一个视图
    headerView.backgroundColor = [UIColor whiteColor];
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 15;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0,WIDTH, 1)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

//
////返回每组头部view
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//
//    UIView *headerView = [[UIView alloc]init];
//    headerView.backgroundColor = [UIColor colorWithRed:213/255.0 green:25/255.0 blue:16/255.0 alpha:1];
//    UILabel *label = [[UILabel alloc]init];
//    label.textColor = [UIColor whiteColor];
//    label.font = [UIFont systemFontOfSize:13];
//    label.frame = CGRectMake(15, 0, self.view.frame.size.width-30, 40);
//    label.textAlignment = NSTextAlignmentCenter;
//    [headerView addSubview:label];
//
//    if(section == 0) {
//
//        label.text = @"------ 人气店铺 ------";
//
//
//    }else if (section == 1) {
//        label.text = @"------ 产品首体验 ------";
//    }
//    else{
//
//        label.text = @"------ 人气商品 ------";
//
//    }
//
//    return headerView;
//
//}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell  * cell = [tableView dequeueReusableCellWithIdentifier:oneCellID];
    if (indexPath.section == 0) {
        MainOneCell *cellOne = [tableView dequeueReusableCellWithIdentifier:oneCellID];
        cell = cellOne;
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}

@end
