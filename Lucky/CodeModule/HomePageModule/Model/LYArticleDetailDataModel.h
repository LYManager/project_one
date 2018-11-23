// LYArticleDetailDataModel.h 
// Lucky 
// 
// Created by 赵良育 on 2018/11/22. 
// Copyright © 2018 赵良育. All rights reserved. 
// 
/**
    类描述
 */


#import <Foundation/Foundation.h>
#import "LYArticleListModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface LYArticleDetailDataModel : NSObject
@property(nonatomic,strong)LYArticleListModel * article;                /**< 文章详情*/
@end

NS_ASSUME_NONNULL_END
