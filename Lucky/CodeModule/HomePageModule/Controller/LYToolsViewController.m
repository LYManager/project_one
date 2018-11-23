// LYToolsViewController.m 
// Lucky 
// 
// Created by 赵良育 on 2018/11/22. 
// Copyright © 2018 赵良育. All rights reserved. 
// 
// <#Class des#>
#import "LYToolsViewController.h"
#import "CTMediator+LYHomePageVCMediator.h"
#import "LYMineView.h"
#import "LYURLCommon.h"
@interface LYToolsViewController ()<LYMineViewDelegate>
@property(nonatomic,strong)NSArray * toolsUrlArr;                /**< 工具连接*/
@end

@implementation LYToolsViewController

- (void)loadView
{
    LYMineView * mineView = [[LYMineView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    mineView.delegate = self;
    self.view = mineView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    self.view.backgroundColor = LYRGBColor(9, 9, 9);
    
    
    
    // Do any additional setup after loading the view from its nib.
}


#pragma mark - Life


#pragma mark - Public Methods

#pragma mark - Notification

#pragma mark - Delegate

- (void)didSelectedItemWithIndex:(NSInteger)index
{
    NSString *url = self.toolsUrlArr[index];
    NSString * toolUrl = [NSString stringWithFormat:@"%@%@",ToolsBaseURL,url];
    [self.navigationController pushViewController:[[CTMediator sharedInstance]toolDetailViewController:@{@"linkURL":toolUrl}] animated:YES];
}

#pragma mark - Private Methods

#pragma mark - Lazy
- (NSArray *)toolsUrlArr
{
    if (!_toolsUrlArr) {

        _toolsUrlArr = @[xuanKongFeiXingURL,jieMengURL,taLuoURL,qiMenDunJiaURL,ziWeiDouShuURL,baZiPaiPanURL,liuBoQiGuaURL,liuRenQiKeURL];

    }
    return _toolsUrlArr;
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
