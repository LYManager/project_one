// LYArticleMainViewController.m 
// Lucky 
// 
// Created by 赵良育 on 2018/11/23. 
// Copyright © 2018 赵良育. All rights reserved. 
// 
// <#Class des#>
#import "LYArticleMainViewController.h"
#import "LYAritcleListViewController.h"
#import "MLMSegmentHead.h"
#import "MLMSegmentScroll.h"
#import "MLMSegmentManager.h"
#import "LYArticleRequest.h"
@interface LYArticleMainViewController ()
/** 🐶分类列表    👇*/
@property(nonatomic,strong)NSMutableArray * categoryModelArr;
/** 🐶segHead    👇*/
@property(nonatomic,strong)MLMSegmentHead * segHead;
/** 🐶segScroll    👇*/
@property(nonatomic,strong)MLMSegmentScroll * segScroll;
/** 🐶数据模型    👇*/
@property(nonatomic,strong)LYArticleData * articleData;
@end

@implementation LYArticleMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [LYArticleRequest loadArticleDataSuccess:^(LYArticleData *data) {
        [self p_setupUIWithArticleData:data];
    } failure:^{
        
    }];
    // Do any additional setup after loading the view from its nib.
}


#pragma mark - Life

#pragma mark - Public Methods

#pragma mark - Notification

#pragma mark - Delegate

#pragma mark - Private Methods
- (void)p_setupUIWithArticleData:(LYArticleData *)data
{
    self.navigationItem.title = @"文章列表";
     NSMutableArray * categoryTitlelArr = @[].mutableCopy;
    for (LYArticleCategoryModel *categoryModel in data.category) {
        [categoryTitlelArr addObject:categoryModel.title];
    }
     self.categoryModelArr = data.category;
 
   
    CGRect statusFrame = [[UIApplication sharedApplication]statusBarFrame];
    CGFloat height = statusFrame.size.height> 20 ? 84 : 64; // 适配iphoneX
    _segHead = [[MLMSegmentHead alloc] initWithFrame:CGRectMake(0, height, SCREEN_WIDTH, 40) titles:categoryTitlelArr headStyle:SegmentHeadStyleDefault layoutStyle:MLMSegmentLayoutDefault];
    _segHead.fontScale = 1.1;
    _segHead.headColor = LYRGBColor(224, 224, 224);
    _segHead.selectColor = LYRGBColor(213,170, 115);
    _segScroll = [[MLMSegmentScroll alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_segHead.frame), SCREEN_WIDTH, SCREEN_HEIGHT-CGRectGetMaxY(_segHead.frame)) vcOrViews:[self childVCArr:categoryTitlelArr.count]];
    _segScroll.scrollEnabled = YES;
    _segScroll.loadAll = NO;
    WS(weakSelf)
    [MLMSegmentManager associateHead:_segHead withScroll:_segScroll completion:^{
        [weakSelf.view addSubview:weakSelf.segHead];
        [weakSelf.view addSubview:weakSelf.segScroll];
    }];
}
- (NSArray <UIView *>*)childVCArr:(NSInteger)count
{
    NSMutableArray *arr = [NSMutableArray array];
    for (NSInteger i = 0; i < count; i ++) {
        LYAritcleListViewController  *vc = [[LYAritcleListViewController alloc]init];
        [arr addObject:vc];
    }
    return arr;
}

#pragma mark - Lazy

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
