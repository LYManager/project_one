//
//  LYCommentModel.h
//  Project_shuai
//
//  Created by 赵良育 on 2018/6/9.
//  Copyright © 2018年 赵良育. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYCommentModel : NSObject

#define CREATE_SETGET_UTILS_H(type,strongOrWeak,name) \
\
@property (nonatomic,strongOrWeak) type name;


+ (instancetype) shareInstance;

CREATE_SETGET_UTILS_H(NSString *, copy, isRegisterCloudBuy)

CREATE_SETGET_UTILS_H(NSString *, copy, isNewRegister)  // 控制首页数据显示

/** ** ** ** ** ** ** ** ** ** ** **    用来跳转美恰     ** ** ** ** ** ** ** ** ** ** ** **/
CREATE_SETGET_UTILS_H(NSString *, copy, userNickName)

CREATE_SETGET_UTILS_H(NSString *, copy, userAvatar)

CREATE_SETGET_UTILS_H(NSString *, copy, userComment)

CREATE_SETGET_UTILS_H(NSString *, copy, userID)

//❗❗❗❗❗❗仅Debug模式使用（切换服务器地址）
CREATE_SETGET_UTILS_H(NSString *, copy, debugServiceURLAdderss)
CREATE_SETGET_UTILS_H(NSString *, copy, debugWebServiceURLAdderss)
@end
