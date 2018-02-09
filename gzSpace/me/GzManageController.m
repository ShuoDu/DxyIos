//
//  GzManageController.m
//  gzSpace
//
//  Created by 智享单车 on 2018/1/22.
//  Copyright © 2018年 智享单车. All rights reserved.
//

#import "GzManageController.h"
#import "UIColor+YYAdd.h"
#import "GzManageCell.h"
static NSString *gzCellID = @"GzManageCell";
@interface GzManageController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *myTable;
@end

@implementation GzManageController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"格子管理";
    [self addConfigView];
}

- (void)addConfigView {
    self.myTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) style:UITableViewStyleGrouped];
    [self.myTable registerNib:[UINib nibWithNibName:@"GzManageCell" bundle:nil] forCellReuseIdentifier:gzCellID];
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
    return 128;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 50)];//创建一个视图
    headerView.backgroundColor = [UIColor clearColor];
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 200, 50)];
    lab.text = @"肯德基(国贸店)";
    lab.textColor = [UIColor lightGrayColor];
    lab.font = [UIFont systemFontOfSize:14];
    [headerView addSubview:lab];
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50;
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
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:gzCellID];
    return cell;
}


@end
