// LYHomeDataResponse.h 
// Lucky 
// 
// Created by 赵良育 on 2018/11/20. 
// Copyright © 2018 赵良育. All rights reserved. 
// 
/**
    类描述
 */


#import "LYBaseAPIResponse.h"

NS_ASSUME_NONNULL_BEGIN
@class LYHomeDataModel;
@class LYHomeArticleModel;

@interface LYHomeDataResponse : BaseResponse
@property(nonatomic,strong)LYHomeDataModel * data;                /**< data*/
@end

@interface LYHomeDataModel : NSObject
@property(nonatomic,strong)LYHomeArticleModel * article;                /**< 文章数据*/
@end

@interface LYHomeArticleModel : NSObject
@property(nonatomic,strong)NSArray * data;                /**< 文章列表*/
@property(nonatomic,assign)NSInteger current_page;                  /**< 当前页*/
@property(nonatomic,assign)NSInteger * per_page;                /**< 每页多少*/
@property(nonatomic,assign)NSInteger * total;                /**< 总共*/
@end

NS_ASSUME_NONNULL_END
