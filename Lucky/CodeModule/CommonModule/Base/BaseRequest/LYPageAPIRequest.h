// LYPageAPIRequest.h 
// Lucky 
// 
// Created by 赵良育 on 2018/11/20. 
// Copyright © 2018 赵良育. All rights reserved. 
// 
/**
    类描述
 */


#import "LYBaseAPIRequest.h"
NS_ASSUME_NONNULL_BEGIN

@protocol LYPageDelegate <NSObject>
@required
- (NSArray *)buildPageArray;
@end


@interface LYPageAPIRequest : LYBaseAPIRequest <APIManager>

/**
 *  当前页数
 */
@property (nonatomic, assign) NSUInteger                currentPage;
/**🐶id    👇*/
@property(nonatomic,assign)NSUInteger                   load_id;

/**
 *  最终结果
 */
@property (nonatomic, strong) NSMutableArray*           listArray;
/**
 *  是否还有数据，只要有数据返回，就认为还有下一页
 */
@property (nonatomic, assign) BOOL                      moreData;

/**
 *  清空listArray，currentPage = 1
 */
- (void)reload;

/**
 *  清空listArray，currentPage = 1
 */
- (void)reloadOnView:(UIView *)view;

- (void) reloadOnView:(UIView *)view page:(NSInteger)page;

/**
 *  每页多少条数据，默认20
 */
- (NSUInteger)pageSize;

@end


NS_ASSUME_NONNULL_END
