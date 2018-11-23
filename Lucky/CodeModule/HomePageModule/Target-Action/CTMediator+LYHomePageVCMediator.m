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
NSString *const kHomePushToolDetailAction = @"pushToolsDetailVC";

@implementation CTMediator (LYHomePageVCMediator)
- (UIViewController *)articleDetailViewController:(NSDictionary *)param
{
    UIViewController *viewController = [self performTarget:kHomeTarget action:kHomePushArticleDetailAction params:param shouldCacheTarget:NO];
    return [LYJudgeVCTool judgeVc:viewController];
}

- (UIViewController *)toolDetailViewController:(NSDictionary *)param
{
    UIViewController *viewController = [self performTarget:kHomeTarget action:kHomePushToolDetailAction params:param shouldCacheTarget:NO];
    return [LYJudgeVCTool judgeVc:viewController];
}
@end
