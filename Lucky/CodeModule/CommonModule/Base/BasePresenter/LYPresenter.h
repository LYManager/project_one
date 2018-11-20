// LYPresenter.h 
// Lucky 
// 
// Created by 赵良育 on 2018/11/19. 
// Copyright © 2018 赵良育. All rights reserved. 
// 
/**
    基础presenter
 */


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LYPresenter<T>: NSObject
@property(nonatomic,weak,readonly)T view;        /**< 绑定的控制器*/

/**
 初始化

 @param view 绑定的view
 @return 实例
 */
- (instancetype)initWithView:(T)view;


/**
 绑定view

 @param view 绑定的view
 */
- (void)attachView:(T)view;

/**
 解绑view

 @param view 解绑的View
 */
- (void)detachView:(T)view;


- (instancetype)init NS_UNAVAILABLE;
- (instancetype) new NS_UNAVAILABLE;
@end

NS_ASSUME_NONNULL_END
