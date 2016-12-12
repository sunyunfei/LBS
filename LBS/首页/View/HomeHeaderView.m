//
//  HomeHeaderView.m
//  LBS
//
//  Created by 孙云飞 on 2016/12/12.
//  Copyright © 2016年 孙云飞. All rights reserved.
//

#import "HomeHeaderView.h"
#import "HeaderCell.h"
static NSString * const header_cell = @"HeaderCell";
@interface HomeHeaderView()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)NSArray *dataArray;//数据
@end
@implementation HomeHeaderView

- (instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        
        //加载collectionview
        [self p_loadCollectionView];
    }
    return self;
}
//加载collectionView
- (void)p_loadCollectionView{

    UICollectionViewFlowLayout *f = [[UICollectionViewFlowLayout alloc]init];
    f.itemSize = CGSizeMake(CGRectGetWidth(self.frame) / 6, CGRectGetHeight(self.frame));
    f.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    f.minimumLineSpacing = 0;
    f.minimumInteritemSpacing = 0;
    self.collectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:f];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerNib:[UINib nibWithNibName:header_cell bundle:nil] forCellWithReuseIdentifier:header_cell];
    [self addSubview:self.collectionView];
}

- (NSArray *)dataArray{

    if (!_dataArray) {
        _dataArray = @[@"头条",@"社会",@"国内",@"国际",@"娱乐",@"体育",@"军事",@"科技",@"财经",@"时尚"];
    }
    return _dataArray;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return self.dataArray.count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    HeaderCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:header_cell forIndexPath:indexPath];
    return cell;
}
@end
