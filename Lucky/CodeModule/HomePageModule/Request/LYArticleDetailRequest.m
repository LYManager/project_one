// LYArticleDetailRequest.m 
// Lucky 
// 
// Created by 赵良育 on 2018/11/22. 
// Copyright © 2018 赵良育. All rights reserved. 
// 

#import "LYArticleDetailRequest.h"

@interface LYArticleDetailRequest ()<APIManagerParamSourceDelegate>
@property(nonatomic,strong)NSDictionary * param;                /**< 参数*/
@end

@implementation LYArticleDetailRequest
+ (void)requestWithParam:(NSDictionary *)param callBackTarget:(id<APIManagerApiCallBackDelegate>)target
{
    LYArticleDetailRequest * request = [LYArticleDetailRequest new];
    request.delegate = target;
    request.paramSource = (id)request;
    request.param = param;
    [request loadDataWithHUDOnView:kWindow];
}
- (Class)responseClass
{
    return [LYArticleDetailResponse class];
}

- (NSString *)requestPath
{
    return articleDetailURL;
}

- (APIManagerRequestType)requestType
{
    return APIManagerRequestTypePost;
}

- (NSDictionary *)paramsForApi:(LYBaseAPIRequest *)request
{
    return self.param;
}
@end


@implementation LYArticleDetailResponse

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"data" : [LYArticleDetailDataModel class]};
}
@end
