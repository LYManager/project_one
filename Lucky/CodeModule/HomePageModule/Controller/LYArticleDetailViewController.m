// LYArticleDetailViewController.m 
// Lucky 
// 
// Created by 赵良育 on 2018/11/20. 
// Copyright © 2018 赵良育. All rights reserved. 
// 
// <#Class des#>
#import "LYArticleDetailViewController.h"
#import "LYArticleDetailPresenter.h"
@interface LYArticleDetailViewController ()
@property(nonatomic,strong)LYArticleDetailPresenter<LYArticleDetailViewController *> * detailPresenter;                /**< 详情中介*/
@end

@implementation LYArticleDetailViewController

- (void)loadView
{
    self.view = self.detailPresenter.detailView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configUI];
    
    if (self.articleID) {
        
        [self.detailPresenter loadRequestWithParams:@{@"id":@(self.articleID)}];
    }else
    {
        [self.detailPresenter loadLinkWithURLString:self.linkURL];
    }
   
    // Do any additional setup after loading the view from its nib.
}
#pragma mark - Life
- (void)viewWillAppear:(BOOL)animated
{
    if (self.linkURL) {
        [self.navigationController setNavigationBarHidden:NO animated:YES];
    }
    
}
- (void)viewWillDisappear:(BOOL)animated
{
    if (self.linkURL) {
        [self.navigationController setNavigationBarHidden:YES animated:YES];
    }
}
#pragma mark - Public Methods

#pragma mark - Notification

#pragma mark - Delegate

#pragma mark - Private Methods
- (void) configUI
{
    
}

#pragma mark - Lazy

- (LYArticleDetailPresenter<LYArticleDetailViewController *> *)detailPresenter
{
    if (!_detailPresenter) {
        _detailPresenter = [[LYArticleDetailPresenter alloc]initWithView:self];
        if (self.linkURL) {
            _detailPresenter.webType = WebDetailType_HTTPURL;
        }else
        {
            _detailPresenter.webType = WebDetailType_HTML;
        }
    }
    return _detailPresenter;
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
