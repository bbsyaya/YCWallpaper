//
//  YCBaseTabBarController.m
//  YClub
//
//  Created by 岳鹏飞 on 2017/4/28.
//  Copyright © 2017年 岳鹏飞. All rights reserved.
//

#import "YCBaseTabBarController.h"
#import "YCBaseNavigationController.h"
#import "YCMainViewController.h"
#import "YCTypeViewController.h"
#import "NFMenuViewController.h"


@interface YCBaseTabBarController ()

@end

@implementation YCBaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpChildVC];
    [self setUpTabBarItems];
}
#pragma mark - add ChildControllers
- (void)setUpChildVC
{
    YCMainViewController *mainVC = [[YCMainViewController alloc] init];
    YCBaseNavigationController *mainNav = [[YCBaseNavigationController alloc] initWithRootViewController:mainVC];
    
    YCTypeViewController *typeVC = [[YCTypeViewController alloc] init];
    YCBaseNavigationController *typeNav = [[YCBaseNavigationController alloc] initWithRootViewController:typeVC];
    
    NFMenuViewController *thirdVC = [[NFMenuViewController alloc] init];
    YCBaseNavigationController *thirdNav = [[YCBaseNavigationController alloc] initWithRootViewController:thirdVC];
    thirdVC.title = @"我的";
    self.viewControllers = @[mainNav, typeNav, thirdNav];
}
#pragma mark - set TabbarItems
- (void)setUpTabBarItems
{
    NSArray *itemArr            = self.tabBar.items;
    UITabBarItem *firstItem     = [itemArr objectAtIndex:0];
    UITabBarItem *secondItem    = [itemArr objectAtIndex:1];
    UITabBarItem *thirdItem     = [itemArr objectAtIndex:2];
    firstItem.title = @"首页";
    secondItem.title = @"分类";
    firstItem.image = [[UIImage imageNamed:@"yc_main_tabbar_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    firstItem.selectedImage = [[UIImage imageNamed:@"yc_main_tabbar_selete"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    secondItem.image = [[UIImage imageNamed:@"yc_type_tabbar_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    secondItem.selectedImage = [[UIImage imageNamed:@"yc_type_tabbar_selete"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    thirdItem.image = [[UIImage imageNamed:@"yc_my_tabbar_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    thirdItem.selectedImage = [[UIImage imageNamed:@"yc_my_tabbar_selete"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //改变UITabBarItem字体颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:YC_TabBar_SeleteColor} forState:UIControlStateSelected];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:YC_Base_TitleColor} forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
