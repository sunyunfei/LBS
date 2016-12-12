//
//  MoveViewController.m
//  LBS
//
//  Created by 孙云飞 on 2016/12/10.
//  Copyright © 2016年 孙云飞. All rights reserved.
//

#import "MoveViewController.h"
#import "MoveCell.h"
static NSString * const cell_move = @"MoveCell";
@interface MoveViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *moveArray;
@end

@implementation MoveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self p_loadTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark ---- ui加载
- (void)p_loadTableView{
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    //注册cell
    [self.tableView registerNib:[UINib nibWithNibName:cell_move bundle:nil] forCellReuseIdentifier:cell_move];
    [self.view addSubview:self.tableView];
    //self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //上拉刷新
    //self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(p_loadJokeData)];
    //下拉刷新
//    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(p_loadJokeData2)];
//    // 设置自动切换透明度(在导航栏下面自动隐藏)
//    header.automaticallyChangeAlpha = YES;
//    // 隐藏时间
//    header.lastUpdatedTimeLabel.hidden = YES;
//    // 马上进入刷新状态
//    [header beginRefreshing];
//    // 设置header
//    self.tableView.mj_header = header;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MoveCell *cell = [tableView dequeueReusableCellWithIdentifier:cell_move forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 200;
}
@end
