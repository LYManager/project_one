// LYArticleDetailPresenter.m 
// Lucky 
// 
// Created by 赵良育 on 2018/11/22. 
// Copyright © 2018 赵良育. All rights reserved. 
// 

#import "LYArticleDetailPresenter.h"
#import "MBProgressHUD+LYAdditions.h"
@interface LYArticleDetailPresenter ()<APIManagerApiCallBackDelegate>
/**🐶进度view    👇*/
@property(nonatomic,weak)UIView * progressView;
/** 🐶进度layer    👇*/
@property(nonatomic,strong)CALayer * progresslayer;
@property(nonatomic,strong,readwrite)LYArticleDetailView * detailView;                /**< 详情view*/
@end

@implementation LYArticleDetailPresenter

- (void)loadRequestWithParams:(NSDictionary *)params
{
    [LYArticleDetailRequest requestWithParam:params callBackTarget:self];
}
#pragma 🐒------APIManagerApiCallBackDelegate------🐒
- (void)managerCallAPIDidSuccess:(LYBaseAPIRequest *)request
{
    LYArticleDetailResponse * response = (LYArticleDetailResponse *)request.responseData;
    [MBProgressHUD showLoadingHUD:@"正在加载内容" onView:kWindow];
    [self loadDataWithHtmlString:response.data.article.content];
}
- (void)managerCallAPIDidFailed:(LYBaseAPIRequest *)request
{
    
}

- (void)loadLinkWithURLString:(NSString *)urlString
{
    NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    [self.detailView.webView loadRequest:request];
}

- (void)loadDataWithHtmlString:(NSString *)htmlString
{
     ((UIViewController *)self.view).navigationItem.title  = @"详情";
    [self.detailView.textView setAttributedText:[self p_getHtmlWithContent:htmlString]];
}
- (NSAttributedString *)p_getHtmlWithContent:(NSString *)content
{
    NSString *str = [NSString stringWithFormat:@"<head><style>img{width:%f !important;height:auto}</style></head>%@",SCREEN_WIDTH - 30 ,content];
    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithData:[str dataUsingEncoding:NSUnicodeStringEncoding]options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,NSCharacterEncodingDocumentAttribute:@(NSUTF8StringEncoding)}documentAttributes:nil error:nil];
    
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    //设置文字的行间距
    [paragraphStyle setLineSpacing:8];
    
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [attributedString length])];
    //设置文字的颜色
    //    [attributedString addAttribute:NSForegroundColorAttributeName value:LYRGBAColor(51, 51, 51, 1) range:NSMakeRange(0, attributedString.length)];
    
    //设置文字的大小
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Heiti SC" size:16] range:NSMakeRange(0, attributedString.length)];
    [MBProgressHUD hideLoadingHUD];
    return attributedString;
}

#pragma 🐒------进度监听------🐒
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"estimatedProgress"]) {
        if (object == self.detailView.webView) {
           
            self.progresslayer.opacity = 1;
            //不要让进度条倒着走...有时候goback会出现这种情况
            if ([change[@"new"] floatValue] < [change[@"old"] floatValue]) {
                return;
            }
            self.progresslayer.frame = CGRectMake(0, 0, SCREEN_WIDTH * [change[@"new"] floatValue], 3);
            if ([change[@"new"] floatValue] == 1) {
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    self.progresslayer.opacity = 0;
                });
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    self.progresslayer.frame = CGRectMake(0, 0, 0, 3);
                });
            }
            
        }else
        {
            [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        }
        
    }else if ([keyPath isEqualToString:@"title"])
    {
        if (object == self.detailView.webView) {
            if ([self.detailView.webView.title isEqualToString:@"指引社"]) {
                ((UIViewController *)self.view).navigationItem.title  = @"详情";
            }else
            {
              ((UIViewController *)self.view).navigationItem.title  = self.detailView.webView.title;
            }
            
        }
        else
        {
            [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        }
    }
    else {
        
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

#pragma 🐒------lazy------🐒
- (LYArticleDetailView *)detailView
{
    if (!_detailView) {
        _detailView = [[LYArticleDetailView alloc]initWithFrame:[UIScreen mainScreen].bounds webDetailType:self.webType];
        [_detailView.webView addObserver:self
                           forKeyPath:NSStringFromSelector(@selector(estimatedProgress))
                              options:NSKeyValueObservingOptionNew
                              context:nil];
        [_detailView.webView addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:NULL];
        UIView *progress = [[UIView alloc]initWithFrame:CGRectMake(0, 41, SCREEN_WIDTH, 3)];
        progress.backgroundColor = [UIColor clearColor];
        [((UIViewController *)self.view).navigationController.navigationBar addSubview:progress];
        self.progressView = progress;
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(0, 0, 0, 3);
        layer.backgroundColor = LYRGBColor(254, 217, 86).CGColor;
        [progress.layer addSublayer:layer];
        self.progresslayer = layer;
    }
    return _detailView;
}

- (void)dealloc
{
    [self.progressView removeFromSuperview];
    [self.detailView.webView removeObserver:self forKeyPath:@"estimatedProgress"];
    [LYNotificationCenter removeObserver:self];
}
@end
