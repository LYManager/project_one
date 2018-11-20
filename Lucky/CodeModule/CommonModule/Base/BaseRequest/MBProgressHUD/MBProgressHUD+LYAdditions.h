// MBProgressHUD+LYAdditions.h 
// Lucky 
// 
// Created by 赵良育 on 2018/11/20. 
// Copyright © 2018 赵良育. All rights reserved. 
// 

#import "MBProgressHUD.h"

NS_ASSUME_NONNULL_BEGIN

@interface MBProgressHUD (LYAdditions)
/**
 *  显示一个只有文字的框
 *
 *  @param aString  内容
 *  @param duration 显示时间
 */
+ (void)showMsgHUD:(NSString *)aString duration:(CGFloat)duration;

/**
 *  显示一个只有文字的框
 *
 *  @param aString  内容
 */
+ (void)showMsgHUD:(NSString *)aString;

/**
 *  在指定view上显示一个只有文字的框
 *
 *  @param aString  内容
 *  @param view  显示HUD的view
 *  @param duration 显示时间
 */
+ (void)showMsgHUD:(NSString *)aString onView:(UIView *)view duration:(CGFloat)duration;

/**
 *  显示一个只有文字的框
 *
 *  @param aString  内容
 *  @param duration 显示时间
 *  @param close    是否支持点击关闭
 */
+ (void)showMsgHUD:(NSString *)aString duration:(CGFloat)duration touchClose:(BOOL)close;

/**
 *  在指定view上显示一个只有文字的框
 *
 *  @param aString  内容
 *  @param view  显示HUD的view
 *  @param duration 显示时间
 *  @param close    是否支持点击关闭
 */
+ (void)showMsgHUD:(NSString *)aString onView:(UIView *)view duration:(CGFloat)duration touchClose:(BOOL)close;

/**
 *  显示一个有菊花，有文字，自动消失的框
 *
 *  @param aString  文字内容，如果是nil，则只有文字，
 *  @param duration 显示时间
 */
+ (void)showLoadingHUD:(NSString *)aString duration:(CGFloat)duration;

/**
 *  显示一个有菊花，有文字的框，需要调用hideLoadingHUD消失
 *
 *  @param aString 内容
 */
+ (void)showLoadingHUD:(NSString *)aString;

/**
 *  在指定view上显示一个有菊花，有文字的框，需要调用hideLoadingHUD消失
 *
 *  @param aString 内容
 *  @param view  显示HUD的view
 */
+ (void)showLoadingHUD:(NSString *)aString onView:(UIView *)view;

/**
 *  显示一个自定义图片，有文字的框，自动消失
 *
 *  @param aString 内容
 *  @param customImage 自定义图片
 */
+ (void)showMsgHUD:(NSString *)aString customImage:(UIImage *)customImage;

/**
 *  隐藏loading
 */
+ (void)hideLoadingHUD;

/**
 *  更新loading里面的内容
 *
 *  @param aString 内容
 */
+ (void)updateLoadingHUD:(NSString*)aString;

/**
 自定义的loading
 */
+ (void)showMySelfGIFLoading;

+ (void)hideMySelfGIFLoding;


@end

NS_ASSUME_NONNULL_END
