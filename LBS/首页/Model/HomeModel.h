//
//  HomeModel.h
//  LBS
//
//  Created by 孙云飞 on 2016/12/12.
//  Copyright © 2016年 孙云飞. All rights reserved.
//

#import "SYFBaseModel.h"

@interface HomeModel : SYFBaseModel
@property(nonatomic,copy)NSString *title;//标题
@property(nonatomic,copy)NSString *date;//时间
@property(nonatomic,copy)NSString *author_name;//作者
@property(nonatomic,copy)NSString *thumbnail_pic_s;
@property(nonatomic,copy)NSString *thumbnail_pic_s02;
@property(nonatomic,copy)NSString *thumbnail_pic_s03;
@property(nonatomic,copy)NSString *url;
@property(nonatomic,copy)NSString *type;
@property(nonatomic,copy)NSString *realtype;
@end
