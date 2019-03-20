//
//  TXModule4ViewController.m
//  MGJRouterDemo
//
//  Created by xtz_pioneer on 2019/3/20.
//  Copyright © 2019 zhangxiong. All rights reserved.
//

#import "TXModule4ViewController.h"

@interface TXModule4ViewController ()

@end

@implementation TXModule4ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    // 按钮
    UIButton *button=[[UIButton alloc]init];
    [button setTitle:@"从模块4点击进入" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(buttonEvent:) forControlEvents:UIControlEventTouchUpInside];
    CGFloat buttonX=15;
    CGFloat buttonY=200;
    CGFloat buttonW=self.view.frame.size.width-buttonX*2;
    CGFloat buttonH=25;
    button.frame=CGRectMake(buttonX, buttonY, buttonW, buttonH);
    [self.view addSubview:button];
    
    // Do any additional setup after loading the view.
}

/** 按钮事件 */
- (void)buttonEvent:(id)sender{
    __weak typeof(self) weakSelf=self;
    NSMutableDictionary *parameters=[NSMutableDictionary dictionary];
    parameters[@"text"]=@"噢噢噢噢噢噢噢噢噢噢噢噢噢噢噢噢噢噢";
    parameters[@"navigationController"]=self.navigationController;
    // 完成回调
    void (^operationCompletionHandler) (NSError *error,id obj);
    operationCompletionHandler = ^(NSError *error,id obj){
        if (!error) {
            weakSelf.view.backgroundColor=obj;
        }else{
        }
    };
    [parameters setObject:operationCompletionHandler forKey:@"operationCompletionHandler"];
    [MGJRouter openURL:@"tx://push/test4ViewController"
          withUserInfo:parameters
            completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
