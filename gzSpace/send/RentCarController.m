//
//  RentCarController.m
//  gzSpace
//
//  Created by 智享单车 on 2018/3/7.
//  Copyright © 2018年 智享单车. All rights reserved.
//

#import "RentCarController.h"
#import "UIColor+YYAdd.h"
#import "SwitchHouseType.h"
static NSString *rovedCellID = @"YDBAppRovedCell";
@interface RentCarController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *myTab;
@property (nonatomic,strong) NSMutableArray *dataArray;
@property (nonatomic,strong) SwitchHouseType *switchView;
@end

@implementation RentCarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title  = @"汽车出租";
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"发布" style:UIBarButtonItemStyleDone target:self action:@selector(sendMessage)];
    self.navigationItem.rightBarButtonItem = rightItem;
    self.dataArray = [[NSMutableArray alloc]initWithObjects:@{@"身份":@"请选择身份"},@{@"汽车类别":@"请输入类别(如:家用轿车)"},@{@"汽车品牌/型号":@"请输入品牌(如:大众/帕萨特)"},@{@"区域":@"请输入服务区域(如:南阳市内)"},@{@"价格":@"请输入价格(如:200/天)"},@{@"联系人":@"至少两字"},@{@"电话":@"请输入联系人手机号"},nil];
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
    if (indexPath.row == 0) {
        UILabel * labContent = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH-220, 0, 200, 60)];
        labContent.textAlignment = NSTextAlignmentRight;
        labContent.textColor =[UIColor lightGrayColor];
        labContent.font = [UIFont systemFontOfSize:14];
        labContent.text = dic[key];
        [cell addSubview:labContent];
    } else {
        UITextField *contentTf = [[UITextField alloc]initWithFrame:CGRectMake(WIDTH-220, 0, 200, 60)];
        contentTf.placeholder = dic[key];
        contentTf.textAlignment = NSTextAlignmentRight;
        contentTf.font = [UIFont systemFontOfSize:14];
        [cell addSubview:contentTf];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        self.switchView = [SwitchHouseType insWithCallback:^(NSInteger tag){
            if (tag == 001) {
                [self.dataArray removeObjectAtIndex:0];
                [self.dataArray insertObject:@{@"发布者身份":@"个人"} atIndex:0];
                [self.myTab reloadData];
            } else if (tag == 002) {
                [self.dataArray removeObjectAtIndex:0];
                [self.dataArray insertObject:@{@"发布者身份":@"中介"} atIndex:0];
                [self.myTab reloadData];
            } else if (tag == 003) {
                [self.dataArray removeObjectAtIndex:0];
                [self.dataArray insertObject:@{@"发布者身份":@"公司"} atIndex:0];
                [self.dataArray insertObject:@{@"公司名称":@"请输入公司名称"} atIndex:2];
                [self.myTab reloadData];
            }
        }];
        self.switchView.title.text = @"身份选择";
        [self.switchView.one setTitle:@"个人" forState:UIControlStateNormal];
        [self.switchView.two setTitle:@"中介" forState:UIControlStateNormal];
        [self.switchView.three setTitle:@"公司" forState:UIControlStateNormal];
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(viewTouch)];
        [self.switchView addGestureRecognizer:tapGesture];
        self.switchView.frame = [UIScreen mainScreen].bounds;
        [self.view addSubview:self.switchView];
    }
}

- (void)viewTouch {
    [self.switchView removeFromSuperview];
}

@end
