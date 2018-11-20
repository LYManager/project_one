// LYHomePagePresenter.m 
// Lucky 
// 
// Created by 赵良育 on 2018/11/19. 
// Copyright © 2018 赵良育. All rights reserved. 
// 

#import "LYHomePagePresenter.h"
#import "CTMediator+LYHomePageVCMediator.h"

@interface LYHomePagePresenter ()<APIManagerApiCallBackDelegate>

@end

@implementation LYHomePagePresenter
- (void)loadRequestWithParams:(NSDictionary *)params
{
    [LYHomePageRequest requestWithCallBackTarget:self];
}
#pragma 🐒------APIManagerApiCallBackDelegate------🐒
- (void)managerCallAPIDidSuccess:(LYBaseAPIRequest *)request
{
    
}
- (void)managerCallAPIDidFailed:(LYBaseAPIRequest *)request
{
    
}

#pragma 🐒------UITableViewDataSource,UITabBarDelegate------🐒
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = @"测试";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [((UIViewController *)self.view).navigationController pushViewController:[[CTMediator sharedInstance]articleDetailViewController] animated:YES];
}
@end
