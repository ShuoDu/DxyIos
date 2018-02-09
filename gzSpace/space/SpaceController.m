//
//  SpaceController.m
//  gzSpace
//
//  Created by 智享单车 on 2017/12/12.
//  Copyright © 2017年 智享单车. All rights reserved.
//

#import "SpaceController.h"
#import "NBLScrollTabController.h"
#import "SpaceOneController.h"
@interface SpaceController () <NBLScrollTabControllerDelegate>
@property (nonatomic,strong)UISearchBar *searchBar;
@property (nonatomic, strong) NBLScrollTabController *scrollTabController;
@property (nonatomic, strong) NSArray *viewControllers;
@end

@implementation SpaceController

//- (void) viewWillDisappear:(BOOL)animated {
//    [self.searchBar removeFromSuperview];
//}
//
//- (void) viewWillAppear:(BOOL)animated {
//    self.searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(100, 14,210, 12)];
//    self.searchBar.placeholder = @"搜索您要找的店铺或商品";
//    //一下代码为修改placeholder字体的颜色和大小
//    UITextField * searchField = [self.searchBar valueForKey:@"_searchField"];
//    [searchField setValue:[UIFont boldSystemFontOfSize:13] forKeyPath:@"_placeholderLabel.font"];
//    self.searchBar.backgroundColor = [UIColor clearColor];
//    self.searchBar.showsCancelButton = NO;
//    self.searchBar.backgroundColor =[UIColor colorWithRed:255/255.0 green:100/255.0 blue:59/255.0 alpha:1];
//    [self.navigationController.navigationBar addSubview:self.searchBar];
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"餐厅";
    [self.view addSubview:self.scrollTabController.view];
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
        demo0Item.title = @"中餐厅";
        demo0Item.textColor = [UIColor darkGrayColor];
        demo0Item.highlightColor = MainNavColor;
        demo0Item.hideBadge = YES;//每个title可以做个性化配置
        demo0.tabItem = demo0Item;
        
        SpaceOneController *demo1 = [[SpaceOneController alloc] init];
        NBLScrollTabItem *demo1Item = [[NBLScrollTabItem alloc] init];
        demo1Item.title = @"小吃";
        demo1Item.textColor = [UIColor darkGrayColor];
        demo1Item.highlightColor = MainNavColor;
        demo1Item.hideBadge = YES;//每个title可以做个性化配置
        demo1.tabItem = demo1Item;
        
        SpaceOneController *demo2 = [[SpaceOneController alloc] init];
        NBLScrollTabItem *demo2Item = [[NBLScrollTabItem alloc] init];
        demo2Item.title = @"西餐";
        demo2Item.textColor = [UIColor darkGrayColor];
        demo2Item.highlightColor = MainNavColor;
        demo2Item.hideBadge = YES;//每个title可以做个性化配置
        demo2.tabItem = demo2Item;
        
        SpaceOneController *demo3 = [[SpaceOneController alloc] init];
        NBLScrollTabItem *demo3Item = [[NBLScrollTabItem alloc] init];
        demo3Item.title = @"奶茶/咖啡";
        demo3Item.textColor = [UIColor darkGrayColor];
        demo3Item.highlightColor = MainNavColor;
        demo3Item.hideBadge = YES;//每个title可以做个性化配置
        demo3.tabItem = demo3Item;
        _viewControllers = @[demo0, demo1, demo2, demo3];
        
        SpaceOneController *demo4 = [[SpaceOneController alloc] init];
        NBLScrollTabItem *demo4Item = [[NBLScrollTabItem alloc] init];
        demo4Item.title = @"其他";
        demo4Item.textColor = [UIColor darkGrayColor];
        demo4Item.highlightColor = MainNavColor;
        demo4Item.hideBadge = YES;//每个title可以做个性化配置
        demo4.tabItem = demo4Item;
        _viewControllers = @[demo0, demo1, demo2, demo3,demo4];
    }
    return _viewControllers;
}

- (void)tabController:(NBLScrollTabController * __nonnull)tabController didSelectViewController:( UIViewController * __nonnull)viewController {
    //业务逻辑处理
}




@end
