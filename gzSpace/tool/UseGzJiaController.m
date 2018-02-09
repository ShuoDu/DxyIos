//
//  UseGzJiaController.m
//  gzSpace
//
//  Created by 智享单车 on 2018/1/22.
//  Copyright © 2018年 智享单车. All rights reserved.
//

#import "UseGzJiaController.h"
#import "UIColor+YYAdd.h"
static NSString *detailCellID = @"YDBAboutUsCell";
@interface UseGzJiaController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *myTable;
@property(nonatomic,copy)NSArray *dataArray;
@end

@implementation UseGzJiaController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"格子架";
    self.dataArray = [[NSMutableArray alloc]initWithObjects:@{@"店铺":@"请输入店铺名称"},@{@"店铺类型":@"请选择店铺类型"},@{@"可用面积":@"请输入可用面积"},@{@"格子架":@"请选择格子架样式"},@{@"格子架数量":@"请选择需用格子架数量"},@{@"联系方式":@"请输入联系方式"},nil];
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
    //    myTableView.backgroundColor =  [UIColor colorWithRed:213/255.0 green:25/255.0 blue:16/255.0 alpha:1];
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
   
    UIButton *pay = [[UIButton alloc]initWithFrame:CGRectMake(10, 5, WIDTH-20, 50)];
    pay.backgroundColor = [UIColor orangeColor];
    [pay addTarget:self action:@selector(payAction) forControlEvents:UIControlEventTouchUpInside];
    [pay setTitle:@"立即提交" forState:UIControlStateNormal];
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
