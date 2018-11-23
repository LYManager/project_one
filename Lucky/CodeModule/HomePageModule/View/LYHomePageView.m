// LYHomePageView.m 
// Lucky 
// 
// Created by 赵良育 on 2018/11/20. 
// Copyright © 2018 赵良育. All rights reserved. 
// 

#import "LYHomePageView.h"

@implementation LYHomePageView

- (instancetype)initWithViewTarget:(id<UITableViewDelegate,UITableViewDataSource>)target
{
   return  [self initWithFrame:[UIScreen mainScreen].bounds target:target];
}

- (instancetype)initWithFrame:(CGRect)frame target:(id<UITableViewDelegate,UITableViewDataSource>)target
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self configUIWithTarget:target];
    }
    return self;
}


- (void) configUIWithTarget:(id<UITableViewDelegate,UITableViewDataSource>)target
{
    _tableView =({
        UITableView * tableView =[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        tableView.backgroundColor = [UIColor whiteColor];
        tableView.rowHeight = 120;
        tableView.dataSource = target;
        tableView.delegate = target;

        
        _bottomView = [[LYHomePageBottomView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 100)];
        tableView.tableFooterView = _bottomView;

        tableView;
    });
    [self addSubview:_tableView];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    __weak typeof(self)weakSelf = self;
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf);
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
