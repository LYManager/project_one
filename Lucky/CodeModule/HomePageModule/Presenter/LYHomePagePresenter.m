// LYHomePagePresenter.m 
// Lucky 
// 
// Created by 赵良育 on 2018/11/19. 
// Copyright © 2018 赵良育. All rights reserved. 
// 

#import "LYHomePagePresenter.h"
#import "CTMediator+LYHomePageVCMediator.h"
#import "LYArticleListTableViewCell.h"
#import "LYArticleListModel.h"
@interface LYHomePagePresenter ()<APIManagerApiCallBackDelegate>
@property(nonatomic,strong,readwrite)LYHomePageView * homePageView;
@property(nonatomic,strong)NSArray<LYArticleListModel *> * articleModelArray;                /**< 文章数组*/
@end

@implementation LYHomePagePresenter
- (void)loadRequestWithParams:(NSDictionary *)params
{
    [LYHomePageRequest requestWithCallBackTarget:self];
}
#pragma 🐒------APIManagerApiCallBackDelegate------🐒
- (void)managerCallAPIDidSuccess:(LYBaseAPIRequest *)request
{
    LYHomeDataResponse * response = (LYHomeDataResponse *)request.responseData;
    self.articleModelArray = response.data.article.data;
    [self.homePageView.tableView reloadData];
}
- (void)managerCallAPIDidFailed:(LYBaseAPIRequest *)request
{
    
}

- (void)configUI
{
    [self.homePageView.tableView registerClass:[LYArticleListTableViewCell class] forCellReuseIdentifier:kArticleListCellIdentifier];
}

#pragma 🐒------UITableViewDataSource,UITabBarDelegate------🐒
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.articleModelArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    LYArticleListModel * model = self.articleModelArray[indexPath.row];
    LYArticleListTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:kArticleListCellIdentifier forIndexPath:indexPath];
    [self configCell:cell withModel:model];

    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LYArticleListModel * model = self.articleModelArray[indexPath.row];
    [((UIViewController *)self.view).navigationController pushViewController:[[CTMediator sharedInstance]articleDetailViewController:@{@"articleID":@(model.article_id) ? : @""}] animated:YES];
}
#pragma 🐒------Pirvate------🐒
// 设置cell数据
- (void) configCell:(LYArticleListTableViewCell *)cell withModel:(LYArticleListModel *)model
{
    [cell.articleImageView sd_setImageWithURL:[NSURL URLWithString:model.title_pic] placeholderImage:nil];
    cell.articleTitleLabel.text = model.title;
    cell.articleDesLabel.attributedText = [model ly_getAttributeSummary];
}



#pragma 🐒------lazy------🐒
- (LYHomePageView *)homePageView
{
    if (!_homePageView) {
        _homePageView = [[LYHomePageView alloc]initWithViewTarget:self];
    }
    return _homePageView;
}

@end
