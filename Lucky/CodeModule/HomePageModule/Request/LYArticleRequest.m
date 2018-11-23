//
//  LYArticleRequest.m
//  NIMEducationDemo
//
//  Created by 赵良育 on 2017/8/3.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "LYArticleRequest.h"

@interface LYArticleRequest ()<APIManagerApiCallBackDelegate>
@property (nonatomic,copy) void (^loadArticleSuccessBlock)(LYArticleData *data);
@property (nonatomic,copy) void (^loadArticleFailureBlock)();

@end

@implementation LYArticleRequest
- (Class)responseClass
{
    return [LYArticleResponse class];
}

- (NSString *)requestPath
{
    return articleListURL;
}

- (APIManagerRequestType)requestType
{
    return APIManagerRequestTypePost;
}

- (NSDictionary *)paramsForApi:(LYBaseAPIRequest *)request {

    if (request == self) {
        return @{
                 @"category":@"0",
                 @"page":@"1"};
    }
    return nil;
 }

+ (void)loadArticleDataSuccess:(void (^)(LYArticleData *))success failure:(void (^)())failure
{
    LYArticleRequest * request = [[LYArticleRequest alloc]init];
    request.paramSource = (id)request;
    request.delegate = (id)request;
    request.loadArticleSuccessBlock = success;
    request.loadArticleFailureBlock = ^{
        failure();
    };
    [request loadDataWithHUDOnView:kWindow];
}

- (void)managerCallAPIDidSuccess:(LYBaseAPIRequest *)request
{
    if (request==self) {
        LYArticleResponse * articleResponse =(LYArticleResponse *) request.responseData;
        !self.loadArticleSuccessBlock ? : self.loadArticleSuccessBlock(articleResponse.data);
    }

}
- (void)managerCallAPIDidFailed:(LYBaseAPIRequest *)request
{
    if (request==self) {
        !self.loadArticleFailureBlock ? : self.loadArticleFailureBlock();
    }
}

@end


@implementation LYArticleResponse

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"data" : [LYArticleData class]};
}
@end
