// LYHomePageViewController.m 
// Lucky 
// 
// Created by 赵良育 on 2018/11/19. 
// Copyright © 2018 赵良育. All rights reserved. 
// 

#import "LYHomePageViewController.h"
#import "LYHomePagePresenter.h"
#import "LYHomePageView.h"
@interface LYHomePageViewController ()

@property(nonatomic,strong)LYHomePagePresenter * homePresenter;                /**< presenter*/
@end

@implementation LYHomePageViewController
- (void)loadView
{
    self.view = self.homePresenter.homePageView;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"首页";
    [self.homePresenter configUI];
    [self loadRequest];
}
#pragma 🐒------数据请求------🐒
- (void) loadRequest
{
    [self.homePresenter loadRequestWithParams:nil];
}
#pragma 🐒------lazy------🐒
- (LYHomePagePresenter *)homePresenter
{
    if (!_homePresenter) {
        _homePresenter = [[LYHomePagePresenter alloc]initWithView:self];
    }
    return _homePresenter;
}
@end
