// LYPageAPIRequest.m 
// Lucky 
// 
// Created by 赵良育 on 2018/11/20. 
// Copyright © 2018 赵良育. All rights reserved. 
// 

#import "LYPageAPIRequest.h"

@implementation LYPageAPIRequest
- (id)init {
    self = [super init];
    if (self) {
        self.currentPage = 1;
    }
    return self;
}

- (id)initWithDelegate:(id)delegate paramSource:(id)paramSource {
    self = [super initWithDelegate:delegate paramSource:paramSource];
    if (self) {
        self.currentPage = 1;
    }
    return self;
}

- (NSUInteger)pageSize {
    return 10;
}

- (NSDictionary *)reformParamsForApi:(NSDictionary *)params
{
    NSMutableDictionary *newParmas = params?[params mutableCopy]:[NSMutableDictionary dictionary];
    [newParmas setObject:[NSNumber numberWithInteger:self.currentPage] forKey:@"page"];
    [newParmas setObject:[NSNumber numberWithInteger:self.load_id] forKey:@"id"];
    return newParmas;
}

- (void)reformData
{
    if (_currentPage == 1) {
        [self.listArray removeAllObjects];
    }
    
    NSArray *array = nil;
    if ([self.responseData respondsToSelector:@selector(buildPageArray)]) {
        array = [self.responseData performSelector:@selector(buildPageArray)];
        
    } else if ([self.responseData isKindOfClass:[NSArray class]]) {
        array = (NSArray *)self.responseData;
    }
    self.moreData = NO;
    if ([array count] > 0) {
        self.moreData = [array count] >= [self pageSize] ? YES : NO;
        self.currentPage ++;
        [self.listArray addObjectsFromArray:array];
    }
}

- (void)reload {
    self.currentPage = 1;
    [self loadDataWithHUDOnView:nil];
}

- (void)reloadOnView:(UIView *)view
{
    self.currentPage = 1;
    [self loadDataWithHUDOnView:view];
}

- (void)reloadOnView:(UIView *)view page:(NSInteger)page
{
    self.currentPage = page;
    [self loadDataWithHUDOnView:view];
}

- (NSString *)requestPath
{
    return [self.child requestPath];
}

- (APIManagerRequestType)requestType
{
    return [self.child requestType];
}

- (NSMutableArray *)listArray {
    if (!_listArray) {
        _listArray = [NSMutableArray array];
    }
    return _listArray;
}

@end
