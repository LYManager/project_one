//
//  LYCommentModel.m
//  Project_shuai
//
//  Created by 赵良育 on 2018/6/9.
//  Copyright © 2018年 赵良育. All rights reserved.
//

#import "LYCommentModel.h"
static LYCommentModel * commentModel = nil;

@implementation LYCommentModel

#define CREATE_SETGET_UTILS_M(type,param,upperFirstParam) \
\
@synthesize param; \
- (void) set##upperFirstParam:(type)p##param{   \
param = p##param;               \
[[NSUserDefaults standardUserDefaults]setValue:param forKey:@#param];   \
[[NSUserDefaults standardUserDefaults]synchronize];\
}    \
\
- (type)param{  \
if(!param){   \
type saved =  [[NSUserDefaults standardUserDefaults]valueForKey:@#param];                                   \
if(saved){   \
param = saved;   \
}          \
}\
return param; \
}

+ (instancetype)shareInstance
{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        commentModel = [LYCommentModel new];
    });
    return commentModel;
}
// 是否注册过 云购
CREATE_SETGET_UTILS_M(NSString *, isRegisterCloudBuy, IsRegisterCloudBuy)

CREATE_SETGET_UTILS_M(NSString *, userNickName, UserNickName)

CREATE_SETGET_UTILS_M(NSString *, userAvatar, UserAvatar)

CREATE_SETGET_UTILS_M(NSString *, userComment, UserComment)

CREATE_SETGET_UTILS_M(NSString *, userID, UserID)

CREATE_SETGET_UTILS_M(NSString *, isNewRegister, IsNewRegister)

CREATE_SETGET_UTILS_M(NSString *, debugServiceURLAdderss, DebugServiceURLAdderss)

CREATE_SETGET_UTILS_M(NSString *, debugWebServiceURLAdderss, DebugWebServiceURLAdderss)
@end
