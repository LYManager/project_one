// LYArticleListPresenter.h 
// Lucky 
// 
// Created by 赵良育 on 2018/11/23. 
// Copyright © 2018 赵良育. All rights reserved. 
// 
/**
    类描述
 */


#import "LYHttpPresenter.h"
#import "LYArticleListView.h"
#import "LYArticleListRequest.h"
NS_ASSUME_NONNULL_BEGIN

@interface LYArticleListPresenter : LYHttpPresenter<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong,readonly)LYArticleListView * articleListView;                /**< listView*/
@property(nonatomic,assign)NSInteger category_id;                  /**< 文章分类id*/
/**
 构建UI
 */
- (void)configUI;

@end

NS_ASSUME_NONNULL_END
