//
//  GzTabBarViewController.m
//  GzCustomTabbar
//
//  Created by Dushuo on 2017/11/26.
//  Copyright © 2016年. All rights reserved.

#define BACKGROUND_IMAGE (__bridge id)[UIImage imageNamed:@"application_bg"].CGImage
#import "GzTabBarViewController.h"
#import "MainController.h"
#import "OrderController.h"
#import "MeController.h"
#import "SpaceController.h"
#import "StoreController.h"
#import "ToolController.h"
@interface GzTabBarViewController ()
@end

@implementation GzTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    MainController *viewController0 = [[MainController alloc] init];
    UINavigationController * mainNav = [[UINavigationController alloc]initWithRootViewController:viewController0];
    
//    SpaceController *viewController1 = [[SpaceController alloc] init];
//    UINavigationController * gzNav = [[UINavigationController alloc]initWithRootViewController:viewController1];
    
    UIViewController *viewController2= [[UIViewController alloc] init];
    viewController2.view.backgroundColor = [UIColor whiteColor];

    
//    StoreController *viewController3 = [[StoreController alloc] init];
//    UINavigationController * storeNav = [[UINavigationController alloc]initWithRootViewController:viewController3];
    
    MeController *viewController4 = [[MeController alloc] init];
    UINavigationController * meNav = [[UINavigationController alloc]initWithRootViewController:viewController4];
    self.viewControllers = @[mainNav,viewController2,meNav];
    
    [self setupTabBar];
    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
    //添加阴影
    self.tabBar.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    self.tabBar.layer.shadowOffset = CGSizeMake(0, -5);
    self.tabBar.layer.shadowOpacity = 0.3;
}

- (void)setupTabBar {
    
    [UITabBar appearance].translucent = NO;
    
    [self.viewControllers enumerateObjectsUsingBlock:^(UIViewController *obj, NSUInteger idx, BOOL *stop) {
        
        switch (idx) {
            case 0:{
                obj.tabBarItem.image = [[UIImage imageNamed:@"main_noselect"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                obj.tabBarItem.selectedImage = [[UIImage imageNamed:@"main"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                obj.tabBarItem.title=@"首页";
            } break;
//            case 1:{
//                obj.tabBarItem.image = [[UIImage imageNamed:@"space"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//                obj.tabBarItem.selectedImage = [[UIImage imageNamed:@"space_select"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//                obj.tabBarItem.title=@"格子铺";
//
//            } break;
            case 1:{
                obj.tabBarItem.enabled=NO;
                obj.tabBarItem.title=@"";
                
            } break;
//            case 3:{
//                obj.tabBarItem.image = [[UIImage imageNamed:@"space"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//                obj.tabBarItem.selectedImage = [[UIImage imageNamed:@"space_select"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//                obj.tabBarItem.title=@"发现";
//
//            } break;
            case 2:{
                obj.tabBarItem.image = [[UIImage imageNamed:@"me_noselect"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                obj.tabBarItem.selectedImage = [[UIImage imageNamed:@"me"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                obj.tabBarItem.title=@"我的";
           
            } break;
           
            default:
                break;
        }
    }];
    
    //修改文字颜色
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[[UIColor blackColor] colorWithAlphaComponent:0.5], NSForegroundColorAttributeName,nil] forState:UIControlStateNormal];
    UIColor *titleHighlightedColor = [UIColor darkGrayColor];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys: titleHighlightedColor, NSForegroundColorAttributeName,nil] forState:UIControlStateSelected];
    self.customSelectViews  = [[NSMutableArray alloc] init];
    for(UIView *UITabBarButton in self.tabBar.subviews) {
        if ([@"UITabBarButton" isEqualToString:NSStringFromClass([UITabBarButton class])]) {
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(UITabBarButton.frame.origin.x+UITabBarButton.frame.size.width/2-5, UITabBarButton.frame.origin.y+UITabBarButton.frame.size.height-5, 10, 5)];
            imageView.image = [UIImage imageNamed:@"main_point"];
            [self.tabBar addSubview:imageView];
            [self.customSelectViews addObject:imageView];
        }
    }

    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2-37.5 , -15, 75, 75)];
    button.layer.cornerRadius = 37.5;
    button.layer.masksToBounds = YES;
    [button setBackgroundColor:[UIColor whiteColor]];
    button.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [button setImage:[UIImage imageNamed:@"camera"] forState:UIControlStateNormal];
    [self.tabBar addSubview:button];
    [self.tabBar bringSubviewToFront:button];
    [button addTarget:self action:@selector(addTool) forControlEvents:UIControlEventTouchUpInside];
}

- (void)addTool {
    ToolController *tool = [[ToolController alloc]init];
    [self presentViewController:tool animated:YES completion:nil];

}

@end
