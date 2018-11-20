// LYHttpPresenter.h 
// Lucky 
// 
// Created by 赵良育 on 2018/11/19. 
// Copyright © 2018 赵良育. All rights reserved. 
// 
/**
    类描述
 */


#import "LYPresenter.h"
#import "LYHttpResponseHandle.h"
NS_ASSUME_NONNULL_BEGIN

@interface LYHttpPresenter<T> : LYPresenter<T> <LYHttpResponseHandle>
- (void) loadRequestWithParams:(nullable NSDictionary *)params;
@end

NS_ASSUME_NONNULL_END
