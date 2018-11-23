// CTMediator+LYHomePageViewTarget.h 
// Lucky 
// 
// Created by 赵良育 on 2018/11/20. 
// Copyright © 2018 赵良育. All rights reserved. 
// 

#import "CTMediator.h"

NS_ASSUME_NONNULL_BEGIN

@interface CTMediator (LYHomePageVCMediator)
- (UIViewController *)articleDetailViewController:(NSDictionary *)param;

- (UIViewController *)toolDetailViewController:(NSDictionary *)param;


- (UIViewController *)moreArticleViewController:(NSDictionary *)param;

@end

NS_ASSUME_NONNULL_END
