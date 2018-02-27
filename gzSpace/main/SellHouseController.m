//
//  SellHouseController.m
//  gzSpace
//
//  Created by 智享单车 on 2018/2/7.
//  Copyright © 2018年 智享单车. All rights reserved.
//

#import "SellHouseController.h"
#import "NBLScrollTabController.h"
#import "SpaceOneController.h"
#import "MainMessageModel.h"

@interface SellHouseController ()<NBLScrollTabControllerDelegate>
@property (nonatomic, strong) NBLScrollTabController *scrollTabController;
@property (nonatomic, strong) NSArray *viewControllers;
@end

@implementation SellHouseController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"卖房";
    [self.view addSubview:self.scrollTabController.view];
}

- (void)loadData {
    NSDictionary *parm = @{@"type":@"5"};
    NSString *url = @"http://127.0.0.1:8080/main/type_mesage/";
    [CYXHttpRequest get:url params:parm success:^(id responseObj) {
        NSMutableArray *dataArray = [NSJSONSerialization JSONObjectWithData:responseObj options:NSJSONReadingMutableLeaves error:nil];
        for (NSDictionary *dict in dataArray) {
            MainMessageModel *messageModel = [MainMessageModel yy_modelWithDictionary:dict];
        }
    } failure:^(NSError *error) {
    }];
}

- (NBLScrollTabController *)scrollTabController {
    if (!_scrollTabController) {
        //                NBLScrollTabTheme *theme = [[NBLScrollTabTheme alloc] init];
        //                theme.titleViewHeight = 80;
        //                theme.badgeViewColor = [UIColor greenColor];
        //                theme.titleViewBGColor = [UIColor blackColor];
        //                theme.indicatorViewColor = [UIColor greenColor];
        //                theme.titleFont = [UIFont systemFontOfSize:20];
        //                theme.titleColor = [UIColor yellowColor];
        //                theme.highlightColor = [UIColor greenColor];
        //                _scrollTabController = [[NBLScrollTabController alloc] initWithTabTheme:theme];
        _scrollTabController = [[NBLScrollTabController alloc] init];
        _scrollTabController.view.frame =  CGRectMake(0, 0, WIDTH, HEIGHT);
        //        _scrollTabController.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _scrollTabController.delegate = self;
        _scrollTabController.viewControllers = self.viewControllers;
    }
    return _scrollTabController;
}


- (NSArray *)viewControllers {
    if (!_viewControllers) {
        SpaceOneController *demo0 = [[SpaceOneController alloc] init];
        NBLScrollTabItem *demo0Item = [[NBLScrollTabItem alloc] init];
        demo0Item.title = @"二手房";
        demo0Item.textColor = [UIColor darkGrayColor];
        demo0Item.highlightColor = MainNavColor;
        demo0Item.hideBadge = YES;//每个title可以做个性化配置
        demo0.tabItem = demo0Item;
        
        SpaceOneController *demo1 = [[SpaceOneController alloc] init];
        NBLScrollTabItem *demo1Item = [[NBLScrollTabItem alloc] init];
        demo1Item.title = @"新盘";
        demo1Item.textColor = [UIColor darkGrayColor];
        demo1Item.highlightColor = MainNavColor;
        demo1Item.hideBadge = YES;//每个title可以做个性化配置
        demo1.tabItem = demo1Item;
        
        SpaceOneController *demo2 = [[SpaceOneController alloc] init];
        NBLScrollTabItem *demo2Item = [[NBLScrollTabItem alloc] init];
        demo2Item.title = @"商铺";
        demo2Item.textColor = [UIColor darkGrayColor];
        demo2Item.highlightColor = MainNavColor;
        demo2Item.hideBadge = YES;//每个title可以做个性化配置
        demo2.tabItem = demo2Item;
        
        SpaceOneController *demo3 = [[SpaceOneController alloc] init];
        NBLScrollTabItem *demo3Item = [[NBLScrollTabItem alloc] init];
        demo3Item.title = @"厂房";
        demo3Item.textColor = [UIColor darkGrayColor];
        demo3Item.highlightColor = MainNavColor;
        demo3Item.hideBadge = YES;//每个title可以做个性化配置
        demo3.tabItem = demo3Item;
        _viewControllers = @[demo0, demo1, demo2, demo3];
        
        SpaceOneController *demo4 = [[SpaceOneController alloc] init];
        NBLScrollTabItem *demo4Item = [[NBLScrollTabItem alloc] init];
        demo4Item.title = @"仓库";
        demo4Item.textColor = [UIColor darkGrayColor];
        demo4Item.highlightColor = MainNavColor;
        demo4Item.hideBadge = YES;//每个title可以做个性化配置
        demo4.tabItem = demo4Item;
        
        SpaceOneController *demo5 = [[SpaceOneController alloc] init];
        NBLScrollTabItem *demo5Item = [[NBLScrollTabItem alloc] init];
        demo5Item.title = @"其他";
        demo5Item.textColor = [UIColor darkGrayColor];
        demo5Item.highlightColor = MainNavColor;
        demo5Item.hideBadge = YES;//每个title可以做个性化配置
        demo5.tabItem = demo5Item;
        _viewControllers = @[demo0, demo1, demo2, demo3,demo4,demo5];
    }
    return _viewControllers;
}

- (void)tabController:(NBLScrollTabController * __nonnull)tabController didSelectViewController:( UIViewController * __nonnull)viewController {
    //业务逻辑处理
}

@end
