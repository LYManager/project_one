//
//  LYAppCommon.h
//  NIMEducationDemo
//
//  Created by 赵良育 on 2017/8/1.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


UIWindow *mainWindow(void);
UIViewController *topMostViewController(void);


@interface LYAppCommon : NSObject

+ (void)showLoading;

+ (void)hideLoading;

@end
