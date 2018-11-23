// LYArticleDetailDataModel.m 
// Lucky 
// 
// Created by 赵良育 on 2018/11/22. 
// Copyright © 2018 赵良育. All rights reserved. 
// 

#import "LYArticleDetailDataModel.h"

@implementation LYArticleDetailDataModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"article" : [LYArticleListModel class]
             };
}

@end
