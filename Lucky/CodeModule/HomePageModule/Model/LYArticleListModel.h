// LYArticleListModel.h 
// Lucky 
// 
// Created by 赵良育 on 2018/11/20. 
// Copyright © 2018 赵良育. All rights reserved. 
// 
/**
    类描述
 */


#import <Foundation/Foundation.h>
@class LYArticleCategoryModel;
NS_ASSUME_NONNULL_BEGIN

@interface LYArticleListModel : NSObject
/**🐶内容    👇*/
@property(nonatomic,copy)NSString *  content;
/**🐶评论数    👇*/
@property(nonatomic,assign)NSInteger comment_count;
/**🐶title_pic    👇*/
@property(nonatomic,copy)NSString *  title_pic;
/**🐶articleID    👇*/
@property(nonatomic,assign)NSInteger  article_id;
/**🐶article_category_id    👇*/
//@property(nonatomic,copy)NSString *  article_category_id;
/**🐶作者    👇*/
@property(nonatomic,copy)NSString *  author;
/**🐶粉丝    👇*/
@property(nonatomic,assign)NSInteger favorite_count;
/**🐶用户id    👇*/
@property(nonatomic,assign)NSInteger user_id;
/**🐶标题    👇*/
@property(nonatomic,copy)NSString *  title;
/**🐶查看数    👇*/
@property(nonatomic,assign)NSInteger view_count;
/**🐶描述    👇*/
@property(nonatomic,copy)NSString *  summary;
/**🐶时间    👇*/
@property(nonatomic,copy)NSString *  ctime;
/**🐶状态    👇*/
@property(nonatomic,assign)NSInteger status;
/**🐶good_count    👇*/
@property(nonatomic,assign)NSInteger good_count;
/**🐶分享的地址    👇*/
@property(nonatomic,copy)NSString *  share_url;
/** 🐶category    👇*/
@property(nonatomic,strong)LYArticleCategoryModel * category;

- (NSAttributedString *) ly_getAttributeSummary;
@end

NS_ASSUME_NONNULL_END
