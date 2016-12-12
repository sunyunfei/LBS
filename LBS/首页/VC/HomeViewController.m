//
//  HomeViewController.m
//  LBS
//
//  Created by 孙云飞 on 2016/12/10.
//  Copyright © 2016年 孙云飞. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeCell.h"
#import "DetailViewController.h"
#import "HomeModel.h"
#import "CoreScrollView.h"
static NSString * const home_cell = @"HomeCell";
@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource,CoreScrollViewDelegate>{

    NSInteger index;//上拉刷新界面下标控制
}
@property(nonatomic,strong)UITableView *tableView;//数据表
@property(nonatomic,strong)NSMutableArray *homeArray;//数据
@property(nonatomic,strong)NSArray *typeArray;//类型数据
@property(nonatomic,strong)CoreScrollView *headView;//表头
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.homeArray = [NSMutableArray array];
    index = -1;//初始值为空
    self.typeArray = @[@"top",@"shehui",@"guonei",@"guoji",@"yule",@"tiyu",@"junshi",@"keji",@"caijing",@"shishang"];
    [self p_loadTableView];
    [self p_loadData2];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//数据加载
- (void)p_loadData{

    index ++;
    //判断index是否下标越界了
    if (index >= self.typeArray.count) {
        //不再刷新，没有内容了
        NSLog(@"无内容了");
        return;
    }
    //数据加载
    NSString *type = self.typeArray[index];
    __weak typeof(self)weakSelf = self;
    [self homeHttpRequest:type andCompletionBlock:^(id respond, id error) {
        if (!error) {
            for (NSDictionary *dic in respond) {
                HomeModel *model = [HomeModel modelWithDict:dic];
                [weakSelf.homeArray addObject:model];
                dispatch_async(dispatch_get_main_queue(), ^{
                   
                    [weakSelf.tableView reloadData];
                    [weakSelf.tableView.mj_footer endRefreshing];
                });
            }
        }else{
        
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [weakSelf.tableView.mj_footer endRefreshing];
            });
            NSLog(@"有网络错误");
            index --;
            if (index < -1) {
                index = -1;
            }
        }
        
    }];
}
- (void)p_loadData2{

    index = 0;
    [self.homeArray removeAllObjects];
    //数据加载
    NSString *type = self.typeArray[index];
    __weak typeof(self)weakSelf = self;
    [self homeHttpRequest:type andCompletionBlock:^(id respond, id error) {
        if (!error) {
            for (NSDictionary *dic in respond) {
                HomeModel *model = [HomeModel modelWithDict:dic];
                [weakSelf.homeArray addObject:model];
                dispatch_async(dispatch_get_main_queue(), ^{
                    weakSelf.headView.headerArray = @[[weakSelf.homeArray firstObject],weakSelf.homeArray[weakSelf.homeArray.count - 2],weakSelf.homeArray.lastObject];
                    [weakSelf.tableView reloadData];
                    [weakSelf.tableView.mj_header endRefreshing];
                });
            }
        }else{
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [weakSelf.tableView.mj_header endRefreshing];
            });
            NSLog(@"有网络错误");
            index --;
            if (index < -1) {
                index = -1;
            }
        }
        
    }];
}
#pragma mark ---- ui加载
- (void)p_loadTableView{
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    //注册cell
    [self.tableView registerNib:[UINib nibWithNibName:home_cell bundle:nil] forCellReuseIdentifier:home_cell];
    [self.view addSubview:self.tableView];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self p_loadHeaderView];
    //上拉刷新
     self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(p_loadData)];
    //下拉刷新
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(p_loadData2)];
    // 设置自动切换透明度(在导航栏下面自动隐藏)
    header.automaticallyChangeAlpha = YES;
    // 隐藏时间
    header.lastUpdatedTimeLabel.hidden = YES;
    // 马上进入刷新状态
    [header beginRefreshing];
    // 设置header
    self.tableView.mj_header = header;
}

- (void)p_loadHeaderView{

    self.headView = [[CoreScrollView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) / 3)];
    self.headView.delegate = self;
    self.tableView.tableHeaderView = self.headView;
}
#pragma mark --- 表代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.homeArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:home_cell forIndexPath:indexPath];
    cell.homeModel = self.homeArray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 100;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //跳转界面
    self.hidesBottomBarWhenPushed=YES;
    DetailViewController *detailVC = [[DetailViewController alloc]init];
    detailVC.homeModel = self.homeArray[indexPath.row];
    [self.navigationController pushViewController:detailVC animated:YES];
    self.hidesBottomBarWhenPushed=NO;
}

#pragma mark ----代理
//传递点击数据
- (void)tranTapEventToVC:(HomeModel *)model{

    //跳转界面
    self.hidesBottomBarWhenPushed=YES;
    DetailViewController *detailVC = [[DetailViewController alloc]init];
    detailVC.homeModel = model;
    [self.navigationController pushViewController:detailVC animated:YES];
    self.hidesBottomBarWhenPushed=NO;
}
@end
