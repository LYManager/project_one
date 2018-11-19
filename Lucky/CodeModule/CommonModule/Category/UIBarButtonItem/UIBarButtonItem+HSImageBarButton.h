//
//  UIBarButtonItem+HSImageBarButton.h
//  HSWormHome
//
//  Created by 赵良育 on 16/9/27.
//  Copyright © 2016年 赵良育. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (HSImageBarButton)
+(instancetype)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image hightlightedImage:(NSString *)hightlightImage;

+(instancetype)rightItemsWithTarget:(id)target action:(SEL)action image:(NSString *)image hightlightedImage:(NSString *)hightlightImage;

+(instancetype)itemWithTarget:(id)target action:(SEL)action title:(NSString *)title titleColor:(UIColor *)titleColor;

+ (instancetype)itemWithTarget:(id)target action:(SEL)action title:(NSString *)title backgrountColor:(UIColor *)backgroundColor;
@end
