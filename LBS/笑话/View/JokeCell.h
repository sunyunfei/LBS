//
//  JokeCell.h
//  LBS
//
//  Created by 孙云飞 on 2016/12/12.
//  Copyright © 2016年 孙云飞. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JokeModel.h"
@interface JokeCell : UITableViewCell
@property(nonatomic,strong)JokeModel *jokeModel;
+ (CGFloat)cellHeightForModel:(JokeModel *)model;//高度
@end
