// LYBaseTabBarController.m 
// Lucky 
// 
// Created by 赵良育 on 2018/11/19. 
// Copyright © 2018 赵良育. All rights reserved. 
// 

#import "LYBaseTabBarController.h"

#import "LYHomePageViewController.h"
#import "LYToolsViewController.h"
#import "BaseTabbarView.h"
#import "LYBaseNavigationViewController.h"

#import "KProjectNavigationViewController.h"
#import "KProjectRootViewController.h"
@interface LYBaseTabBarController ()
@property (nonatomic , strong) BaseTabbarView *tabbar;


@end

@implementation LYBaseTabBarController

- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor whiteColor];
    [super viewDidLoad];
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"网络不给力,请检查网络设置!" delegate:nil cancelButtonTitle:@"确定"otherButtonTitles:nil, nil];
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    //    __weak BaseTabBarController *weakSelf = self;
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case -1:
                NSLog(@"未知网络");
                break;
            case 0:
                NSLog(@"网络不可达");
                break;
            case 1:
            {
                NSLog(@"GPRS网络");
                //发通知，带头搞事
                [[NSNotificationCenter defaultCenter] postNotificationName:@"monitorNetworking" object:@"1" userInfo:nil];
            }
                break;
            case 2:
            {
                NSLog(@"wifi网络");
                //发通知，搞事情
                [[NSNotificationCenter defaultCenter] postNotificationName:@"monitorNetworking" object:@"2" userInfo:nil];
            }
                break;
            default:
                break;
        }
        if (status == AFNetworkReachabilityStatusReachableViaWWAN || status == AFNetworkReachabilityStatusReachableViaWiFi) {
            NSLog(@"有网");
            //            [self configWithInit];
            [self initTabbar];
            [self configWithInit];
        }else{
            NSLog(@"没网");
            [alert show];
        }
    }];
    
    
    //[self addChildViewControllers];
    
}
-(void)configWithInit
{
    
    AVQuery *query = [AVQuery queryWithClassName:@"Share"];
    
    [query getObjectInBackgroundWithId:@"5bce902f0b6160006f62743a" block:^(AVObject *object, NSError *error) {
            //        [MBProgressHUD hideHUDForView:view animated:YES];
    
            // object 就是 id 为 56f8aab879bc44005920635e 的 Todo 对象实例
            NSString *location = [object objectForKey:@"myTag"];
            NSString *myUrl = [object objectForKey:@"myURL"];
    
            NSLog(@"%@",location);
    
            if ([location isEqualToString:@"1"]) {
                [self addChildViewControllers];
            }
            else if ([location isEqualToString:@"0"]) {
    
                KProjectRootViewController *rootViewController = [[KProjectRootViewController alloc] init];
                rootViewController.urlString = myUrl;
                KProjectNavigationViewController *nav = [[KProjectNavigationViewController alloc] initWithRootViewController:rootViewController];
                nav.orientationMask = UIInterfaceOrientationMaskAll;
                UIWindow *window = [UIApplication sharedApplication].keyWindow;
                [window setBackgroundColor:[UIColor whiteColor]];
                [window setRootViewController:nav];
                [window makeKeyAndVisible];
    
    
    
            }
        }];
}
-(void)initTabbar
{
    IMP_BLOCK_SELF(LYBaseTabBarController);
    BaseTabbarView *tabbar = [[BaseTabbarView alloc]init];
    tabbar.frame = self.tabBar.bounds;
    tabbar.btnSelectBlock = ^(int to){
        block_self.selectedIndex = to;
    };
    [self.tabBar addSubview:tabbar];
    self.tabbar = tabbar;
    
    //[self handleThemeChanged];
}

-(void)addChildViewControllers{
    
  

    LYHomePageViewController *homeVc = [[LYHomePageViewController alloc]init];
    [self addChildViewController:homeVc WithTitle:@"文章" image:@"article_no_selected" seleImage:@"article_selected"];
    
    LYToolsViewController *site = [[LYToolsViewController alloc]init];
    [self addChildViewController:site WithTitle:@"测算" image:@"ask_no_selected" seleImage:@"ask_selected"];
    
}


-(void)addChildViewController:(UIViewController *)childController WithTitle:(NSString *)title image:(NSString *)imageName seleImage:(NSString *)seleImage{
    
    childController.tabBarItem.image = [UIImage imageNamed:seleImage];
    childController.tabBarItem.selectedImage = [[UIImage imageNamed:imageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    childController.title = title;
    
    
    LYBaseNavigationViewController *nav = [[LYBaseNavigationViewController alloc]initWithRootViewController:childController];
    //    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:childController];
    //
    //    [nav.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    //
    //    nav.navigationBar.barTintColor = NavColor;
    [self addChildViewController:nav];
    [self.tabbar addBaseTabbarButtonWithItem:childController.tabBarItem];
    
    
    
    
    
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
