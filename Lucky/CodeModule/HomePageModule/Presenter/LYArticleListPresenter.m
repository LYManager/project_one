// LYArticleListPresenter.m 
// Lucky 
// 
// Created by 赵良育 on 2018/11/23. 
// Copyright © 2018 赵良育. All rights reserved. 
// 

#import "LYArticleListPresenter.h"
#import "LYArticleListTableViewCell.h"
@interface LYArticleListPresenter ()
@property(nonatomic,strong,readwrite)LYArticleListView * articleListView;
@end

@implementation LYArticleListPresenter
- (void)configUI
{
    [self.articleListView.tableView registerClass:[LYArticleListTableViewCell class] forCellReuseIdentifier:kArticleListCellIdentifier];
}
#pragma 🐒------UITableViewDataSource,UITabBarDelegate------🐒
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
//    LYArticleListModel * model = self.articleModelArray[indexPath.row];
    LYArticleListTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:kArticleListCellIdentifier forIndexPath:indexPath];
//    [self configCell:cell withModel:model];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    LYArticleListModel * model = self.articleModelArray[indexPath.row];
//    [((UIViewController *)self.view).navigationController pushViewController:[[CTMediator sharedInstance]articleDetailViewController:@{@"articleID":@(model.article_id) ? : @""}] animated:YES];
}
- (void) configCell:(LYArticleListTableViewCell *)cell withModel:(id)model
{
//    [cell.articleImageView sd_setImageWithURL:[NSURL URLWithString:model.title_pic] placeholderImage:nil];
//    cell.articleTitleLabel.text = model.title;
//    cell.articleDesLabel.attributedText = [model ly_getAttributeSummary];
}
#pragma 🐒------lazy------🐒
- (LYArticleListView *)articleListView
{
    if (!_articleListView) {
        _articleListView = [[LYArticleListView alloc]initWithViewTarget:self];
    }
    return _articleListView;
}
@end
