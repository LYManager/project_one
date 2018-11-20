// LYBaseAPIRequest.m 
// Lucky 
// 
// Created by 赵良育 on 2018/11/20. 
// Copyright © 2018 赵良育. All rights reserved. 
// 

#import "LYBaseAPIRequest.h"
#import "LYPageAPIRequest.h"
#import "LYBaseAPIProxy.h"
#import "MBProgressHUD+LYAdditions.h"
#import "NSObject+YYModel.h"
#import "UIView+Toast.h"
#import "AFNetworking.h"
@interface LYBaseAPIRequest ()
@property (nonatomic, copy, readwrite) NSString *errorMessage;
@property (nonatomic, copy, readwrite) NSString *successMessage;
@property (nonatomic, readwrite) APIManagerErrorType errorType;
@property (nonatomic, strong) NSMutableArray *requestIdList;
@property (nonatomic, strong)UIView *hudSuperView;
@property (nonatomic, assign)NSInteger reloginCount;
@end

@implementation LYBaseAPIRequest
-(instancetype)initWithDelegate:(id)delegate paramSource:(id)paramSource
{
    self = [super init];
    if (self) {
        _delegate = delegate;
        _paramSource = paramSource;
        _validator = (id)self;
        _errorType = APIManagerErrorTypeDefault;
        
        if ([self conformsToProtocol:@protocol(APIManager)]) {
            self.child = (id <APIManager>)self;
        }
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _delegate = nil;
        _paramSource = nil;
        _validator = (id)self;
        _errorType = APIManagerErrorTypeDefault;
        
        if ([self conformsToProtocol:@protocol(APIManager)]) {
            self.child = (id <APIManager>)self;
        }
    }
    return self;
}

- (void)dealloc
{
    [self cancelAllRequests];
    self.requestIdList = nil;
}

#pragma mark - calling api
-(NSInteger)loadDataWithHUDOnView:(UIView *)view
{
    return [self loadDataWithHUDOnView:view HUDMsg:@""];
}

-(NSInteger)loadDataWithHUDOnView:(UIView *)view HUDMsg:(NSString *)HUDMsg
{
    [self cancelAllRequests];
    if (view) {
        self.hudSuperView = view;
        
        [MBProgressHUD showLoadingHUD:HUDMsg onView:self.hudSuperView];
        //        [MBProgressHUD showMySelfGIFLoading];
        
    }
    NSDictionary *params = [self.paramSource paramsForApi:self];
    if ([self.child respondsToSelector:@selector(reformParamsForApi:)]) {
        params = [self.child reformParamsForApi:params];
    }
    
    //    params = [self signatureParams:params];
    NSInteger requestId = [self loadDataWithParams:params];
    return requestId;
}

- (NSInteger)loadDataWithParams:(NSDictionary *)params
{
    NSInteger requestId = 0;
    if ([self isReachable]) {
        if ([self.child respondsToSelector:@selector(requestSerializer)]) {
            [LYBaseAPIProxy sharedInstance].requestSerializer = self.child.requestSerializer;
        } else {
            [LYBaseAPIProxy sharedInstance].requestSerializer = [AFHTTPRequestSerializer serializer];// 拼接，如果是JSON换成AFJSON
            
            //            [[LYBaseAPIProxy sharedInstance].requestSerializer setValue:  [[NSUserDefaults standardUserDefaults]valueForKey:@"kCookie"] forHTTPHeaderField:@"Cookie"];
        }
        if ([self.child respondsToSelector:@selector(responseSerializer)]) {
            [LYBaseAPIProxy sharedInstance].responseSerializer = self.child.responseSerializer;
        } else {
            [LYBaseAPIProxy sharedInstance].responseSerializer = [AFJSONResponseSerializer serializer];
        }
        
        [[LYBaseAPIProxy sharedInstance] callAPIWithRequestType:self.child.requestType params:params requestPath:self.child.requestPath uploadBlock:[self.paramSource respondsToSelector:@selector(uploadBlock:)]?[self.paramSource uploadBlock:self]:nil success:^(LYBaseAPIResponse *response) {
            [self successedOnCallingAPI:response];
        } fail:^(LYBaseAPIResponse *response) {
            [self failedOnCallingAPI:response withErrorType:response.errorType];
        }];
        [self.requestIdList addObject:@(requestId)];
        return requestId;
        
    } else {
        [self failedOnCallingAPI:nil withErrorType:APIManagerErrorTypeNoNetWork];
        return requestId;
    }
    return requestId;
}

- (void)successedOnCallingAPI:(LYBaseAPIResponse *)response
{
    if (self.hudSuperView) {
        [MBProgressHUD hideLoadingHUD];
        //        [MBProgressHUD hideMySelfGIFLoding];
    }
    [self removeRequestIdWithRequestID:response.requestId];
    
    
    
    if ([self.child respondsToSelector:@selector(responseClass)]) {
        self.responseData =  [[self.child responseClass] modelWithDictionary:response.responseData];
        // 如果有中奖  那么弹个框吧;
        
        // 2,200签到状态码
        BOOL fail = self.responseData.code !=1 && self.responseData.code != 200;
        if (fail) {
            response.msg = self.responseData.msg;
            [self failedOnCallingAPI:response withErrorType:APIManagerErrorTypeDefault];
            return;
        }
    } else {
        self.responseData = response.responseData;
    }
    
    if ([self.validator respondsToSelector:@selector(manager:isCorrectWithCallBackData:)] && ![self.validator manager:self isCorrectWithCallBackData:self.responseData]) {
        [self failedOnCallingAPI:response withErrorType:APIManagerErrorTypeNoContent];
    } else {
        if ([self.child respondsToSelector:@selector(reformData)]) {
            [self.child reformData];
        }
        [self.delegate managerCallAPIDidSuccess:self];
    }
}

- (void)failedOnCallingAPI:(LYBaseAPIResponse *)response withErrorType:(APIManagerErrorType)errorType
{
    if (self.hudSuperView) {
        [MBProgressHUD hideLoadingHUD];
    }
    
    self.errorType = errorType;
    self.msg = response.msg;
    [self removeRequestIdWithRequestID:response.requestId];
    switch (errorType) {
        case APIManagerErrorTypeDefault:
            self.errorMessage = response.msg;
            [self.delegate managerCallAPIDidFailed:self];
            break;
        case APIManagerErrorTypeSuccess:
            break;
        case APIManagerErrorTypeNoContent:
            break;
        case APIManagerErrorTypeParamsError:
            break;
        case APIManagerErrorTypeTimeout:
//            self.msg = Tip_RequestOutTime;
            break;
        case APIManagerErrorTypeNoNetWork:
//            self.msg = Tip_NoNetwork;
            break;
        case APIManagerErrorLoginTimeout:
//            self.msg = Tip_LoginTimeOut;
            break;
        default:
            break;
    }
    
    if (self.errorType==APIManagerErrorLoginTimeout) {
        //        if (!self.reloginCount && ![self isKindOfClass:[LoginRequest class]]) {
        //            self.reloginCount++;
        //            [LoginRequest autoReloginSuccess:^{
        //                [self loadDataWithHUDOnView:self.hudSuperView];
        //            } failure:^{
        //                [UserManager removeLocalUserLoginInfo];
        ////                [kAppDelegate loadLoginVC];
        //            }];
        //        } else {
        //            [UserManager removeLocalUserLoginInfo];
        ////            [kAppDelegate loadLoginVC];
        //        }
    } else {
        [self.delegate managerCallAPIDidFailed:self];
        // 请求错误 重新请求
        //        if (self.hudSuperView && !self.disableErrorTip) {
        //            [MBProgressHUD showMsgHUD:response.msg];
        //        }
        
        [self reloadDataWithRequest:self withMsg:response.msg];
        
    }
}



#pragma mark - ☞ 🐶 ●请求错误弹框重新请求● 🐶
- (void) reloadDataWithRequest:(LYBaseAPIRequest *)currentRequest withMsg:(NSString *)msg
{
    // -9是积分不足(有自己的弹框，所以不用再弹)
    NSInteger code = currentRequest.responseData.code;
    if (!self.disableErrorTip && code != -14 && code != -9) {
        [kWindow makeToast:msg duration:2 position:CSToastPositionCenter];
    }
    
    if ([currentRequest isKindOfClass:[LYPageAPIRequest class]]) {
        if (currentRequest.responseData) {
            
            
        }else
        {
            //            LCHTTPErrorView * errorView = [LCHTTPErrorView new];
            //            errorView.frame = CGRectMake(100, 200, 100, 100);
            //            errorView.backgroundColor = [UIColor redColor];
            //            [self.hudSuperView addSubview:errorView];
        }
    }
    if (currentRequest.responseData.code == -14 && currentRequest.autoPushLoginVC) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self toLogin];
        });
    }
    
    //    UIAlertController * alertVC = [UIAlertController alertControllerWithTitle:@"ล้มเหลว" message:msg preferredStyle:UIAlertControllerStyleAlert];
    //    UIAlertAction * cancelAction  = [UIAlertAction actionWithTitle:[NSBundle lc_localizedStringForKey:@"lc_cancel"] style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    //
    //    }];
    //    UIAlertAction * sureAction = [UIAlertAction actionWithTitle:[NSBundle lc_localizedStringForKey:@"lc_retry"] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    //        [currentRequest loadDataWithHUDOnView:kWindow];
    //    }];
    //    [alertVC addAction:cancelAction];
    //    [alertVC addAction:sureAction];
    //    [[self currentViewController] presentViewController:alertVC animated:YES completion:nil];
}
- (UIViewController *)currentViewController {
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    UINavigationController * navc = (UINavigationController *)keyWindow.rootViewController;
    UITabBarController * tabBarVC = (UITabBarController *)navc.topViewController;
    UIViewController * vc = nil;//[tabBarVC.view viewController];
    return vc;
}
#pragma mark - ☞ 🐶 ●去登录● 🐶
- (void) toLogin
{
  
}

#pragma mark - ☞ 🐶 ●中奖弹框● 🐶


#pragma mark - private methods
- (void)cancelAllRequests
{
    [[LYBaseAPIProxy sharedInstance] cancelRequestWithRequestIDList:self.requestIdList];
    [self.requestIdList removeAllObjects];
}

- (void)cancelRequestWithRequestId:(NSInteger)requestID
{
    [self removeRequestIdWithRequestID:requestID];
    [[LYBaseAPIProxy sharedInstance] cancelRequestWithRequestID:@(requestID)];
}

- (void)removeRequestIdWithRequestID:(NSInteger)requestId
{
    NSNumber *requestIDToRemove = nil;
    for (NSNumber *storedRequestId in self.requestIdList) {
        if ([storedRequestId integerValue] == requestId) {
            requestIDToRemove = storedRequestId;
        }
    }
    if (requestIDToRemove) {
        [self.requestIdList removeObject:requestIDToRemove];
    }
}




#pragma mark - getters and setters
- (BOOL)isReachable
{
    if ([AFNetworkReachabilityManager sharedManager].networkReachabilityStatus == AFNetworkReachabilityStatusUnknown) {
        return YES;
    } else {
        return [[AFNetworkReachabilityManager sharedManager] isReachable];
    }
}

- (NSMutableArray *)requestIdList
{
    if (_requestIdList == nil) {
        _requestIdList = [[NSMutableArray alloc] init];
    }
    return _requestIdList;
}

@end
