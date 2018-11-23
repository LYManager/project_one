//
//  LYArticleRequest.h
//  NIMEducationDemo
//
//  Created by 赵良育 on 2017/8/3.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "LYBaseAPIRequest.h"
#import "LYArticleData.h"
@interface LYArticleRequest : LYBaseAPIRequest<APIManager>
+ (void)loadArticleDataSuccess:(void (^)(LYArticleData *))success failure:(void (^)())failure;
@end


@interface LYArticleResponse : BaseResponse
/** 🐶data    👇*/
@property(nonatomic,strong)LYArticleData * data;

@end
