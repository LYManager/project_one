//
//  LYArticleCategoryModel.h
//  NIMEducationDemo
//
//  Created by 赵良育 on 2017/8/3.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYArticleCategoryModel : NSObject
/**🐶category_id    👇*/
@property(nonatomic,assign)NSInteger article_category_id;
/**🐶父类id    👇*/
@property(nonatomic,assign)NSInteger fid;
/**🐶title    👇*/
@property(nonatomic,copy)NSString *  title;
/**🐶sort    👇*/
@property(nonatomic,assign)NSInteger sort;
@end
