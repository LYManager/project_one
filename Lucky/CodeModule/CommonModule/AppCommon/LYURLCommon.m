// LYURLCommon.m 
// Lucky 
// 
// Created by 赵良育 on 2018/11/20. 
// Copyright © 2018 赵良育. All rights reserved. 
// 

#import "LYURLCommon.h"

@implementation LYURLCommon
#ifdef DEBUG
NSString * const ToolsBaseURL = @"https://clienttest.geaving.com/#/";   // 工具域名
NSString * const BaseUrl = @"https://test.geaving.com/api/";   // 域名
#else
NSString * const ToolsBaseURL = @"https://client.geaving.com/#/";   // 工具域名
NSString * const BaseUrl = @"https://apiv2.geaving.com/api/";   // 域名
#endif

NSString * const siteIndexURL = @"site/index";   // 首页

NSString * const todayLuckURL = @"yunshi/getByUser"; // 今日运势

NSString * const articleListURL = @"article/getList"; //文章

NSString * const articleDetailURL = @"article/getView"; //文章详情

NSString * const baZiPaiPanURL = @"bzpp";
NSString * const liuRenQiKeURL = @"lrpp";
NSString * const xuanKongFeiXingURL = @"xkfx";
NSString * const liuBoQiGuaURL = @"lyqg";
NSString * const qiMenDunJiaURL = @"qmdj";
NSString * const ziWeiDouShuURL = @"zwds";
NSString * const taLuoURL = @"manual-list/253";
NSString * const jieMengURL = @"jm-search/520";  // 解梦

@end
