// LYMacro.h 
// Lucky 
// 
// Created by 赵良育 on 2018/11/22. 
// Copyright © 2018 赵良育. All rights reserved. 
// 

#ifndef LYMacro_h
#define LYMacro_h

#pragma mark - 提示
#define Tip_RequestError       @"请求出错"// @"网络请求错误，请重试"
#define Tip_RequestOutTime     @"请求超时"//@"请求超时"
#define Tip_NoNetwork           @"暂无网络，请稍后再试"//@"暂无网络，请稍后再试"
#define Tip_LoginTimeOut       @""//@"登录超时"
#define Tip_RequestUnlegal      @""//@"账号在其他设备登录，请重新登录"
// 占位图
#define Article_PlaceHolder @"aritcle_placeholder_icon"
#define Course_PlaceHolder @"aritcle_placeholder_icon"
#define Head_PlaceHolder @"header_img_placeholder"

// 动态调整网络图标的大小，不变形  不能接收float类型的数(按像素来的)
#define ChangeServiceImage(url,width,height) [NSString stringWithFormat:@"%@?x-oss-process=image/resize,m_fill,w_%d,h_%d",url,width,height]

#define ly_userManager [UserManager sharedInstance]
#define kAppDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)
#define kWindow  [UIApplication sharedApplication].keyWindow
#define kTabBarController kAppDelegate.tabBarController
#define locationManager [LocationManager sharedInstance]

// 布局参数
#define kMargin 10

// 获取系统
#define kDeviceVersion [[UIDevice currentDevice].systemVersion floatValue]
#define WS(weakSelf) __weak __typeof(&*self)weakSelf = self;
//  获取屏幕尺寸
#define SCREEN_WIDTH    [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT  [UIScreen mainScreen].bounds.size.height

// 获取通知中心
#define LYNotificationCenter  [NSNotificationCenter defaultCenter]
//字符串是否为空
#define kStringIsEmpty(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )
//数组是否为空
#define kArrayIsEmpty(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)
//字典是否为空
#define kDictIsEmpty(dic) (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0)
//是否是空对象
#define kObjectIsEmpty(_object) (_object == nil \
|| [_object isKindOfClass:[NSNull class]] \
|| ([_object respondsToSelector:@selector(length)] && [(NSData *)_object length] == 0) \
|| ([_object respondsToSelector:@selector(count)] && [(NSArray *)_object count] == 0))

// 设置颜色
#define LYRGBColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define LYRGBAColor(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
#define LYMainColor LYRGBColor(251,118,55)  //主颜色
//#define LYMainColor LYRGBColor(249,93,139)

#define UIColorFromRGBA(rgbValue, alphaValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0x0000FF))/255.0 \
alpha:alphaValue]

#define UIColorFromRGB(rgbValue) UIColorFromRGBA(rgbValue, 1.0)
// 打印
#ifdef DEBUG
#define LYLog(...) NSLog(@"%s  第%d行 \n  %@ \n\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
#define LYLog(...)
#endif

// 强弱引用
#ifndef weakify
#if DEBUG
#if __has_feature(objc_arc)
#define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif

#ifndef strongify
#if DEBUG
#if __has_feature(objc_arc)
#define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
#endif
#else
#if __has_feature(objc_arc)
#define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
#endif
#endif
#endif

// 判断是否iphone
#define kISiPhone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

// 设置view的圆角和边框
#define LYViewBorderRadius(View , Radius ) \
\
[View.layer setCornerRadius:(Radius)];\
//[View.layer setMaskToBounds:YES];\
//[View.layer setBorderWidth:(Width)];\
//[View.layer setBorderColor:[UIColor CGColor]];

// GCD宏定义 (要自己加上 ^{}  )
#define kDISPATCH_MAIN_THREAD(mainQueueBlock)  dispatch_async(dispatch_get_main_queue(), mainQueueBlock)
#define kDISPATCH_GLOBAL_QUEUE_DEFAULT(globalQueueBlock) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), globalQueueBlock)
// 设置金钱的
#define LYMoneyString(money) [NSString stringWithFormat:@"$%@",money]
#define LYRMBString(money) [NSString stringWithFormat:@"￥%@",money]


#endif /* LYMacro_h */
