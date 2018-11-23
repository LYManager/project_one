// LYArticleListView.h 
// Lucky 
// 
// Created by 赵良育 on 2018/11/23. 
// Copyright © 2018 赵良育. All rights reserved. 
// 

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LYArticleListView : UIView
- (instancetype)initWithViewTarget:(id<UITableViewDelegate,UITableViewDataSource>)target;

@property(nonatomic,strong)UITableView * tableView;                /**< tableView*/
@end

NS_ASSUME_NONNULL_END
