//
//  SpaceOneController.m
//  gzSpace
//
//  Created by 智享单车 on 2018/1/24.
//  Copyright © 2018年 智享单车. All rights reserved.
//

#import "SpaceOneController.h"
#import "MainOneCell.h"
#import "SpaceDetailController.h"
static NSString *oneCellID = @"MainOneCell";
@interface SpaceOneController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *myTableView;
}

@end

@implementation SpaceOneController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addConfigView];
    [self loadData];
}

- (void)loadData {
    NSString *url = @"http://127.0.0.1:8080/store/list/";
    [CYXHttpRequest get:url params:nil success:^(id responseObj) {
        NSMutableArray *dataArray = [NSJSONSerialization JSONObjectWithData:responseObj options:NSJSONReadingMutableLeaves error:nil];
        for (NSDictionary *dict in dataArray) {
            NSString *imgRootUrl = @"http://127.0.0.1:8080";
            NSString *imgUrl = [imgRootUrl stringByAppendingString:dict[@"store_img"]];
            NSLog(@"%@",imgUrl);
        }
        DLog(@"%@",dataArray);
    } failure:^(NSError *error) {
        
    }];
}

- (void)addConfigView {
    UIBarButtonItem *left = [[UIBarButtonItem alloc]initWithTitle:@"格子铺" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.leftBarButtonItem = left;
    
    UIBarButtonItem * right = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"shopping_car"] style:(UIBarButtonItemStylePlain) target:nil action:nil];
    self.navigationItem.rightBarButtonItem = right;
    
    self.view.backgroundColor=[UIColor colorWithRed:235/255.0
                                              green:240/255.0
                                               blue:240/255.0
                                              alpha:1.0];
    
    myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-104)];
    myTableView.delegate = self;
    myTableView.dataSource = self;
    myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    myTableView.backgroundColor = NewViewBack;
    [myTableView registerNib:[UINib nibWithNibName:@"MainOneCell" bundle:nil] forCellReuseIdentifier:oneCellID];
    [self.view addSubview:myTableView];
    self.view.backgroundColor = NewViewBack;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SpaceDetailController *spaceDetail  = [[SpaceDetailController alloc]init];
    spaceDetail.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:spaceDetail animated:YES];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MainOneCell *cellOne = [tableView dequeueReusableCellWithIdentifier:oneCellID];
    cellOne.backgroundColor = NewViewBack;
    return cellOne;
}


@end
