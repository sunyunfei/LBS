//
//  NSObject+AFN.m
//  LBS
//
//  Created by 孙云飞 on 2016/12/12.
//  Copyright © 2016年 孙云飞. All rights reserved.
//

#import "NSObject+AFN.h"
#import "AFNetworking.h"
static AFHTTPRequestOperationManager *manager;//单例创建
@implementation NSObject (AFN)
#pragma mark  ------http请求
//afn的内存泄漏解决
//单例创建afn，因为有内存泄漏
-(AFHTTPRequestOperationManager *)sharedHTTPSession{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [AFHTTPRequestOperationManager manager];
        manager.requestSerializer.timeoutInterval = 10;
    });
    return manager;
}
//请求接口
-(void)AFNsetting:(NSString *)httpStr param:(NSDictionary *)param andCompletionBlock:(void(^)(id respond,id error))block{
    
    AFHTTPRequestOperationManager *manager = [self sharedHTTPSession];
    manager.responseSerializer=[AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html", @"text/json", @"text/javascript",@"text/plain", nil];
    
    [manager GET:httpStr parameters:param success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        block(responseObject,nil);
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        block(nil,error);
    }];
//    [manager POST:httpStr parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        block(responseObject,nil);
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        block(nil,error);
//    }];
}

//首页数据请求
- (void)homeHttpRequest:(NSString *)type andCompletionBlock:(void(^)(id respond,id error))block{

    NSString *http = @"http://v.juhe.cn/toutiao/index";
    NSDictionary *dic = @{@"type":type,@"key":@"848c3f852e0471b53e966832570d7308"};
    [self AFNsetting:http param:dic andCompletionBlock:^(id respond, id error) {
        NSDictionary *respond2 = respond[@"result"];
        block(respond2[@"data"],error);
    }];
}

//笑话数据请求
- (void)jokeHttpRequest:(int)page andTime:(NSString *)time andCompletionBlock:(void(^)(id respond,id error))block{

    NSString *http = @"http://japi.juhe.cn/joke/content/list.from";
    NSDictionary *dic = @{@"sort":@"desc",@"page":[NSString stringWithFormat:@"%d",page],@"pagesize":@"20",@"time":time,@"key":@"4fe6c22709de83b669fec46cfc281f23"};
    [self AFNsetting:http param:dic andCompletionBlock:^(id respond, id error) {
        NSDictionary *respond2 = respond[@"result"];
        block(respond2[@"data"],error);
    }];
}
@end
