//
//  LYArticleData.h
//  NIMEducationDemo
//
//  Created by 赵良育 on 2017/8/3.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LYArticleModel.h"
#import "LYArticleCategoryModel.h"
@interface LYArticleData : NSObject
/** 🐶articlearr    👇*/
@property(nonatomic,strong)NSArray * list;
/** 🐶category    👇*/
@property(nonatomic,strong)NSMutableArray * category;

@end
