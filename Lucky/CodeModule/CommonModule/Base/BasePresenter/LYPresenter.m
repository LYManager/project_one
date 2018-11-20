// LYPresenter.m 
// Lucky 
// 
// Created by 赵良育 on 2018/11/19. 
// Copyright © 2018 赵良育. All rights reserved. 
// 

#import "LYPresenter.h"

@implementation LYPresenter
- (instancetype)initWithView:(id)view
{
    if (self = [super init]) {
        _view = view;
    }
    return self;
}

- (void)attachView:(id)view
{
    _view = view;
}

- (void)detachView:(id)view
{
    _view = nil;
}
@end
