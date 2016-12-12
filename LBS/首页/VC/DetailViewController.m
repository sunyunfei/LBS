//
//  DetailViewController.m
//  LBS
//
//  Created by 孙云飞 on 2016/12/12.
//  Copyright © 2016年 孙云飞. All rights reserved.
//

#import "DetailViewController.h"
#import <WebKit/WebKit.h>
@interface DetailViewController ()<WKUIDelegate>
@property(nonatomic,strong)WKWebView *webView;//加载网页
@property(nonatomic,strong)UIProgressView *progressView;//进度条
@end

@implementation DetailViewController
- (void)dealloc{

    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"加载中...";
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)setHomeModel:(HomeModel *)homeModel{

    _homeModel = homeModel;
    self.webView = [[WKWebView alloc]initWithFrame:self.view.bounds];
    self.webView.UIDelegate = self;
    [self.view addSubview:self.webView];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:homeModel.url]]];
    [self p_loadProView];
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
}

//加载进度条
- (void)p_loadProView{
    
    self.progressView = [[UIProgressView alloc]initWithFrame:CGRectMake(0,64,CGRectGetWidth(self.view.frame), 2)];
    self.progressView.tintColor = [UIColor redColor];
    [self.view addSubview:self.progressView];
}

//kvo方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{

    if ([keyPath isEqualToString:@"estimatedProgress"]) {
        
        self.progressView.progress = self.webView.estimatedProgress;
    }
    
    if (object == self.webView && [keyPath isEqualToString:@"estimatedProgress"]) {
        CGFloat newprogress = [[change objectForKey:NSKeyValueChangeNewKey] doubleValue];
        if (newprogress == 1) {
            self.progressView.hidden = YES;
            [self.progressView setProgress:0 animated:NO];
            self.title = self.homeModel.title;
        }else {
            self.progressView.hidden = NO;
            [self.progressView setProgress:newprogress animated:YES];
        }
    }
}
/// 5 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{

    NSLog(@"开始");
}
/// 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation{

    NSLog(@"失败");
}
@end
