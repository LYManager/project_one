// LYHomePagePresenter.h 
// Lucky 
// 
// Created by 赵良育 on 2018/11/19. 
// Copyright © 2018 赵良育. All rights reserved. 
// 
/**
    类描述
 */


#import "LYHttpPresenter.h"
//#import "LYHomePageViewProtocol.h"
#import "LYHomePageRequest.h"
#import "LYHomePageView.h"
NS_ASSUME_NONNULL_BEGIN
@interface LYHomePagePresenter : LYHttpPresenter<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong,readonly)LYHomePageView * homePageView;                /**< homePageView*/

/**
 构建UI
 */
- (void)configUI;

@end

NS_ASSUME_NONNULL_END
