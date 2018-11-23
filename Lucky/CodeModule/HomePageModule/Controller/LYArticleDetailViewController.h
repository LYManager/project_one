// LYArticleDetailViewController.h 
// Lucky 
// 
// Created by 赵良育 on 2018/11/20. 
// Copyright © 2018 赵良育. All rights reserved. 
// 
/**
    类描述
 */


#import "LYBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface LYArticleDetailViewController : LYBaseViewController
@property(nonatomic,assign)NSInteger  articleID;                                    /**< 文章id*/
@property(nonatomic,copy)NSString  * linkURL;                                    /**< 外链*/
@end

NS_ASSUME_NONNULL_END
