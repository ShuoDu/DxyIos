//
//  OrderController.m
//  gzSpace
//
//  Created by 智享单车 on 2018/1/22.
//  Copyright © 2018年 智享单车. All rights reserved.
//

#import "OrderController.h"
#import "OrderOneCell.h"
#import "NBLScrollTabController.h"
#import "OrderOneController.h"
@interface OrderController ()<NBLScrollTabControllerDelegate>
@property(nonatomic,strong)UITableView  *myTable;
@property (nonatomic, strong) NBLScrollTabController *scrollTabController;
@property (nonatomic, strong) NSArray *viewControllers;
@end

@implementation OrderController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"订单";
    [self.view addSubview:self.scrollTabController.view];
//    [self addConfigView];
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


- (NSArray *)viewControllers
{
    if (!_viewControllers) {
        OrderOneController *demo0 = [[OrderOneController alloc] init];
        NBLScrollTabItem *demo0Item = [[NBLScrollTabItem alloc] init];
        demo0Item.title = @"已下单";
        demo0Item.textColor = [UIColor darkGrayColor];
        demo0Item.highlightColor = MainNavColor;
        demo0Item.hideBadge = YES;//每个title可以做个性化配置
        demo0.tabItem = demo0Item;
        
        OrderOneController *demo1 = [[OrderOneController alloc] init];
        NBLScrollTabItem *demo1Item = [[NBLScrollTabItem alloc] init];
        demo1Item.title = @"待发货";
        demo1Item.textColor = [UIColor darkGrayColor];
        demo1Item.highlightColor = MainNavColor;
        demo1Item.hideBadge = YES;//每个title可以做个性化配置
        demo1.tabItem = demo1Item;
        
        OrderOneController *demo2 = [[OrderOneController alloc] init];
        NBLScrollTabItem *demo2Item = [[NBLScrollTabItem alloc] init];
        demo2Item.title = @"待收货";
        demo2Item.textColor = [UIColor darkGrayColor];
        demo2Item.highlightColor = MainNavColor;
        demo2Item.hideBadge = YES;//每个title可以做个性化配置
        demo2.tabItem = demo2Item;
        OrderOneController *demo3 = [[OrderOneController alloc] init];
        NBLScrollTabItem *demo3Item = [[NBLScrollTabItem alloc] init];
        demo3Item.title = @"待评价";
        demo3Item.textColor = [UIColor darkGrayColor];
        demo3Item.highlightColor = MainNavColor;
        demo3Item.hideBadge = YES;//每个title可以做个性化配置
        demo3.tabItem = demo3Item;
        _viewControllers = @[demo0, demo1, demo2, demo3];
    }
    return _viewControllers;
}
- (void)tabController:(NBLScrollTabController * __nonnull)tabController didSelectViewController:( UIViewController * __nonnull)viewController {
    //业务逻辑处理
}


@end
