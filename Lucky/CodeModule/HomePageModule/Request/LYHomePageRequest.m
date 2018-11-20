// LYHomePageRequest.m 
// Lucky 
// 
// Created by 赵良育 on 2018/11/20. 
// Copyright © 2018 赵良育. All rights reserved. 
// 

#import "LYHomePageRequest.h"

@interface LYHomePageRequest ()<APIManagerParamSourceDelegate>

@end

@implementation LYHomePageRequest
+ (void)requestWithCallBackTarget:(id<APIManagerApiCallBackDelegate>)target
{
    LYHomePageRequest * request = [LYHomePageRequest new];
    request.delegate = target;
    request.paramSource = (id)request;
    [request loadDataWithHUDOnView:kWindow];
}
- (Class)responseClass
{
    return [BaseResponse class];
}

- (NSString *)requestPath
{
    return siteIndexURL;
}

- (APIManagerRequestType)requestType
{
    return APIManagerRequestTypePost;
}

- (NSDictionary *)paramsForApi:(LYBaseAPIRequest *)request
{
    return nil;
}

@end
