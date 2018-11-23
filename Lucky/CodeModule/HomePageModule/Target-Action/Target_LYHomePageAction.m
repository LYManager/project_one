// LYHomePageAction.m 
// Lucky 
// 
// Created by 赵良育 on 2018/11/20. 
// Copyright © 2018 赵良育. All rights reserved. 
// 

#import "Target_LYHomePageAction.h"
#import "LYArticleDetailViewController.h"
#import "LYArticleMainViewController.h"
@implementation Target_LYHomePageAction
- (UIViewController *)Action_pushArticleDetailVC:(NSDictionary *)param
{
    LYArticleDetailViewController * articleVC = [LYArticleDetailViewController new];
    articleVC.articleID = [param[@"articleID"] integerValue];

    return articleVC;
}

- (UIViewController *)Action_pushToolsDetailVC:(NSDictionary *)param
{
    LYArticleDetailViewController * articleVC = [LYArticleDetailViewController new];
    articleVC.linkURL = param[@"linkURL"];

    return articleVC;
}



- (UIViewController *)Action_pushMoreArticleVC:(NSDictionary *)param
{
    LYArticleMainViewController * articleMainVC = [LYArticleMainViewController new];
    
    return articleMainVC;
}
@end
