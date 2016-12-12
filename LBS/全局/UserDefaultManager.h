//
//  UserDefaultManager.h
//  YangLiWu
//
//  Created by 孙云 on 16/8/30.
//  Copyright © 2016年 haidai. All rights reserved.
//
//偏好设置存储信息的管理类
#import <Foundation/Foundation.h>

@interface UserDefaultManager : NSObject
//创建偏好设置,存储信息
+ (void)saveMessageForLocation:(NSString *)name message:(id)message;
+ (void)saveMessageForLocation:(NSString *)name boolMessage:(BOOL)message;
//取出存在偏好设置里面的信息
+ (id)getOutMessageForLocation:(NSString *)name;
+ (BOOL)getOutBoolMessageForLocation:(NSString *)name;
//删除存在偏好设置里面的信息
+ (void)deleteMessageForLocation:(NSString *)name;

@end
