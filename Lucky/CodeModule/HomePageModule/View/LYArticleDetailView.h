// LYArticleDetailView.h 
// Lucky 
// 
// Created by 赵良育 on 2018/11/22. 
// Copyright © 2018 赵良育. All rights reserved. 
// 

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

typedef NS_ENUM(NSUInteger,WebDetailType)
{
    WebDetailType_HTML,    // html文本
    WebDetailType_HTTPURL  // 外链
};

NS_ASSUME_NONNULL_BEGIN

@interface LYArticleDetailView : UIView

/**
 初始化方法

 @param frame 大小
 @param webType 加载的类型
 @return 实例
 */
- (instancetype)initWithFrame:(CGRect)frame webDetailType:(WebDetailType)webType;

@property(nonatomic,strong)WKWebView * webView;                /**< webView*/

@property(nonatomic,strong)UITextView * textView;                /**< 换textView*/

@end

NS_ASSUME_NONNULL_END
