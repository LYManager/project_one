// LYArticleDetailView.m 
// Lucky 
// 
// Created by 赵良育 on 2018/11/22. 
// Copyright © 2018 赵良育. All rights reserved. 
// 

#import "LYArticleDetailView.h"

@interface LYArticleDetailView ()
@property(nonatomic,assign)WebDetailType webType;                  /**< 类型*/
@end

@implementation LYArticleDetailView
- (instancetype)initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame webDetailType:WebDetailType_HTTPURL];
}

- (instancetype)initWithFrame:(CGRect)frame webDetailType:(WebDetailType)webType
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configUIWithType:webType];
    }
    return self;
}


- (void) configUIWithType:(WebDetailType)webType
{
    _webType = webType;
    switch (webType) {
        case WebDetailType_HTTPURL:
        {
            _webView = ({
                WKWebView * webView = [[WKWebView alloc]initWithFrame:CGRectZero];
                webView;
            });
            [self addSubview:_webView];
        }
            break;
        case WebDetailType_HTML:
        {
            _textView = ({
                UITextView * textView = [[UITextView alloc]initWithFrame:CGRectZero];
                textView.editable = NO;
                textView.showsVerticalScrollIndicator = NO;
                textView;
            });
            [self addSubview:_textView];
        }
            break;
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    switch (_webType) {
        case WebDetailType_HTML:
        {
            [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.mas_equalTo(UIEdgeInsetsMake(10, 10, -10, 10));
            }];
        }
            break;
        case WebDetailType_HTTPURL:
        {
            [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
               make.edges.mas_equalTo(UIEdgeInsetsMake(10, 10, -10, 10));
            }];
        }
            break;
            
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
