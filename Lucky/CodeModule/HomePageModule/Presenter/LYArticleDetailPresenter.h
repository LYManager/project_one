// LYArticleDetailPresenter.h 
// Lucky 
// 
// Created by 赵良育 on 2018/11/22. 
// Copyright © 2018 赵良育. All rights reserved. 
// 
/**
    类描述
 */


#import "LYHttpPresenter.h"
#import "LYArticleDetailView.h"
#import "LYArticleDetailRequest.h"
NS_ASSUME_NONNULL_BEGIN

@interface LYArticleDetailPresenter<T> : LYHttpPresenter<T><WKUIDelegate,WKNavigationDelegate>
@property(nonatomic,assign)WebDetailType webType;                  /**< 初始化时候赋值*/
@property(nonatomic,strong,readonly)LYArticleDetailView * detailView;
/**
 加载数据

 @param htmlString 文本
 */
- (void) loadDataWithHtmlString:(NSString *)htmlString;

/**
 加载外链

 @param urlString 外链
 */
- (void) loadLinkWithURLString:(NSString *)urlString;
@end

NS_ASSUME_NONNULL_END
