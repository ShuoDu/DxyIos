//
//  SellHousesController.m
//  gzSpace
//
//  Created by 智享单车 on 2018/3/7.
//  Copyright © 2018年 智享单车. All rights reserved.
//

#import "SellHousesController.h"
#import "UIColor+YYAdd.h"
#import "SwitchHouseType.h"
static NSString *rovedCellID = @"YDBAppRovedCell";
@interface SellHousesController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *myTab;
@property (nonatomic,strong) NSMutableArray *dataArray;
@property (nonatomic,strong) SwitchHouseType *switchView;
@end

@implementation SellHousesController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"房屋出售";
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"发布" style:UIBarButtonItemStyleDone target:self action:@selector(sendMessage)];
    self.navigationItem.rightBarButtonItem = rightItem;
    self.dataArray = [[NSMutableArray alloc]initWithObjects:@{@"身份":@"请选择身份"},@{@"房屋地址":@"请输入房屋具体地址"},@{@"面积":@"请输入房屋具体面积/平米"},@{@"厅室":@"请选择厅室"},@{@"楼层":@"请选择楼层"},@{@"电梯":@"请选择"},@{@"产权类型/年限":@"请选择"},@{@"售价":@"输入价格"},@{@"联系人/性别":@"请输入联系人/性别"},@{@"电话":@"请输入联系人电话"},nil];
    [self addTabView];
}

-(void)sendMessage {
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
    
    UILabel * labContent = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH-220, 0, 200, 60)];
    labContent.textAlignment = NSTextAlignmentRight;
    labContent.textColor =[UIColor colorWithHexString:@"333333"];
    labContent.font = [UIFont systemFontOfSize:14];
    labContent.text = dic[key];
    [cell addSubview:labContent];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        NSLog(@"点我干啥");
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
                 self.dataArray = [[NSMutableArray alloc]initWithObjects:@{@"发布者身份":@"公司"},@{@"公司名称":@"请输入公司名称"},@{@"楼盘名称":@"请输入楼盘名称"},@{@"位置":@"请输入楼盘位置"},@{@"开盘日":@"请输入开盘日期"},@{@"产权类型/年限":@"请选择"},@{@"售价":@"输入价格"},@{@"联系人/性别":@"请输入联系人/性别"},@{@"电话":@"请输入联系人电话"},nil];
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
