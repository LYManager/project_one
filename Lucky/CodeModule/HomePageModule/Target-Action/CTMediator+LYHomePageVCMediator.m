// CTMediator+LYHomePageViewTarget.m 
// Lucky 
// 
// Created by 赵良育 on 2018/11/20. 
// Copyright © 2018 赵良育. All rights reserved. 
// 

#import "CTMediator+LYHomePageVCMediator.h"
#import "LYJudgeVCTool.h"
NSString *const kHomeTarget = @"LYHomePageAction";
NSString *const kHomePushArticleDetailAction = @"pushArticleDetailVC";

@implementation CTMediator (LYHomePageVCMediator)
- (UIViewController *)articleDetailViewController
{
    UIViewController *viewController = [self performTarget:kHomeTarget action:kHomePushArticleDetailAction params:nil shouldCacheTarget:NO];
    return [LYJudgeVCTool judgeVc:viewController];
}
@end
