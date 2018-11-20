// LYHttpResponseHandle.h 
// Lucky 
// 
// Created by 赵良育 on 2018/11/19. 
// Copyright © 2018 赵良育. All rights reserved. 
// 

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol LYHttpResponseHandle <NSObject>
/**
 响应成功
 
 @param responseObject 返回的数据
 */
- (void)onSuccess:(id)responseObject;

/**
 响应失败
 
 @param clientInfo 返回的数据
 @param errCode    业务错误码
 @param errInfo    错误信息
 */
- (void)onFail:(id)clientInfo
       errCode:(NSInteger)errCode
       errInfo:(NSString *)errInfo;
@end

NS_ASSUME_NONNULL_END
