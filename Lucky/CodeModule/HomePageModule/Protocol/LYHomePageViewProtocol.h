// LYHomePageViewProtocol.h 
// Lucky 
// 
// Created by 赵良育 on 2018/11/19. 
// Copyright © 2018 赵良育. All rights reserved. 
// 

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol LYHomePageViewProtocol <NSObject>

- (void)ly_getHomeDataResponse:(id)response;

- (void)ly_getHomeDataFail:(NSInteger) errorCode des:(NSString *)des;

@end

NS_ASSUME_NONNULL_END
