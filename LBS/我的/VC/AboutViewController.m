//
//  AboutViewController.m
//  LBS
//
//  Created by 孙云飞 on 2016/12/10.
//  Copyright © 2016年 孙云飞. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"关于";
    UITextView *textView = [[UITextView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))];
    NSString *str = @"爱发现提醒您：\n在使用爱发现平台各项服务前，请您务必仔细阅读并透彻理解本声明。您可以选择不使用爱发现新闻服务，但如果您使用爱发现新闻服务的，您的使用行为将被视为对本声明全部内容的认可。“爱发现”指由本人运营的新闻阅读平台。\n\n一、知识产权声明\n本人拥有爱发现App内所有信息内容（包括但不限于文字、图片、软件、音频、视频）的版权。任何被授权的浏览、复制、打印和传播属于爱发现平台网站内信息内容都不得用于商业目的且所有信息内容及其任何部分的使用都必须包括此版权声明；爱发现平台所有的产品、技术与所有程序均属于本人知识产权。“爱发现”以及爱发现其他产品服务名称及相关图形、标识等为本人的注册商标。未经许可，任何人不得擅自（包括但不限于：以非法的方式复制、传播、展示、镜像、上载、下载）使用。否则，本人将依法追究法律责任。\n\n二、隐私声明\n爱发现非常重视对您的个人隐私保护，有时候我们需要某些信息才能为您提供您请求的服务，本隐私声明解释了这些情况下的数据收集和使用情况。爱发现会在法律要求或符合爱发现的相关服务条款、软件许可使用协议约定的情况下透露您的个人信息，或者有如下充分理由时：\n(a) 满足法律或行政法规的明文规定，或者符合爱发现适用的法律程序；\n(b）符合爱发现相关服务条款、软件许可使用协议的约定；\n(c) 保护爱发现的权利或财产，以及在紧急情况下保护爱发现产品或服务的用户或大众的个人安全。除本声明已经列出的上述情况外，爱发现不会未经您的允许将这些信息与第三方共享。\n\n三、免责声明\n注册用户将用户密码告知他人或与他人共享注册账户，由此导致的任何个人信息的泄漏，或其他非因爱发现原因导致的个人信息的泄漏，爱发现不承担任何法律责任；任何第三方根据爱发现规则列明的情况使用您的个人信息，由此所产生的纠纷，爱发现不承认任何法律责任；任何由于黑客攻击、电脑病毒侵入或政府管制而造成的暂时性网站关闭，爱发现不承担任何法律责任；我们鼓励用户充分利用爱发现平台自由地发表自己的评论和意见，用户在爱发现发表的内容（包含但不限于爱发现目前各产品功能里的内容）仅表明其个人的立场和观点，并不代表爱发现的立场或观点。对免责声明的解释、修改及更新权均属于爱发现所有。";
    [textView setEditable:NO];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineSpacing              = 8;
    NSDictionary *attributes                = @{ NSParagraphStyleAttributeName:paragraphStyle};
    textView.attributedText            = [[NSAttributedString alloc]
                                          initWithString:str
                                          attributes:attributes];
    textView.font           = [UIFont fontWithName:@"PingFang SC Smibold" size:14.f];
    textView.font= [UIFont boldSystemFontOfSize:14.f];
    
    [self.view addSubview:textView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
