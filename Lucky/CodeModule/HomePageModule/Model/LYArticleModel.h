//
//  LYArticleModel.h
//  NIMEducationDemo
//
//  Created by 赵良育 on 2017/8/1.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LYArticleCategoryModel.h"
//@interface LYArticleAuthorMessageModel : NSObject
///**🐶头像地址    👇*/
//@property(nonatomic,copy)NSString *  avatar;
///**🐶昵称    👇*/
//@property(nonatomic,copy)NSString *  nickname;
///**🐶图像    👇*/
//@property(nonatomic,copy)NSString *  photo;
///** 🐶role    👇*/
////@property(nonatomic,strong)NSArray<NSString *> * role;
///**🐶姓别 0女 1男    👇*/
//@property(nonatomic,assign)NSInteger sex;
///**🐶签名    👇*/
//@property(nonatomic,copy)NSString *  sign;
///** 🐶技能    👇*/
//@property(nonatomic,strong)NSArray * skillfuls;   //
///**🐶职称    👇*/
//@property(nonatomic,copy)NSString *  title;
//@end



@interface LYArticleDataModel : NSObject
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

/**🐶自己计算后的attributeString    👇*/
@property(nonatomic,strong)NSAttributedString *  attributeContent;
@end



@interface LYArticleModel : NSObject
/**🐶currentPage    👇*/
@property(nonatomic,assign)NSInteger current_page;
/**🐶last_Page    👇*/
@property(nonatomic,assign)NSInteger last_page;
/**🐶perPage    👇*/
@property(nonatomic,assign)NSInteger per_page;
/**🐶total    👇*/
@property(nonatomic,assign)NSInteger total;
/**🐶data    👇*/
@property(nonatomic,strong)NSArray *data;

@end
