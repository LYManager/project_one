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

