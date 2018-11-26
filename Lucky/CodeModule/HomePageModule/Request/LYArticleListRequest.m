// LYArticleListRequest.m 
// Lucky 
// 
// Created by 赵良育 on 2018/11/23. 
// Copyright © 2018 赵良育. All rights reserved. 
// 

#import "LYArticleListRequest.h"

@implementation LYArticleListRequest
- (Class)responseClass
{
    return [LYAllArticleResponse class];
}

- (NSString *)requestPath
{
    return articleListURL;
}

- (APIManagerRequestType)requestType
{
    return APIManagerRequestTypePost;
}

- (NSDictionary *)reformParamsForApi:(NSDictionary *)params
{
    NSMutableDictionary *newParmas = params?[params mutableCopy]:[NSMutableDictionary dictionary];
    [newParmas setObject:[NSNumber numberWithInteger:self.currentPage] forKey:@"page"];
    [newParmas setObject:[NSNumber numberWithInteger:self.category_id] forKey:@"category"];
    return newParmas;
    
}
- (NSDictionary *)paramsForApi:(LYBaseAPIRequest *)request {
    return nil;
}

@end
@implementation LYAllArticleResponse
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"data" : [LYAllArticleDataModel class]};
}

- (NSArray *)buildPageArray
{
    return self.data.list.data;
}

@end
