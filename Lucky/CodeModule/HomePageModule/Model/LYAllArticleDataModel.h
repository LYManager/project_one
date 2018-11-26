//
//  LYAllArticleDataModel.h
//  NIMEducationDemo
//
//  Created by 赵良育 on 2017/8/3.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LYArticleCategoryModel.h"
//#import "LYArticleCategoryListModel.h"
#import "LYArticleModel.h"
@interface LYAllArticleDataModel : NSObject
/** 🐶category    👇*/
@property(nonatomic,strong)NSArray * category;
/** 🐶LYa    👇*/
@property(nonatomic,strong)LYArticleModel * list;

@end
