//
//  HomeCell.m
//  BSProject
//
//  Created by 孙云飞 on 2016/12/11.
//
//

#import "HomeCell.h"
@interface HomeCell()
@property (weak, nonatomic) IBOutlet UIImageView *cellIcon;
@property (weak, nonatomic) IBOutlet UILabel *cellOrigin;
@property (weak, nonatomic) IBOutlet UILabel *cellType;
@property (weak, nonatomic) IBOutlet UILabel *cellDate;
@property (weak, nonatomic) IBOutlet UILabel *cellTitle;


@end
@implementation HomeCell

- (void)setHomeModel:(HomeModel *)homeModel{

    _homeModel = homeModel;
    if (homeModel) {
        self.cellType.text = homeModel.type;
        self.cellTitle.text = homeModel.title;
        self.cellDate.text = homeModel.date;
        self.cellOrigin.text = homeModel.author_name;
        [self.cellIcon sd_setImageWithURL:[NSURL URLWithString:homeModel.thumbnail_pic_s]];
    }
}
@end
