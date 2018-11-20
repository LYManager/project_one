// LYHomeDataResponse.m 
// Lucky 
// 
// Created by 赵良育 on 2018/11/20. 
// Copyright © 2018 赵良育. All rights reserved. 
// 

#import "LYHomeDataResponse.h"
#import "LYArticleListModel.h"
@implementation LYHomeDataResponse
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"data" : [LYHomeDataModel class]};
}
@end


@implementation LYHomeDataModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"article" : [LYHomeArticleModel class]};
}
@end

@implementation LYHomeArticleModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"data" : [LYArticleListModel class]};
}

@end
