//
//  WorkController.m
//  gzSpace
//
//  Created by 智享单车 on 2018/2/8.
//  Copyright © 2018年 智享单车. All rights reserved.
//

#import "WorkController.h"
#import "NBLScrollTabController.h"
#import "SpaceOneController.h"
#import "MainMessageModel.h"
@interface WorkController ()<NBLScrollTabControllerDelegate>
@property (nonatomic, strong) NBLScrollTabController *scrollTabController;
@property (nonatomic, strong) NSMutableArray *viewControllers;
@property (nonatomic, strong) NSMutableArray *datasArray;

@end

@implementation WorkController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"工作";
    [self loadData:@"工作"];
}

- (void)loadData:(NSString *)type {
    NSDictionary *parm = @{@"type":type};
    NSString *url = [NSString stringWithFormat:@"%@%@",Host,@"main/service_detail_type/"];
    [CYXHttpRequest get:url params:parm success:^(id responseObj) {
        NSMutableArray *dataArray = [NSJSONSerialization JSONObjectWithData:responseObj options:NSJSONReadingMutableLeaves error:nil];
        self.datasArray = [NSMutableArray array];
        for (NSDictionary *data in dataArray) {
            [self.datasArray addObject:data[@"name"]];
        }
        NSLog(@"%@",self.datasArray);
        if (self.datasArray.count>0) {
            [self.view addSubview:self.scrollTabController.view];
        }
    } failure:^(NSError *error) {
    }];
}

- (NBLScrollTabController *)scrollTabController {
    if (!_scrollTabController) {
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
        NSMutableArray *data = [[NSMutableArray alloc]init];
        for (int i=0; i<self.datasArray.count; i++) {
            SpaceOneController *demo0 = [[SpaceOneController alloc] init];
            demo0.type = self.datasArray[i];
            NBLScrollTabItem *demo0Item = [[NBLScrollTabItem alloc] init];
            demo0Item.title = self.datasArray[i];
            
            demo0Item.textColor = [UIColor darkGrayColor];
            demo0Item.highlightColor = MainNavColor;
            demo0Item.hideBadge = YES;//每个title可以做个性化配置
            demo0.tabItem = demo0Item;
            [data addObject:demo0];
        }
        _viewControllers = data;
    }
    return _viewControllers;
}

- (void)tabController:(NBLScrollTabController * __nonnull)tabController didSelectViewController:( UIViewController * __nonnull)viewController {
    //业务逻辑处理
}

@end
