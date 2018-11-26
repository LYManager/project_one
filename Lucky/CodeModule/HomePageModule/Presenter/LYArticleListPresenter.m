// LYArticleListPresenter.m 
// Lucky 
// 
// Created by 赵良育 on 2018/11/23. 
// Copyright © 2018 赵良育. All rights reserved. 
// 

#import "LYArticleListPresenter.h"
#import "LYArticleListTableViewCell.h"
#import "CTMediator+LYHomePageVCMediator.h"
#import "MJRefresh.h"
@interface LYArticleListPresenter ()<APIManagerApiCallBackDelegate>
@property(nonatomic,strong,readwrite)LYArticleListView * articleListView;
@property(nonatomic,strong)LYArticleListRequest * request;                /**< request*/
@property(nonatomic,strong)NSArray <LYArticleDataModel *>*listArray;                /**< <#des#>*/
@end

@implementation LYArticleListPresenter

- (void)loadRequestWithParams:(NSDictionary *)params
{
    self.request.category_id = [params[@"category_id"] integerValue];
    [self loadRequestShowLoading:NO];
}

- (void) loadRequestShowLoading:(BOOL)showLoading
{
    [self.request loadDataWithHUDOnView:showLoading ? ((UIViewController *)self.view).view : nil];
}
#pragma 🐒------APIManagerApiCallBackDelegate------🐒
- (void)managerCallAPIDidSuccess:(LYBaseAPIRequest *)request
{
     self.listArray = self.request.listArray;
    [self.articleListView.tableView reloadData];
}

- (void)managerCallAPIDidFailed:(LYBaseAPIRequest *)request
{
    
}

- (void)configUI
{
    [self.articleListView.tableView registerClass:[LYArticleListTableViewCell class] forCellReuseIdentifier:kArticleListCellIdentifier];
    WS(weakSelf)
    self.articleListView.tableView.mj_footer = [MJRefreshBackStateFooter footerWithRefreshingBlock:^{
        [weakSelf.articleListView.tableView.mj_footer endRefreshing];
        [weakSelf loadRequestShowLoading:NO];
    }];
}
#pragma 🐒------UITableViewDataSource,UITabBarDelegate------🐒
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.listArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    LYArticleDataModel * model = self.listArray[indexPath.row];
    LYArticleListTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:kArticleListCellIdentifier forIndexPath:indexPath];
    [self configCell:cell withModel:model];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LYArticleDataModel * model = self.listArray[indexPath.row];
    [((UIViewController *)self.view).navigationController pushViewController:[[CTMediator sharedInstance]articleDetailViewController:@{@"articleID":@(model.article_id) ? : @""}] animated:YES];
}
- (void) configCell:(LYArticleListTableViewCell *)cell withModel:(LYArticleDataModel *)model
{
    [cell.articleImageView sd_setImageWithURL:[NSURL URLWithString:model.title_pic] placeholderImage:nil];
    cell.articleTitleLabel.text = model.title;
    cell.articleDesLabel.attributedText = [model ly_getAttributeSummary];
}
#pragma 🐒------lazy------🐒
- (LYArticleListView *)articleListView
{
    if (!_articleListView) {
        _articleListView = [[LYArticleListView alloc]initWithViewTarget:self];
    }
    return _articleListView;
}
- (LYArticleListRequest *)request
{
    if (!_request) {
        _request = [LYArticleListRequest new];
        _request.paramSource = (id)_request;
        _request.delegate = self;
        _request.currentPage = 1;
    }
    return _request;
}
@end
