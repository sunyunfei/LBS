//
//  JokeModel.h
//  LBS
//
//  Created by 孙云飞 on 2016/12/12.
//  Copyright © 2016年 孙云飞. All rights reserved.
//

#import "SYFBaseModel.h"

@interface JokeModel : SYFBaseModel
@property(nonatomic,strong)NSString *content;
@property(nonatomic,strong)NSString *updatetime;
@property(nonatomic,assign)int unixtime;
@property(nonatomic,strong)NSString *hashId;
@end
