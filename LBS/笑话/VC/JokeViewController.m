//
//  JokeViewController.m
//  LBS
//
//  Created by 孙云飞 on 2016/12/10.
//  Copyright © 2016年 孙云飞. All rights reserved.
//

#import "JokeViewController.h"
#import "JokeCell.h"
#import "JokeModel.h"
static NSString *const cell_joke = @"JokeCell";
@interface JokeViewController ()<UITableViewDelegate,UITableViewDataSource>{

    int index;//页数
}
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *jokeArray;//数据
@property(nonatomic,copy)NSString *timerStr;//时间戳
@end

@implementation JokeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    index = 1;//初始页数
    self.jokeArray = [NSMutableArray array];
    [self p_loadTableView];
    [self p_loadJokeData2];
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
    [self.tableView registerClass:[JokeCell class] forCellReuseIdentifier:cell_joke];
    [self.view addSubview:self.tableView];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //上拉刷新
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(p_loadJokeData)];
    //下拉刷新
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(p_loadJokeData2)];
    // 设置自动切换透明度(在导航栏下面自动隐藏)
    header.automaticallyChangeAlpha = YES;
    // 隐藏时间
    header.lastUpdatedTimeLabel.hidden = YES;
    // 马上进入刷新状态
    [header beginRefreshing];
    // 设置header
    self.tableView.mj_header = header;
}
#pragma mark ----数据加载
//返回时间戳
- (NSString *)timerStr{

    if (!_timerStr) {
        NSTimeInterval interval = [[[NSDate alloc]init] timeIntervalSince1970];
        _timerStr = [NSString stringWithFormat:@"%f",interval];
        //只要前十位
        _timerStr = [_timerStr substringToIndex:10];
    }
    return _timerStr;
}

- (void)p_loadJokeData{

    index ++;
    __weak typeof(self)weakSelf = self;
    [self jokeHttpRequest:index andTime:self.timerStr andCompletionBlock:^(id respond, id error) {
        
        if(!error){
        
            for (NSDictionary *dic in respond) {
                JokeModel *model = [JokeModel modelWithDict:dic];
                [weakSelf.jokeArray addObject:model];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [weakSelf.tableView reloadData];
                [weakSelf.tableView.mj_footer endRefreshing];
            });
        }else{
        
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [weakSelf.tableView.mj_footer endRefreshing];
            });
            NSLog(@"数据错误");
            index --;
        }
    }];
}

- (void)p_loadJokeData2{

    [self.jokeArray removeAllObjects];
    index = 1;
    __weak typeof(self)weakSelf = self;
    [self jokeHttpRequest:index andTime:self.timerStr andCompletionBlock:^(id respond, id error) {
        
        if(!error){
            
            for (NSDictionary *dic in respond) {
                JokeModel *model = [JokeModel modelWithDict:dic];
                [weakSelf.jokeArray addObject:model];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [weakSelf.tableView reloadData];
                [weakSelf.tableView.mj_header endRefreshing];
            });
        }else{
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
             [weakSelf.tableView.mj_header endRefreshing];
            });
            NSLog(@"数据错误");
        }
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.jokeArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    JokeCell *cell = [tableView dequeueReusableCellWithIdentifier:cell_joke forIndexPath:indexPath];
    cell.jokeModel = self.jokeArray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return [JokeCell cellHeightForModel:self.jokeArray[indexPath.row]];
}
@end
