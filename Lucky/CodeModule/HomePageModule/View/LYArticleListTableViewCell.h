// LYArticleListTableViewCell.h 
// Lucky 
// 
// Created by 赵良育 on 2018/11/22. 
// Copyright © 2018 赵良育. All rights reserved. 
// 

#import <UIKit/UIKit.h>

UIKIT_EXTERN NSString * const kArticleListCellIdentifier;   /**< 重用f标识*/

NS_ASSUME_NONNULL_BEGIN

@interface LYArticleListTableViewCell : UITableViewCell
@property(nonatomic,strong)UIImageView * articleImageView;                /**< 文章图片*/
@property(nonatomic,strong)UILabel * articleTitleLabel;                /**< 文章标题*/
@property(nonatomic,strong)UILabel * articleDesLabel;                /**< 简介*/
@end

NS_ASSUME_NONNULL_END
