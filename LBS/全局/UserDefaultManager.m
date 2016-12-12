//
//  UserDefaultManager.m
//  YangLiWu
//
//  Created by 孙云 on 16/8/30.
//  Copyright © 2016年 haidai. All rights reserved.
//

#import "UserDefaultManager.h"

@implementation UserDefaultManager
//创建偏好设置,存储信息
+ (void)saveMessageForLocation:(NSString *)name message:(id)message{

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:message forKey:name];
    [defaults synchronize];
}
//存储bool信息
+ (void)saveMessageForLocation:(NSString *)name boolMessage:(BOOL)message{

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:message forKey:name];
    [defaults synchronize];
}

//取出存在偏好设置里面的信息
+ (id)getOutMessageForLocation:(NSString *)name{

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:name];
}

//取出bool信息
+ (BOOL)getOutBoolMessageForLocation:(NSString *)name{

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults boolForKey:name];
}

//删除存在偏好设置里面的信息
+ (void)deleteMessageForLocation:(NSString *)name{

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:name];
    [defaults synchronize];
}
@end
