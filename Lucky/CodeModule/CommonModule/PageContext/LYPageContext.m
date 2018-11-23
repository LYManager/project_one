// LYPageContext.m 
// Lucky 
// 
// Created by 赵良育 on 2018/11/22. 
// Copyright © 2018 赵良育. All rights reserved. 
// 

#import "LYPageContext.h"
#import "LYBaseNavigationViewController.h"
#import "LYBaseTabBarController.h"
#import "LYHomePageViewController.h"
#import "LYToolsViewController.h"
@implementation LYPageContext
+ (instancetype)shareInstance
{
    static LYPageContext *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[LYPageContext alloc] init];
    });
    return instance;
}

- (void)setupMainViewController
{
    LYHomePageViewController * appVC = [[LYHomePageViewController alloc]init];
    LYBaseNavigationViewController * homeNavc = [[LYBaseNavigationViewController alloc]initWithRootViewController:appVC];
    
    LYToolsViewController * appVC1 = [[LYToolsViewController alloc]init];
    LYBaseNavigationViewController * homeNavc1 = [[LYBaseNavigationViewController alloc]initWithRootViewController:appVC1];
    
    
    LYBaseTabBarController * tabBarVC = [LYBaseTabBarController new];
    tabBarVC.viewControllers = @[homeNavc,homeNavc1];
    [self setTabBarItems:tabBarVC];
    [UIApplication sharedApplication].keyWindow.rootViewController = tabBarVC;
}

- (void)setTabBarItems:(UITabBarController*)tabBarVC
{
    NSArray *titles = @[@"文章", @"测算"]; // ,@"课程"
    NSArray *highlightImages = @[@"article_selected", @"ask_selected"]; //,@"course_no_selected"
    NSArray *normalImages  = @[@"article_no_selected",  @"ask_no_selected"]; //@"course_selected",
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] =LYRGBColor(123,123, 123);
    
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName] =LYRGBColor(213,170, 115);
    
    [tabBarVC.tabBar.items enumerateObjectsUsingBlock:^(UITabBarItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.title = titles[idx];
        obj.image = [[UIImage imageNamed:normalImages[idx]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        obj.selectedImage = [[UIImage imageNamed:highlightImages[idx]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        [obj setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
        [obj setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];

        
    }];
}

- (UIImage *)scaleImageToSize:(UIImage* )img size:(CGSize)size
{
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    [img drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}


@end
