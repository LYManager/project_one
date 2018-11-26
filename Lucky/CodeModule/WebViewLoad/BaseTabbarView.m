//
//  BaseTabbarView.m
//  新闻
//
//  Created by gyh on 15/9/21.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "BaseTabbarView.h"
#import "BaseTabbarButton.h"

@interface BaseTabbarView()
@property(nonatomic,weak)BaseTabbarButton *      selectedButton;
@property (nonatomic , weak) BaseTabbarButton *  tabarbutton;

@end

@implementation BaseTabbarView

- (void)addBaseTabbarButtonWithItem:(UITabBarItem *)item
{
    //创建按钮
    BaseTabbarButton *button = [[BaseTabbarButton alloc]init];
    [self addSubview:button];
    self.tabarbutton = button;
    
    //设置
    button.item = item;
    
    //监听按钮点击
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    
    //默认选中第一个按钮
    if (self.subviews.count == 1) {
        [self buttonClick:button];
    }
}

- (void)selectIndex:(int)index
{
    BaseTabbarButton *btn = self.subviews[index];
    btn.tag = index;
    [self buttonClick:btn];
}

- (void)buttonClick:(BaseTabbarButton *)btn
{
    if (self.btnSelectBlock) {
        self.btnSelectBlock((int)btn.tag);
    }
    
    if (btn.tag == self.selectedButton.tag) {
        
        [[NSNotificationCenter defaultCenter]postNotificationName:btn.titleLabel.text object:nil];
    }

    self.selectedButton.selected = NO;
    btn.selected = YES;
    self.selectedButton = btn;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //自定义按钮得大小
    CGFloat  buttonW = self.frame.size.width/self.subviews.count;
    CGFloat  buttonY = 0;
    CGFloat  buttonH = self.frame.size.height;
    
    for (int index = 0; index<self.subviews.count; index++) {
        
        //取出系统原来tabbar上面得按钮
        BaseTabbarButton *button = self.subviews[index];
        
        CGFloat  buttonX = index * buttonW;
        
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
        //设置按钮得tag值
        button.tag = index;
    }
}


@end