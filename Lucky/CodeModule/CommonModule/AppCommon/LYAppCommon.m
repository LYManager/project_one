//
//  LYAppCommon.m
//  NIMEducationDemo
//
//  Created by 赵良育 on 2017/8/1.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "LYAppCommon.h"
#import "MBProgressHUD+LYAdditions.h"
UIWindow *mainWindow() {
    id appDelegate = [UIApplication sharedApplication].delegate;
    if (appDelegate && [appDelegate respondsToSelector:@selector(window)]) {
        return [appDelegate window];
    }

    NSArray *windows = [UIApplication sharedApplication].windows;
    if ([windows count] == 1) {
        return [windows firstObject];
    }
    else {
        for (UIWindow *window in windows) {
            if (window.windowLevel == UIWindowLevelNormal) {
                return window;
            }
        }
    }
    return nil;
}

UIViewController *topMostViewController() {
    UIViewController *topViewController = mainWindow().rootViewController;
    UIViewController *temp = nil;
    while (YES) {
        temp = nil;
        if ([topViewController isKindOfClass:[UINavigationController class]]) {
            temp = ((UINavigationController *)topViewController).visibleViewController;

        } else if ([topViewController isKindOfClass:[UITabBarController class]]) {
            temp = ((UITabBarController *)topViewController).selectedViewController;
        }
        else if (topViewController.presentedViewController != nil) {
            temp = topViewController.presentedViewController;
        }

        if (temp != nil) {
            topViewController = temp;
        } else {
            break;
        }
    }
    return topViewController;
}



@implementation LYAppCommon
+ (void)showLoading {
    [MBProgressHUD showLoadingHUD:@""];
}

+ (void)hideLoading {
    [MBProgressHUD hideLoadingHUD];
}

@end
