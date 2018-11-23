//
//  LYArticleData.m
//  NIMEducationDemo
//
//  Created by 赵良育 on 2017/8/3.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "LYArticleData.h"

@implementation LYArticleData
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"list" : [LYArticleModel class],
             @"category":[LYArticleCategoryModel class]};
}
@end
