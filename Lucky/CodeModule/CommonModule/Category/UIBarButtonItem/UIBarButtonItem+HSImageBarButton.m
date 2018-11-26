//
//  UIBarButtonItem+HSImageBarButton.m
//  HSWormHome
//
//  Created by 赵良育 on 16/9/27.
//  Copyright © 2016年 赵良育. All rights reserved.
//

#import "UIBarButtonItem+HSImageBarButton.h"

@implementation UIBarButtonItem (HSImageBarButton)
+(instancetype)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image hightlightedImage:(NSString *)hightlightImage
{
    UIImage *buttonNormal = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem * item = [[UIBarButtonItem alloc]initWithImage:buttonNormal style:UIBarButtonItemStylePlain target:target action:action];
    return item;
}

+(instancetype)rightItemsWithTarget:(id)target action:(SEL)action image:(NSString *)image hightlightedImage:(NSString *)hightlightImage
{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:hightlightImage] forState:UIControlStateHighlighted];
    return [[UIBarButtonItem alloc]initWithCustomView:btn];
}

+(instancetype)itemWithTarget:(id)target action:(SEL)action title:(NSString *)title titleColor:(UIColor *)titleColor
{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.frame = CGRectMake(0, 0, 0, 40);
    [btn sizeToFit];
    return [[UIBarButtonItem alloc]initWithCustomView:btn];
}

+ (instancetype)itemWithTarget:(id)target action:(SEL)action title:(NSString *)title backgrountColor:(UIColor *)backgroundColor
{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.frame = CGRectMake(0, 0, 50, 25);
    btn.layer.cornerRadius = 3;
    btn.backgroundColor = backgroundColor;
    return [[UIBarButtonItem alloc]initWithCustomView:btn];

}



@end
