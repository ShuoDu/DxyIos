//
//  MainController.m
//  gzSpace
//
//  Created by 智享单车 on 2017/12/11.
//  Copyright © 2017年 智享单车. All rights reserved.
//

#import "MainController.h"
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
#import "MessageTwoCell.h"
#import "MainMessageModel.h"
#import "ChannelTags.h"
#import "Channel.h"
static NSString *oneCellID = @"MainOneCell";
static NSString *twoCellID = @"MessageTwoCell";
static NSString *oneMessage = @"MessageOneCell";
@interface MainController ()<UITableViewDelegate,UITableViewDataSource> {
    UITableView *myTableView;
    __block NSMutableArray *_myTags;
    __block NSMutableArray *_recommandTags;
}
@property (nonatomic, strong)MainHeadView *headView;
@property (nonatomic, strong)NSMutableArray *btnArray;
@property (nonatomic, strong)NSMutableArray *dataArray;
@end

@implementation MainController

- (void)loadView {
    [super loadView];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"大新野";
    self.tabBarItem.title = @"首页";
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"服务标签" style:UIBarButtonItemStyleDone target:self action:@selector(addTagView)];
    self.navigationItem.rightBarButtonItem = rightItem;
    [self addTableView];
    [self addTagView];
    
}

- (void) addTagView {
    _myTags = @[@"租房",@"卖房",@"餐饮",@"拼购",@"拼车",@"租车",@"活动",@"汽修",@"家政",@"辅导班",@"工作",@"二手",@"彩票",@"诊所",@"宠物医院",@"兴趣班",@"停车位",@"特卖",@"美食"].mutableCopy;
    _recommandTags = @[@"育婴",@"农机",@"化肥",@"手机通讯",@"旅行社",@"代卖",@"代购",@"跑腿",@"快递",@"超市",@"宠物",@"装修",@"五金百货",@"开锁",@"维修"].mutableCopy;
    //秀出来选择框
    ChannelTags *controller = [[ChannelTags alloc]initWithMyTags:_myTags andRecommandTags:_recommandTags];
    [self presentViewController:controller animated:YES completion:^{}];
    
    //所有的已选的tags
    __block  NSMutableString *_str = @"已选：\n".mutableCopy;
    controller.choosedTags = ^(NSArray *chooseTags, NSArray *recommandTags) {
        _myTags = @[].mutableCopy;
        _recommandTags = @[].mutableCopy;
        for (Channel *mod in recommandTags) {
            [_recommandTags addObject:mod.title];
        }
        for (Channel *mod in chooseTags) {
            [_myTags addObject:mod.title];
            [_str appendString:mod.title];
            [_str appendString:@"、"];
        }
        [[NSUserDefaults standardUserDefaults] setObject:_str forKey:@"selectTag"];
    };
    
    //单选tag
    controller.selectedTag = ^(Channel *channel) {
        [_str appendString:channel.title];
        [[NSUserDefaults standardUserDefaults] setObject:_str forKey:@"selectTag"];
    };
}

- (void) addTableView {
    myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-114) style:UITableViewStylePlain];
    myTableView.delegate = self;
    myTableView.dataSource = self;
    //    myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    myTableView.backgroundColor = NewViewBack;
    [myTableView registerNib:[UINib nibWithNibName:@"MessageOneCell" bundle:nil] forCellReuseIdentifier:oneMessage];
    [myTableView registerNib:[UINib nibWithNibName:@"MessageTwoCell" bundle:nil] forCellReuseIdentifier:twoCellID];
    //1 去除掉自动布局添加的边距
    myTableView.layoutMargins = UIEdgeInsetsMake(0, 0, 0, 0);
    //2 去掉iOS7的separatorInset边距
    myTableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    myTableView.separatorColor = [UIColor colorWithHexString:@"DCDCDC"];
    
    self.headView = [MainHeadView ins:^(NSInteger tag) {
        if (tag == 401) {
            SpaceController *space = [[SpaceController alloc]init];
            [space setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:space animated:YES];
        }else if (tag == 402){
            TentingHouseController *tening = [[TentingHouseController alloc]init];
            [tening setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:tening animated:YES];
        }else if (tag == 403){
            SellHouseController *tening = [[SellHouseController alloc]init];
            [tening setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:tening animated:YES];
        }else if (tag == 404){
            ZuCheController *tening = [[ZuCheController alloc]init];
            [tening setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:tening animated:YES];
        }else if (tag == 405){
            PinCheController *pinChe = [[PinCheController alloc]init];
            [pinChe setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:pinChe animated:YES];
        }
        else if (tag == 406){
            WorkController *work = [[WorkController alloc]init];
            [work setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:work animated:YES];
        }
        else if (tag == 407){
            
        }
        else if (tag == 408){
            QiTaController *other = [[QiTaController alloc]init];
            [other setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:other animated:YES];
        }
    }];
    self.headView.frame = CGRectMake(0, 0, WIDTH, 365);
    myTableView.tableHeaderView = self.headView;
    [self.view addSubview:myTableView];
    [self loadData:@"头条"];
}

- (void)loadData:(NSString *)type {
    NSDictionary *parm = @{@"type":type};
    NSString *url = @"http://192.168.200.93:8080/main/type_mesage/";
    [CYXHttpRequest get:url params:parm success:^(id responseObj) {
        NSMutableArray *dataArray = [NSJSONSerialization JSONObjectWithData:responseObj options:NSJSONReadingMutableLeaves error:nil];
        [self.dataArray removeAllObjects];
        self.dataArray=[NSMutableArray array];
        for (NSDictionary *dict in dataArray) {
            MainMessageModel *messageModel = [MainMessageModel yy_modelWithDictionary:dict];
            [self.dataArray addObject:messageModel];
        }
        [myTableView reloadData];
    } failure:^(NSError *error) {
    }];
}

#pragma mark - UITableViewDelaget
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row/2 == 0) {
        return 120;
    }
    return 143;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 40)];//创建一个视图
    headerView.backgroundColor = [UIColor clearColor];
    headerView.layer.borderWidth = 0.5;
    headerView.layer.borderColor = [UIColor colorWithHexString:@"DCDCDC"].CGColor;
    UIScrollView *myScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 40)];
    myScroll.backgroundColor = [UIColor whiteColor];
    [myScroll setContentSize:CGSizeMake(WIDTH+20, 40)];
    [myScroll setShowsHorizontalScrollIndicator:NO];
    [headerView addSubview:myScroll];
    NSArray *dataArray = @[@"头条",@"政府",@"教育",@"活动",@"汽车",@"其他"];
    self.btnArray = [[NSMutableArray alloc]init];
    for (int i=0; i<dataArray.count; i++) {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(15+(65*i), 0, 65, 40)];
        btn.backgroundColor = [UIColor whiteColor];
        btn.tag = 600+i;
        btn.font = [UIFont systemFontOfSize:15];
        [btn setTitle:dataArray[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
        if(btn.tag == 600){
            btn.font = [UIFont systemFontOfSize:17];
         [btn setTitleColor:MainNavColor forState:UIControlStateNormal];
        }
        [btn addTarget:self action:@selector(messageAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [myScroll addSubview:btn];
        [self.btnArray addObject:btn];
    }
    return headerView;
}

- (void)messageAction:(UIButton *)btn {
    for (int i=0; i<self.btnArray.count; i++) {
        UIButton *btf = self.btnArray[i];
        if (btf.tag == btn.tag) {
             [self loadData:btn.titleLabel.text];
             btn.font = [UIFont systemFontOfSize:17];
            [btn setTitleColor:MainNavColor forState:UIControlStateNormal];
      
        }else {
            UIButton *btt = (UIButton *)[self.view  viewWithTag:btf.tag];
             btt.font = [UIFont systemFontOfSize:15];
            [btt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {

    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 15;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0,WIDTH, 1)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MainMessageModel *model = self.dataArray[indexPath.row];
    UITableViewCell  * cell = [tableView dequeueReusableCellWithIdentifier:oneCellID];
    if (indexPath.row/2 == 0) {
        MessageTwoCell *cellOne = [tableView dequeueReusableCellWithIdentifier:twoCellID];
        [cellOne loadData:model];
        cell = cellOne;
    } else {
        MessageOneCell *mesOne = [tableView dequeueReusableCellWithIdentifier:oneMessage];
        [mesOne loadData:model];
        cell = mesOne;
    }
     cell.layoutMargins = UIEdgeInsetsMake(0, 0, 0, 0);
     cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;

}

@end
