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

UIKIT_EXTERN NSString * const articleDetailURL; // 文章详情

UIKIT_EXTERN NSString * const baZiPaiPanURL;
UIKIT_EXTERN NSString * const liuRenQiKeURL;
UIKIT_EXTERN NSString * const xuanKongFeiXingURL;
UIKIT_EXTERN NSString * const liuBoQiGuaURL;
UIKIT_EXTERN NSString * const qiMenDunJiaURL;
UIKIT_EXTERN NSString * const ziWeiDouShuURL;
UIKIT_EXTERN NSString * const taLuoURL;
UIKIT_EXTERN NSString * const jieMengURL;
@end

NS_ASSUME_NONNULL_END
