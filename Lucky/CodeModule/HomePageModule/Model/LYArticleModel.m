//
//  LYArticleModel.m
//  NIMEducationDemo
//
//  Created by 赵良育 on 2017/8/1.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "LYArticleModel.h"


//@implementation LYArticleAuthorMessageModel
//+ (NSDictionary *)modelContainerPropertyGenericClass {
//    return @{@"skillfuls" : [LYSkillsModel class]};
//}
//@end

@implementation LYArticleDataModel
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

@implementation LYArticleModel

//- (id)copyWithZone:(NSZone *)zone {
//    return [self yy_modelCopy];
//}
//- (void)encodeWithCoder:(NSCoder *)aCoder {
//    [self yy_modelEncodeWithCoder:aCoder];
//}
//- (instancetype)initWithCoder:(NSCoder *)aDecoder {
//    if (self = [super init]) {
//        [self yy_modelInitWithCoder:aDecoder];
//    }
//    return self;
//}
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"data" : [LYArticleDataModel class]};
}
@end

