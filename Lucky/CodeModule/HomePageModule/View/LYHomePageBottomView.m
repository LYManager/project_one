// LYHomePageBottomView.m 
// Lucky 
// 
// Created by 赵良育 on 2018/11/23. 
// Copyright © 2018 赵良育. All rights reserved. 
// 

#import "LYHomePageBottomView.h"

@interface LYHomePageBottomView ()
@property(nonatomic,strong)UIButton * moreBtn;                /**< moreBtn*/
@end

@implementation LYHomePageBottomView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configUI];
    }
    return self;
}

- (void) configUI
{
    _moreBtn = ({
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:@"查看更多" forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        [button addTarget:self action:@selector(moreBtnClickAction) forControlEvents:UIControlEventTouchUpInside];
        [button setBackgroundColor:LYRGBColor(250, 211, 90)];
        button.layer.cornerRadius = 20;
        button.clipsToBounds = YES;
        button;
    });
    [self addSubview:_moreBtn];
}

- (void)moreBtnClickAction
{
    if ([self.delegate respondsToSelector:@selector(moreArticle)]) {
        [self.delegate moreArticle];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    WS(weakSelf)
    [_moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(weakSelf);
        make.top.mas_equalTo(weakSelf.mas_top).offset(30);
        make.bottom.mas_equalTo(weakSelf.mas_bottom).offset(-30);
        make.width.equalTo(@(100));
    }];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
