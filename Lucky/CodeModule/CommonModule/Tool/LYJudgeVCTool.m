// LYJudgeVCTool.m 
// Lucky 
// 
// Created by 赵良育 on 2018/11/20. 
// Copyright © 2018 赵良育. All rights reserved. 
// 

#import "LYJudgeVCTool.h"

@implementation LYJudgeVCTool
+ (UIViewController *)judgeVc:(id)vc{
    if ([vc isKindOfClass:[UIViewController class]]) {
        return vc;
    }else{
        return [[UIViewController alloc] init];  // 没有这个控制器
    }
}
@end
