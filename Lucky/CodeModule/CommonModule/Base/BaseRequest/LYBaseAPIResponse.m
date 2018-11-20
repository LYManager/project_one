// LYBaseAPIResponse.m 
// Lucky 
// 
// Created by 赵良育 on 2018/11/20. 
// Copyright © 2018 赵良育. All rights reserved. 
// 

#import "LYBaseAPIResponse.h"
#import "NSObject+YYModel.h"
#import "NSObject+Additions.h"
@interface LYBaseAPIResponse ()
@property (nonatomic, assign, readwrite)NSInteger httpStatusCode;
@property (nonatomic, assign, readwrite)APIManagerErrorType errorType;
@property (nonatomic, assign, readwrite)id responseData;
@end

@implementation LYBaseAPIResponse
- (instancetype)initWithRequestId:(NSNumber *)requestId responseObject:(id)responseObject urlResponse:(NSHTTPURLResponse *)urlResponse
{
    self = [super init];
    if (self) {
        self.httpStatusCode = urlResponse.statusCode;
        self.responseData = responseObject;
    }
    return self;
}

- (instancetype)initWithRequestId:(NSNumber *)requestId urlResponse:(NSHTTPURLResponse *)urlResponse error:(NSError *)error
{
    self = [super init];
    if (self) {
        self.httpStatusCode = urlResponse.statusCode;
        self.msg = [self handelError:error];
        if (self.httpStatusCode==11010) {
            self.errorType = APIManagerErrorLoginTimeout;
        }
    }
    return self;
}

- (NSString *)handelError:(NSError*)error {
    NSString *errorMsg = @"";// Tip_RequestError;
    if (error) {
        NSData *responseData = error.userInfo[@"com.alamofire.serialization.response.error.data"];
        if (responseData) {
            NSDictionary *response = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:NULL];
            if ([response isKindOfClass:[NSDictionary class]]) {
                errorMsg = safeString(response[@"msg"]);
                return errorMsg;
            }
        }
        if (safeNumber(error.userInfo[@"_kCFStreamErrorCodeKey"]).integerValue==-2102) {
            errorMsg =  @"";// Tip_RequestOutTime;
        }
    }
    return errorMsg;
}

@end

@implementation BaseResponse
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
//             @"win_msg":[LCWinMessageModel class]
             };
}
@end

@implementation PageModel
- (id)copyWithZone:(NSZone *)zone
{
    return [self modelCopy];
}
@end


