//
//  UserMessageController.m
//  gzSpace
//
//  Created by 智享单车 on 2018/3/7.
//  Copyright © 2018年 智享单车. All rights reserved.
//

#import "UserMessageController.h"
#import "UIColor+YYAdd.h"
#import "SwitchHouseType.h"
static NSString *rovedCellID = @"YDBAppRovedCell";
@interface UserMessageController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *myTab;
@property (nonatomic,strong) SwitchHouseType *switchView;
@end

@implementation UserMessageController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = self.titles;
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"发布" style:UIBarButtonItemStyleDone target:self action:@selector(sendMessage)];
    self.navigationItem.rightBarButtonItem = rightItem;
    //     self.dataArray = [[NSMutableArray alloc]initWithObjects:@{@"出租类型":@"请选择出租类型"},nil];
//    self.dataArray = [[NSMutableArray alloc]initWithObjects:@{@"物品名称":@"请输入物品名称(如:iphonex)"},@{@"新旧程度":@"请输入新旧程度(如:9成新)"},@{@"生产日期":@"请数日产品生产日期"},@{@"价格":@"请输入价格"},@{@"联系人":@"请输入联系人"},@{@"手机":@"请输入手机号"},nil];
    [self addTabView];
}

- (void)sendMessage {
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD showSuccessWithStatus:@"发布成功!"];
}

- (void)addTabView {
    self.myTab = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) style:UITableViewStylePlain];
    self.myTab.dataSource = self;
    self.myTab.delegate = self;
    self.myTab.backgroundColor = NewViewBack;
    [self.myTab setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    [self.view addSubview:self.myTab];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 1)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:rovedCellID];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.font = [UIFont systemFontOfSize:16];
    cell.textLabel.textColor = [UIColor colorWithHexString:@"666666"];
    NSDictionary *dic = self.dataArray[indexPath.row];
    NSString * key = dic.allKeys[0];
    cell.textLabel.text = key;
    
    UITextField *contentTf = [[UITextField alloc]initWithFrame:CGRectMake(WIDTH-220, 0, 200, 60)];
    contentTf.placeholder = dic[key];
    contentTf.textAlignment = NSTextAlignmentRight;
    contentTf.font = [UIFont systemFontOfSize:14];
    [cell addSubview:contentTf];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)viewTouch {
    [self.switchView removeFromSuperview];
}

@end
