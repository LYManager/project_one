// LYArticleListRequest.h 
// Lucky 
// 
// Created by 赵良育 on 2018/11/23. 
// Copyright © 2018 赵良育. All rights reserved. 
// 
/**
    类描述
 */


#import "LYPageAPIRequest.h"
#import "LYAllArticleDataModel.h"
NS_ASSUME_NONNULL_BEGIN
@protocol LYArticleListDelegate <NSObject>

- (void)loadSuccessWithArticleArray:(NSArray <LYArticleDataModel *>*)dataArray;

@end

@interface LYArticleListRequest : LYPageAPIRequest
/**🐶category    👇*/
@property(nonatomic,assign)NSInteger category_id;
/**🐶delegate    👇*/
@property(nonatomic,weak)id<LYArticleListDelegate> successDelegate;
@end


@interface LYAllArticleResponse : BaseResponse<LYPageDelegate>
/** 🐶lY    👇*/
@property(nonatomic,strong)LYAllArticleDataModel * data;

@end
NS_ASSUME_NONNULL_END
