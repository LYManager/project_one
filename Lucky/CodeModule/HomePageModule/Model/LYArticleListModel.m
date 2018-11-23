// LYArticleListModel.m 
// Lucky 
// 
// Created by 赵良育 on 2018/11/20. 
// Copyright © 2018 赵良育. All rights reserved. 
// 

#import "LYArticleListModel.h"
#import "LYArticleCategoryModel.h"
@implementation LYArticleListModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
             @"category":[LYArticleCategoryModel class]
             };
}

- (NSAttributedString *) ly_getAttributeSummary
{
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineSpacing = 5; //设置行间距
    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc]initWithString:_summary?:@""];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paraStyle range:NSMakeRange(0, [attributedString length])];
    //设置文字的颜色
    [attributedString addAttribute:NSForegroundColorAttributeName value:LYRGBAColor(173, 173, 173, 1) range:NSMakeRange(0, attributedString.length)];
    //设置文字的大小
    [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:NSMakeRange(0, attributedString.length)];
    return attributedString;
}

@end
