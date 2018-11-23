//
//  LYMineView.h
//  DrawView
//
//  Created by 赵良育 on 2017/12/15.
//  Copyright © 2017年 赵良育. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol LYMineViewDelegate<NSObject>
- (void) didSelectedItemWithIndex:(NSInteger)index;
@end

@interface LYMineView : UIView
/**🐶代理    👇*/
@property(nonatomic,weak)id<LYMineViewDelegate> delegate;

/**
 加载 头像

 @param imageURL 头像的url
 */
- (void) loadHeaderImageWithImageURL:(NSString *)imageURL;

/**
 咨询师申请通过改变button title
 */
- (void) changeConsultManagerTitle;
@end
