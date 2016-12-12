//
//  NSObject+AFN.h
//  LBS
//
//  Created by 孙云飞 on 2016/12/12.
//  Copyright © 2016年 孙云飞. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (AFN)
//首页数据请求
- (void)homeHttpRequest:(NSString *)type andCompletionBlock:(void(^)(id respond,id error))block;
//笑话数据请求
- (void)jokeHttpRequest:(int)page andTime:(NSString *)time andCompletionBlock:(void(^)(id respond,id error))block;
@end
