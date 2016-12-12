//
//  JokeCell.m
//  LBS
//
//  Created by 孙云飞 on 2016/12/12.
//  Copyright © 2016年 孙云飞. All rights reserved.
//

#import "JokeCell.h"
@interface JokeCell()
@property(nonatomic,strong)UILabel *contentLabel;//内容
@property(nonatomic,strong)UILabel *timeLabel;//时间
@end
@implementation JokeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.timeLabel =[[UILabel alloc]initWithFrame:CGRectZero];
        self.timeLabel.font = [UIFont systemFontOfSize:12];
        self.timeLabel.textColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.5];
        [self.contentView addSubview:self.timeLabel];
        
        self.contentLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        self.contentLabel.textColor = [UIColor lightGrayColor];
        self.contentLabel.font = [UIFont systemFontOfSize:14];
        self.contentLabel.numberOfLines = 0;
        [self.contentView addSubview:self.contentLabel];
    }
    return self;
}

- (void)setJokeModel:(JokeModel *)jokeModel{

    _jokeModel = jokeModel;
    self.timeLabel.text = jokeModel.updatetime;
    self.timeLabel.frame = CGRectMake(15, 15,K_W - 30,20);
    self.contentLabel.text = jokeModel.content;
    CGSize contentSize = [jokeModel.content boundingRectWithSize:CGSizeMake(K_W - 30, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size;
    self.contentLabel.frame = CGRectMake(15, CGRectGetHeight(self.timeLabel.frame) + 15 + 5, K_W - 30, contentSize.height);
    
}

+ (CGFloat)cellHeightForModel:(JokeModel *)model{

    CGSize contentSize = [model.content boundingRectWithSize:CGSizeMake(K_W - 30, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size;
    return 15 + 20 + 15 + 5 + contentSize.height;
}

@end
