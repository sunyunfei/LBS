//
//  MineViewController.m
//  LBS
//
//  Created by 孙云飞 on 2016/12/10.
//  Copyright © 2016年 孙云飞. All rights reserved.
//

#import "MineViewController.h"

@interface MineViewController ()
@property (weak, nonatomic) IBOutlet UIButton *iconBtn;//头像
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
- (IBAction)clickIconBtn:(UIButton *)sender;//点击头像事件

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //name赋值
    if(![[UserDefaultManager getOutMessageForLocation:local_name] isEqualToString:@""])
    self.nameLabel.text = [UserDefaultManager getOutMessageForLocation:local_name];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//按钮事件
- (IBAction)clickIconBtn:(UIButton *)sender {
    
}

#pragma mark ----表的事件

//点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //创建弹窗
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    
    if (indexPath.section == 0) {
        
        switch (indexPath.row) {
            case 0:{
            
                alertVC.title = @"更改名字";
                alertVC.message = @"请填写新的名字";
                UIAlertAction *alert1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
                UIAlertAction *alert2 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    
                    UITextField *text = alertVC.textFields.firstObject;
                    self.nameLabel.text = text.text;
                    [UserDefaultManager saveMessageForLocation:text.text message:local_name];
                }];
                [alertVC addAction:alert1];
                [alertVC addAction:alert2];
                [alertVC addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
                    textField.placeholder=@"输入名字";
                    
                }];
                
            }
                break;
            case 1:{
                alertVC.message = @"亲爱的用户您好，您还没有可用的卡包";
               UIAlertAction *alert = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
                [alertVC addAction:alert];
            }
                break;
            case 2:{
                alertVC.message = @"亲爱的用户您好，您的积分为:0";
                UIAlertAction *alert = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
                [alertVC addAction:alert];
            }
                break;
            default:
                break;
        }
        //调出弹窗
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertVC animated:YES completion:nil];
    }else{
    
        //创建弹窗
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        switch (indexPath.row) {
            case 0:{
                alertVC.message = @"您好，您已经是最新版本";
                UIAlertAction *alert = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
                [alertVC addAction:alert];
                //调出弹窗
                [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertVC animated:YES completion:nil];
            }
                break;
            case 1:{
                alertVC.title = @"反馈信息";
                alertVC.message = @"请填写反馈的信息";
                UIAlertAction *alert1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
                UIAlertAction *alert2 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
                [alertVC addAction:alert1];
                [alertVC addAction:alert2];
                [alertVC addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
                    textField.placeholder=@"输入反馈";
                    
                }];
                //调出弹窗
                [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertVC animated:YES completion:nil];
            }
                break;
            case 2:{
                
                
            }
                break;
            default:
                break;
        }
    }
}

@end
