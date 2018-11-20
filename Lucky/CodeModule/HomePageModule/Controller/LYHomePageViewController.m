// LYHomePageViewController.m 
// Lucky 
// 
// Created by 赵良育 on 2018/11/19. 
// Copyright © 2018 赵良育. All rights reserved. 
// 

#import "LYHomePageViewController.h"
#import "LYHomePagePresenter.h"
#import "LYBaseAPIProxy.h"
#import "LYURLCommon.h"
@interface LYHomePageViewController ()<LYHomePageViewProtocol>
@property(nonatomic,strong)LYHomePagePresenter * homePresenter;                /**< presenter*/
@end

@implementation LYHomePageViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

#pragma 🐒------Data response------🐒
- (void)ly_getHomeDataResponse:(id)response
{
    
}

- (void)ly_getHomeDataFail:(NSInteger) errorCode des:(NSString *)des
{
    
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
