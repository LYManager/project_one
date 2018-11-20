// MBProgressHUD+LYAdditions.m 
// Lucky 
// 
// Created by 赵良育 on 2018/11/20. 
// Copyright © 2018 赵良育. All rights reserved. 
// 

#import "MBProgressHUD+LYAdditions.h"
#import "LYAppCommon.h"
#import "NSObject+Additions.h"
#import <objc/runtime.h>


static MBProgressHUD  *s_progressHUD = nil;
static char const kImageArray;
@interface MBProgressHUD ()
@property(nonatomic,copy)NSNumber *hudCount;
/** 🐶gif图片数组    👇*/
@property(nonatomic,strong)NSMutableArray * imageArray;
@end

@implementation MBProgressHUD (LYAdditions)
-(NSNumber *)hudCount
{
    return objc_getAssociatedObject(self,@selector(hudCount));
}

-(void)setHudCount:(NSNumber *)hudCount
{
    objc_setAssociatedObject(self,@selector(object),(id)hudCount,OBJC_ASSOCIATION_COPY_NONATOMIC);
}


- (NSMutableArray *)imageArray
{
    return objc_getAssociatedObject(self, &kImageArray);
}

- (void)setImageArray:(NSMutableArray *)imageArray
{
    objc_setAssociatedObject(self, &kImageArray, imageArray, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}



+ (void)showLoadingHUD:(NSString *)aString {
    UIWindow *window = mainWindow();
    [self showLoadingHUD:aString onView:window];
}

+ (void)showLoadingHUD:(NSString *)aString onView:(UIView *)view
{
    if (!view) {
        return;
    }
    if (!s_progressHUD) {
        s_progressHUD = [[MBProgressHUD alloc] initWithView:view];
        [view addSubview:s_progressHUD];
    }else{
        s_progressHUD.hudCount = @(s_progressHUD.hudCount.integerValue+1);
    }
    s_progressHUD.removeFromSuperViewOnHide = YES;
    s_progressHUD.animationType = MBProgressHUDAnimationZoom;
    if ([aString length]>0) {
        s_progressHUD.detailsLabel.text = aString;
    }
    else s_progressHUD.detailsLabel.text = nil;
    
    s_progressHUD.bezelView.style = MBProgressHUDBackgroundStyleBlur;
    [s_progressHUD showAnimated:YES];
}

+ (void)showMsgHUD:(NSString *)aString customImage:(UIImage *)customImage
{
    UIWindow *window = mainWindow();
    if (!window) {
        return;
    }
    [self hideLoadingHUD];
    MBProgressHUD *progressHUD = [[MBProgressHUD alloc] initWithView:window];
    [window addSubview:progressHUD];
    progressHUD.removeFromSuperViewOnHide = YES;
    progressHUD.animationType = MBProgressHUDAnimationZoom;
    if ([aString length]>0) {
        progressHUD.detailsLabel.text = aString;
    }
    else progressHUD.detailsLabel.text = nil;
    progressHUD.detailsLabel.font = [UIFont systemFontOfSize:14];
    progressHUD.bezelView.style = MBProgressHUDBackgroundStyleBlur;
    progressHUD.mode = MBProgressHUDModeCustomView;
    progressHUD.customView = [[UIImageView alloc] initWithImage:customImage];
    [progressHUD showAnimated:NO];
    [progressHUD hideAnimated:YES afterDelay:0.7];
}

+ (void)showMsgHUD:(NSString *)aString duration:(CGFloat)duration touchClose:(BOOL)close{
    UIWindow *window = mainWindow();
    [self showMsgHUD:aString onView:window duration:duration touchClose:close];
}

+ (void)showMsgHUD:(NSString *)aString onView:(UIView *)view duration:(CGFloat)duration touchClose:(BOOL)close
{
    if (!view) {
        return;
    }
    [self hideLoadingHUD];
    MBProgressHUD *progressHUD = [[MBProgressHUD alloc] initWithView:view];
    [view addSubview:progressHUD];
    progressHUD.animationType = MBProgressHUDAnimationZoom;
    progressHUD.mode = MBProgressHUDModeText;
    progressHUD.detailsLabel.text = safeString(aString);
    progressHUD.detailsLabel.textColor = [UIColor whiteColor];
    progressHUD.removeFromSuperViewOnHide = YES;
    progressHUD.bezelView.backgroundColor = [UIColor blackColor];
    progressHUD.bezelView.style = MBProgressHUDBackgroundStyleBlur;
    
    [progressHUD showAnimated:NO];
    [progressHUD hideAnimated:YES afterDelay:duration];
    if (close) {
//        [progressHUD handleClick:^(UIView *view) {
//            [(MBProgressHUD*)view hideAnimated:YES];
//        }];
    }
}

+ (void)showMsgHUD:(NSString *)aString
{
    [self showMsgHUD:aString duration:1];
}

+ (void)showMsgHUD:(NSString *)aString duration:(CGFloat)duration {
    [self showMsgHUD:aString duration:duration touchClose:NO];
}

+ (void)showMsgHUD:(NSString *)aString onView:(UIView *)view duration:(CGFloat)duration
{
    [self showMsgHUD:aString onView:view duration:duration touchClose:NO];
}

+ (void)hideLoadingHUD {
    if (s_progressHUD) {
        s_progressHUD.hudCount = @(s_progressHUD.hudCount.integerValue-1);
        if (s_progressHUD.hudCount.integerValue<1) {
            [s_progressHUD hideAnimated:YES];
            s_progressHUD = nil;
        }
    }
}

+ (void)updateLoadingHUD:(NSString*)progress {
    if (s_progressHUD) {
        s_progressHUD.detailsLabel.text = progress;
    }
}

+ (void)showLoadingHUD:(NSString *)aString duration:(CGFloat)duration {
    UIWindow *window = mainWindow();
    if (!window) {
        return;
    }
    
    [self hideLoadingHUD];
    MBProgressHUD *progressHUD = [[MBProgressHUD alloc] initWithView:window];
    [window addSubview:progressHUD];
    progressHUD.animationType = MBProgressHUDAnimationZoom;
    progressHUD.detailsLabel.text = aString;
    progressHUD.removeFromSuperViewOnHide = YES;
    progressHUD.bezelView.style = MBProgressHUDBackgroundStyleBlur;
    [progressHUD showAnimated:NO];
    [progressHUD hideAnimated:YES afterDelay:duration];
}

/** ** ** ** ** ** ** ** ** ** ** **    自定义     ** ** ** ** ** ** ** ** ** ** ** **/

//+ (void)showMySelfGIFLoading
//{
//    [self hideMySelfGIFLoding];
//    NSMutableArray * imageArray = [NSMutableArray array];
//        for (int i = 0; i < 12; i++) {
//            NSString * imageName = [NSString stringWithFormat:@"loading%d",i];
//            UIImage * image = [UIImage imageNamed:imageName];
//            [imageArray addObject:image];
//        }
//
//    [GiFHUD setGifWithImages:imageArray];
//    [GiFHUD show];
//}
//
//+ (void)hideMySelfGIFLoding
//{
////    if (![GiFHUD isShown]) {
////        return;
////    }
//    [GiFHUD dismiss];
//}

@end
