//
//  BaseController.m
//  gzSpace
//
//  Created by 智享单车 on 2017/12/11.
//  Copyright © 2017年 智享单车. All rights reserved.
//

#import "BaseController.h"

@interface BaseController ()
{
    float _lastPosition;
    float currentPostion;
    float stopPosition;
    float lhAlpha;
}
@end

@implementation BaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    _lastPosition = 0;
    stopPosition = 0;
    lhAlpha = 1;
    [[NSUserDefaults standardUserDefaults]setObject:@"1" forKey:@"first"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:213/255.0 green:25/255.0 blue:16/255.0 alpha:1];
    self.navigationController.navigationBar.barTintColor = MainNavColor;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    //消除阴影
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    NSDictionary * dict = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:UITextAttributeTextColor];
    self.navigationController.navigationBar.titleTextAttributes = dict;
    self.view.backgroundColor = NewViewBack;
    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc] init];
    backButtonItem.title =@"返回";
    self.navigationItem.backBarButtonItem = backButtonItem;
    

    
}

@end
