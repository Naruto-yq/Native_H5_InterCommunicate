//
//  MainTabBarController.m
//  Native_H5_InterCommunicate
//
//  Created by 余钦 on 16/3/22.
//  Copyright © 2016年 cmbfae Co.,Ltd. All rights reserved.
//

#import "MainTabBarController.h"
#import "HomeViewController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self SetupSubviews];
}

- (void)SetupSubviews
{
    NSArray *titleArray = @[@"首页", @"产品", @"资产"];
    NSArray *imageArray = @[@"home", @"earth", @"cart"];
    NSArray *selectedImageArray = @[@"homeH", @"earthH", @"cartH"];
    
    HomeViewController *homeVc = [[HomeViewController alloc]init];

    UIViewController *vc2 = [[UIViewController alloc]init];
    vc2.view.backgroundColor = [UIColor greenColor];
    UIViewController *vc3 = [[UIViewController alloc]init];
    vc3.view.backgroundColor = [UIColor redColor];
    NSArray *vcArray = @[homeVc, vc2, vc3];
    for (int nIndex = 0; nIndex < titleArray.count; nIndex++) {
        UIViewController *vc = vcArray[nIndex];
        vc.title = titleArray[nIndex];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"homeH"];
        self.tabBarItem.image = [UIImage imageNamed:imageArray[nIndex]];
        //self.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageArray[nIndex]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
        [self addChildViewController:nav];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
