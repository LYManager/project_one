//
//  LYAllArticleDataModel.m
//  NIMEducationDemo
//
//  Created by 赵良育 on 2017/8/3.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "LYAllArticleDataModel.h"

@implementation LYAllArticleDataModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"list" : [LYArticleModel class],
             @"category":[LYArticleCategoryModel class]};
}

@end
