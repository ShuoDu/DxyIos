//
//  UseGzController.m
//  gzSpace
//
//  Created by 智享单车 on 2018/1/22.
//  Copyright © 2018年 智享单车. All rights reserved.
//

#import "UseGzController.h"
#import "UIColor+YYAdd.h"
static NSString *detailCellID = @"YDBAboutUsCell";
@interface UseGzController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *myTable;
@property(nonatomic,copy)NSArray *dataArray;
@end

@implementation UseGzController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"用格子";
     self.dataArray = [[NSMutableArray alloc]initWithObjects:@{@"店铺":@"请选择店铺"},@{@"格子架":@"请选择格子架"},@{@"格子号":@"请选择格子号"},@{@"开始日期":@"请选择日期"},@{@"结束日期":@"请选择结束日期"}, nil];
    self.navigationController.navigationBar.barTintColor = MainNavColor;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    //消除阴影
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    NSDictionary * dict = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:UITextAttributeTextColor];
    self.navigationController.navigationBar.titleTextAttributes = dict;
    self.view.backgroundColor = [UIColor colorWithRed:235/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithTitle:@"<返回" style:UIBarButtonItemStyleDone target:self action:@selector(backAction)];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    self.myTable = [[UITableView alloc]initWithFrame:CGRectMake(0,0, WIDTH,HEIGHT-60)];
    self.myTable.delegate = self;
    self.myTable.dataSource = self;
    self.myTable.backgroundColor=NewViewBack;
    self.myTable.scrollEnabled = YES;
    [self.view addSubview:self.myTable];
    [self addBottomView];
}

- (void)backAction {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)addBottomView {
    UIView *bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT-self.navigationController.navigationBar.frame.size.height-80, WIDTH, 60)];
    bottomView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bottomView];
    UILabel *money = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, 200, 60)];
    money.text = @"¥200元";
    money.font = [UIFont systemFontOfSize:18];
    money.textColor = [UIColor orangeColor];
    [bottomView addSubview:money];
    UIButton *pay = [[UIButton alloc]initWithFrame:CGRectMake(WIDTH-150, 0, 150, 60)];
    pay.backgroundColor = [UIColor orangeColor];
    [pay addTarget:self action:@selector(payAction) forControlEvents:UIControlEventTouchUpInside];
    [pay setTitle:@"立即支付" forState:UIControlStateNormal];
    [bottomView addSubview:pay];
}
- (void)payAction {
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
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


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:detailCellID];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    cell.textLabel.textColor = [UIColor colorWithHexString:@"666666"];
    NSDictionary *dic = self.dataArray[indexPath.row];
    NSString * key = dic.allKeys[0];
    cell.textLabel.text = key;
    
    UITextField * fieldContent = [[UITextField alloc] initWithFrame:CGRectMake(WIDTH-120, 0, 100, 55)];
    fieldContent.textAlignment = NSTextAlignmentRight;
    fieldContent.textColor =[UIColor colorWithHexString:@"333333"];
    fieldContent.font = [UIFont systemFontOfSize:14];
    fieldContent.placeholder = dic[key];
    [cell addSubview:fieldContent];
    return cell;
}


@end
