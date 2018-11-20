// LYArticleListModel.m 
// Lucky 
// 
// Created by 赵良育 on 2018/11/20. 
// Copyright © 2018 赵良育. All rights reserved. 
// 

#import "LYArticleListModel.h"
#import "LYArticleCategoryModel.h"
@implementation LYArticleListModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
             @"category":[LYArticleCategoryModel class]
             };
}
@end
