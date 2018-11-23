// LYHomePageBottomView.h 
// Lucky 
// 
// Created by 赵良育 on 2018/11/23. 
// Copyright © 2018 赵良育. All rights reserved. 
// 

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol LYHomePageBottomViewDelegate <NSObject>

- (void) moreArticle;

@end

@interface LYHomePageBottomView : UIView
@property(nonatomic,weak)id<LYHomePageBottomViewDelegate> delegate;        /**< delegate*/
@end

NS_ASSUME_NONNULL_END
