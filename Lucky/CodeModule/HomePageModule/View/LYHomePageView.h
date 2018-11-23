// LYHomePageView.h 
// Lucky 
// 
// Created by 赵良育 on 2018/11/20. 
// Copyright © 2018 赵良育. All rights reserved. 
// 

#import <UIKit/UIKit.h>
#import "LYHomePageBottomView.h"

NS_ASSUME_NONNULL_BEGIN

@interface LYHomePageView : UIView

- (instancetype)initWithViewTarget:(id<UITableViewDelegate,UITableViewDataSource>)target;

@property(nonatomic,strong)UITableView * tableView;                /**< tableView*/

@property(nonatomic,strong)LYHomePageBottomView * bottomView;                /**< 加个footerView*/
@end

NS_ASSUME_NONNULL_END
