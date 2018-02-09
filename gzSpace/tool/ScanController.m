//
//  ScanController.m
//  gzSpace
//
//  Created by 智享单车 on 2018/1/22.
//  Copyright © 2018年 智享单车. All rights reserved.
//

#import "ScanController.h"

@interface ScanController ()

@end

@implementation ScanController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"扫一扫";
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
    
}

- (void)backAction {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
