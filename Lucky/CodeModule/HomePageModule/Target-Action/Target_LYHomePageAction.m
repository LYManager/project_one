// LYHomePageAction.m 
// Lucky 
// 
// Created by 赵良育 on 2018/11/20. 
// Copyright © 2018 赵良育. All rights reserved. 
// 

#import "Target_LYHomePageAction.h"
#import "LYArticleDetailViewController.h"

@implementation Target_LYHomePageAction
- (UIViewController *)Action_pushArticleDetailVC:(NSDictionary *)param
{
    LYArticleDetailViewController * articleVC = [LYArticleDetailViewController new];
    return articleVC;
}
@end
