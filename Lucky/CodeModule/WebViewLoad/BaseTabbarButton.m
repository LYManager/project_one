//
//  BaseTabbarButton.m
//  新闻
//
//  Created by gyh on 15/9/21.
//  Copyright © 2015年 apple. All rights reserved.
//

// 定义图片占据得尺寸
#define BaseTabbarButtonRatio 0.6
//默认文字得颜色， ios6 ios7
#define BaseTabbarButtonTitleColor [UIColor colorWithRed:118/255.0f green:118/255.0f blue:118/255.0f alpha:1]
//按钮选中文字得颜色
#define BaseTabbarButtonTitleSelectedColor [UIColor colorWithRed:219/255.0f green:146/255.0f blue:62/255.0f alpha:1]

#import "BaseTabbarButton.h"

@implementation BaseTabbarButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //设置图片 文字居中
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:11];
        [self setTitleColor: BaseTabbarButtonTitleColor forState:UIControlStateNormal];
        [self setTitleColor:BaseTabbarButtonTitleSelectedColor forState:UIControlStateSelected];
    }
    
    return self;
}

-(void)setHighlighted:(BOOL)highlighted
{
    
}

// 设置图片和文字在按钮中得位置。
-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imagew = contentRect.size.width;
    CGFloat imageH = contentRect.size.height *BaseTabbarButtonRatio;
    return CGRectMake(0, 0, imagew, imageH);
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY = contentRect.size.height *BaseTabbarButtonRatio;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height - titleY;
    return CGRectMake(0, titleY, titleW, titleH);
}


-(void)setItem:(UITabBarItem *)item
{
    _item = item;
    [self setTitle:item.title forState:UIControlStateNormal];
    [self setImage:item.image forState:UIControlStateNormal];
    [self setImage:item.selectedImage forState:UIControlStateSelected];
    
}



@end
