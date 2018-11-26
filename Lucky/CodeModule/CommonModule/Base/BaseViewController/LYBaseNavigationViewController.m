// LYBaseNavigationViewController.m 
// Lucky 
// 
// Created by 赵良育 on 2018/11/19. 
// Copyright © 2018 赵良育. All rights reserved. 
// 

#import "LYBaseNavigationViewController.h"
#import "UIBarButtonItem+HSImageBarButton.h"

@interface LYBaseNavigationViewController ()
@property(nonatomic,strong)UIView * blurBackView;                /**< view*/
@end

@implementation LYBaseNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.navigationBar insertSubview:self.blurBackView atIndex:0];
    [self.navigationBar setBarTintColor:[UIColor blackColor]];
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
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

- (UIView *)blurBackView
{
    if (_blurBackView == nil) {
        _blurBackView = [UIView new];
        _blurBackView.frame = CGRectMake(0, -20, [UIScreen mainScreen].bounds.size.width, 64);
        CAGradientLayer *gradientLayer = [[CAGradientLayer alloc] init];
        gradientLayer.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64);
        gradientLayer.colors = @[(__bridge id)[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.76].CGColor,(__bridge id)[UIColor colorWithRed:77/255.0 green:77/255.0 blue:77/255.0 alpha:0.28].CGColor];
        gradientLayer.startPoint = CGPointMake(0, 0);
        gradientLayer.endPoint = CGPointMake(0, 1.0);
        [_blurBackView.layer addSublayer:gradientLayer];
        _blurBackView.userInteractionEnabled = NO;
        _blurBackView.alpha = 0.5;
    }
    return _blurBackView;
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
