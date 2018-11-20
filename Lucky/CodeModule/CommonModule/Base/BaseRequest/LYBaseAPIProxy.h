// LYBaseAPIProxy.h 
// Lucky 
// 
// Created by 赵良育 on 2018/11/20. 
// Copyright © 2018 赵良育. All rights reserved. 
// 
/**
    类描述
 */


#import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>
#import "AFURLRequestSerialization.h"
#import "AFURLResponseSerialization.h"
#import "LYBaseAPIResponse.h"
//#import "LCURLString.h"

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM (NSUInteger, APIManagerRequestType){
    APIManagerRequestTypeGet,
    APIManagerRequestTypePost,
    APIManagerRequestTypeUpload,
    APIManagerRequestTypeDelete,
    APIManagerRequestTypePut
};

typedef void(^APICallback)(LYBaseAPIResponse *response);

@interface LYBaseAPIProxy : NSObject

@property (nonatomic, strong) AFHTTPRequestSerializer <AFURLRequestSerialization> * requestSerializer;
@property (nonatomic, strong) AFHTTPResponseSerializer <AFURLResponseSerialization> * responseSerializer;

+ (instancetype)sharedInstance;

- (NSInteger)callAPIWithRequestType:(APIManagerRequestType)requestType params:(NSDictionary *)params requestPath:(NSString *)requestPath uploadBlock:(void (^)(id <AFMultipartFormData> formData))uploadBlock success:(APICallback)success fail:(APICallback)fail;

- (void)cancelRequestWithRequestID:(NSNumber *)requestID;
- (void)cancelRequestWithRequestIDList:(NSArray *)requestIDList;

@end
NS_ASSUME_NONNULL_END
