// LYURLCommon.h 
// Lucky 
// 
// Created by 赵良育 on 2018/11/20. 
// Copyright © 2018 赵良育. All rights reserved. 
// 
/**
    类描述
 */


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface LYURLCommon : NSObject

UIKIT_EXTERN  NSString * const BaseUrl;                 // 域名

UIKIT_EXTERN NSString * const ToolsBaseURL;       // 工具域名


UIKIT_EXTERN NSString * const siteIndexURL;   // 首页

UIKIT_EXTERN NSString * const todayLuckURL; // 今日运势

UIKIT_EXTERN NSString * const articleListURL; //文章

UIKIT_EXTERN NSString * const loginURL;  // 登录

UIKIT_EXTERN NSString * const phoneRegisterURL;  // 手机注册

UIKIT_EXTERN NSString * const protocolURL;  // 协议

UIKIT_EXTERN NSString * const aboutUsURL; // 关于我们

UIKIT_EXTERN NSString * const userDetailURL; //  （用户）详情
@end

NS_ASSUME_NONNULL_END
