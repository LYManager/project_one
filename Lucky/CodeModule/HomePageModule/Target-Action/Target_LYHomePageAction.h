// LYHomePageAction.h 
// Lucky 
// 
// Created by 赵良育 on 2018/11/20. 
// Copyright © 2018 赵良育. All rights reserved. 
// 
/**
    类描述
 */


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Target_LYHomePageAction : NSObject
- (UIViewController *)Action_pushArticleDetailVC:(NSDictionary *)param;

- (UIViewController *)Action_pushToolsDetailVC:(NSDictionary *)param;


- (UIViewController *)Action_pushMoreArticleVC:(NSDictionary *)param;

@end

NS_ASSUME_NONNULL_END
