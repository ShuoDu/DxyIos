//
//  MessageController.m
//  gzSpace
//
//  Created by 智享单车 on 2018/2/8.
//  Copyright © 2018年 智享单车. All rights reserved.
//

#import "MessageController.h"
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
static NSString *oneCellID = @"MainOneCell";
static NSString *twoCellID = @"MainTwoCell";
static NSString *messageOneCellID = @"MessageOneCell";
@interface MessageController()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *myTableView;
}
@property(nonatomic,strong)MainHeadView *headView;
@end

@implementation MessageController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"大新野";
    self.tabBarItem.title = @"首页";
    //    UIBarButtonItem *left = [[UIBarButtonItem alloc]initWithTitle:@"北京市" style:UIBarButtonItemStylePlain target:self action:nil];
    //    self.navigationItem.leftBarButtonItem = left;
    //    UIBarButtonItem * right = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"message"] style:(UIBarButtonItemStylePlain) target:nil action:nil];
    //    self.navigationItem.rightBarButtonItem = right;
    myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-114) style:UITableViewStylePlain];
    myTableView.delegate = self;
    myTableView.dataSource = self;
    myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    myTableView.backgroundColor = NewViewBack;
    [myTableView registerNib:[UINib nibWithNibName:@"MessageOneCell" bundle:nil] forCellReuseIdentifier:messageOneCellID];
    [myTableView registerNib:[UINib nibWithNibName:@"MainTwoCell" bundle:nil] forCellReuseIdentifier:twoCellID];
 
    [self.view addSubview:myTableView];
}


#pragma mark - UITableViewDelaget
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 15;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 0)];//创建一个视图
    headerView.backgroundColor = [UIColor clearColor];

    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 0;
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
        MessageOneCell *cellOne = [tableView dequeueReusableCellWithIdentifier:messageOneCellID];
        cell = cellOne;
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}


@end
