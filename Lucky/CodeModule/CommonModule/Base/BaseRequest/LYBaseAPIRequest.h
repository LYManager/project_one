// LYBaseAPIRequest.h 
// Lucky 
// 
// Created by 赵良育 on 2018/11/20. 
// Copyright © 2018 赵良育. All rights reserved. 
// 
/**
    类描述
 */


#import <Foundation/Foundation.h>
#import "LYBaseAPIProxy.h"
#import "LYURLCommon.h"
NS_ASSUME_NONNULL_BEGIN

@class LYPageAPIRequest;
#define kWindow  [UIApplication sharedApplication].keyWindow
@class LYBaseAPIRequest;
/*---------------------API回调-----------------------*/
@protocol APIManagerApiCallBackDelegate <NSObject>
@required
- (void)managerCallAPIDidSuccess:(LYBaseAPIRequest *)request;
- (void)managerCallAPIDidFailed:(LYBaseAPIRequest *)request;
@end

/*---------------------API参数-----------------------*/
@protocol APIManagerParamSourceDelegate <NSObject>
@required
- (NSDictionary *)paramsForApi:(LYBaseAPIRequest *)request;
@optional
- (void (^)(id <AFMultipartFormData> formData))uploadBlock:(LYBaseAPIRequest *)request;
@end

/*---------------------API验证器-----------------------*/
@protocol APIManagerValidator <NSObject>
@required
- (BOOL)manager:(LYBaseAPIRequest *)request isCorrectWithCallBackData:(BaseResponse *)data;
@end

/*---------------------APIManager-----------------------*/

@protocol APIManager <NSObject>
@optional
- (Class)responseClass;
- (AFHTTPRequestSerializer <AFURLRequestSerialization> *)requestSerializer;
- (AFHTTPResponseSerializer <AFURLResponseSerialization> *)responseSerializer;
- (NSDictionary *)reformParamsForApi:(NSDictionary *)params;
- (void)reformData;
@required
- (NSString *)requestPath;
- (APIManagerRequestType)requestType;

@end
typedef void(^SuccessBlock) (id dataModel);  // 成功返回数据
typedef void(^FailBlock) (void);                       // 失败
typedef void (^SuccessNoDataBlock)(void);   // 无数据成功
typedef void(^FailCodeBlock) (NSInteger code); // 带错误码的
@interface LYBaseAPIRequest : NSObject
@property (nonatomic, weak) id<APIManagerApiCallBackDelegate> delegate;
@property (nonatomic, weak) id<APIManagerParamSourceDelegate> paramSource;
@property (nonatomic, weak) id<APIManagerValidator> validator;
@property (nonatomic, weak) id<APIManager> child;
@property (nonatomic, assign, readonly) BOOL isReachable;
@property (nonatomic, strong) BaseResponse *responseData;
@property (nonatomic, assign, readonly)APIManagerErrorType errorType;
@property (nonatomic, copy) NSString *msg;
@property (nonatomic, assign) BOOL disableErrorTip;
/**🐶如果未登录是否自动弹出登录    👇*/
@property(nonatomic,assign)BOOL autoPushLoginVC;
/**🐶关闭中奖弹框    👇*/
@property(nonatomic,assign)BOOL closeJiangPush;

-(instancetype)initWithDelegate:(id)delegate paramSource:(id)paramSource;
- (NSInteger)loadDataWithHUDOnView:(UIView *)view;
- (NSInteger)loadDataWithHUDOnView:(UIView *)view HUDMsg:(NSString *)HUDMsg;
- (void)cancelAllRequests;
- (void)cancelRequestWithRequestId:(NSInteger)requestID;
@end


NS_ASSUME_NONNULL_END
