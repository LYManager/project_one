// LYBaseNavigationViewController.m 
// Lucky 
// 
// Created by 赵良育 on 2018/11/19. 
// Copyright © 2018 赵良育. All rights reserved. 
// 

#import "LYBaseNavigationViewController.h"
#import "UIBarButtonItem+HSImageBarButton.h"

@interface LYBaseNavigationViewController ()

@end

@implementation LYBaseNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    if (self.childViewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        UIBarButtonItem * leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(backAction:) image:@"lc_base_back_icon" hightlightedImage:@"lc_base_back_icon"];
        viewController.navigationItem.leftBarButtonItem = leftBarButtonItem;
    }
    
    [super pushViewController:viewController animated:animated];
}

-(void)backAction:(UIBarButtonItem *)sender
{
    [self.view endEditing:YES];
    [self popViewControllerAnimated:YES];
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
