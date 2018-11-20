// LYHomePageRequest.h 
// Lucky 
// 
// Created by 赵良育 on 2018/11/20. 
// Copyright © 2018 赵良育. All rights reserved. 
// 
/**
    首页的数据请求类
 */


#import "LYBaseAPIRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface LYHomePageRequest : LYBaseAPIRequest<APIManager>
+ (void)requestWithCallBackTarget:(id<APIManagerApiCallBackDelegate>)target;
@end

NS_ASSUME_NONNULL_END
