// LYAritcleListViewController.m 
// Lucky 
// 
// Created by 赵良育 on 2018/11/23. 
// Copyright © 2018 赵良育. All rights reserved. 
// 
// <#Class des#>
#import "LYAritcleListViewController.h"
#import "LYArticleListPresenter.h"
@interface LYAritcleListViewController ()
@property(nonatomic,strong)LYArticleListPresenter * presenter;                /**< preseter*/
@end

@implementation LYAritcleListViewController
- (void)loadView
{
    self.view = self.presenter.articleListView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configUI];
    // Do any additional setup after loading the view from its nib.
}

- (void) configUI
{
    [self.presenter configUI];
    
    [self.presenter loadRequestWithParams:@{@"category_id":@(self.category_id)}];
}

#pragma mark - Life

#pragma mark - Public Methods

#pragma mark - Notification

#pragma mark - Delegate

#pragma mark - Private Methods

#pragma mark - Lazy
- (LYArticleListPresenter *)presenter
{
    if (!_presenter) {
        _presenter = [[LYArticleListPresenter alloc]initWithView:self];
    }
    return _presenter;
}
    
#pragma mark - dealloc
- (void) dealloc
{
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
