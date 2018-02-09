//
//  BuHuoController.m
//  gzSpace
//
//  Created by 智享单车 on 2018/1/22.
//  Copyright © 2018年 智享单车. All rights reserved.
//

#import "BuHuoController.h"
#import "UIColor+YYAdd.h"
#import "BuHuoCell.h"
static NSString *buHuoCellID = @"BuHuoCell";
@interface BuHuoController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *myTable;
@end

@implementation BuHuoController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"需补货";
    [self addConfigView];
}

- (void)addConfigView {
    self.myTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) style:UITableViewStyleGrouped];
    [self.myTable registerNib:[UINib nibWithNibName:@"BuHuoCell" bundle:nil] forCellReuseIdentifier:buHuoCellID];
    self.myTable.backgroundColor = NewViewBack;
    self.myTable.delegate = self;
    self.myTable.dataSource = self;
    [self.view addSubview:self.myTable];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 97;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 30)];//创建一个视图
    headerView.backgroundColor = [UIColor clearColor];
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 200, 30)];
    lab.text = @"肯德基(国贸店)";
    lab.textColor = [UIColor lightGrayColor];
    lab.font = [UIFont systemFontOfSize:14];
    [headerView addSubview:lab];
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.myTable.frame.size.width, 1)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:buHuoCellID];
    return cell;
}



@end
