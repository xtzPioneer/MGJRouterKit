//
//  TXModule3ViewController.m
//  MGJRouterDemo
//
//  Created by xtz_pioneer on 2019/3/20.
//  Copyright © 2019 zhangxiong. All rights reserved.
//

#import "TXModule3ViewController.h"

@interface TXModule3ViewController ()

@end

@implementation TXModule3ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    // 按钮
    UIButton *button=[[UIButton alloc]init];
    [button setTitle:@"从模块3点击进入" forState:UIControlStateNormal];
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
    NSMutableDictionary *parameters=[NSMutableDictionary dictionary];
    parameters[@"text"]=@"嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻";
    parameters[@"navigationController"]=self.navigationController;
    [MGJRouter openURL:@"tx://push/test3ViewController"
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
