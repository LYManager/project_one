// LYArticleDetailRequest.h 
// Lucky 
// 
// Created by 赵良育 on 2018/11/22. 
// Copyright © 2018 赵良育. All rights reserved. 
// 
/**
    类描述
 */


#import "LYBaseAPIRequest.h"
#import "LYArticleDetailDataModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface LYArticleDetailRequest : LYBaseAPIRequest<APIManager>
+ (void)requestWithParam:(NSDictionary *)param callBackTarget:(id<APIManagerApiCallBackDelegate>)target;
@end


@interface LYArticleDetailResponse : BaseResponse
/** 🐶data    👇*/
@property(nonatomic,strong)LYArticleDetailDataModel * data;

@end

NS_ASSUME_NONNULL_END
