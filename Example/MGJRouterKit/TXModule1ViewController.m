//
//  TXModule1ViewController.m
//  MGJRouterDemo
//
//  Created by xtz_pioneer on 2019/3/20.
//  Copyright © 2019 zhangxiong. All rights reserved.
//

#import "TXModule1ViewController.h"

@interface TXModule1ViewController ()

@end

@implementation TXModule1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    // 按钮
    UIButton *button=[[UIButton alloc]init];
    [button setTitle:@"从模块1点击进入" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(buttonEvent:) forControlEvents:UIControlEventTouchUpInside];
    CGFloat buttonX=15;
    CGFloat buttonY=200;
    CGFloat buttonW=self.view.frame.size.width-buttonX*2;
    CGFloat buttonH=25;
    button.frame=CGRectMake(buttonX, buttonY, buttonW, buttonH);
    [self.view addSubview:button];
    
    // 按钮2
    UIButton *button2=[[UIButton alloc]init];
    [button2 setTitle:@"从模块1点击进入Web" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [button2 addTarget:self action:@selector(button2Event:) forControlEvents:UIControlEventTouchUpInside];
    CGFloat button2X=15;
    CGFloat button2Y=400;
    CGFloat button2W=self.view.frame.size.width-buttonX*2;
    CGFloat button2H=25;
    button2.frame=CGRectMake(button2X, button2Y, button2W, button2H);
    [self.view addSubview:button2];
    
    // Do any additional setup after loading the view.
}

/** 按钮事件 */
- (void)buttonEvent:(id)sender{
    NSMutableDictionary *parameters=[NSMutableDictionary dictionary];
    parameters[@"text"]=@"哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈";
    [MGJRouter openURL:@"tx://push/test1ViewController"
          withUserInfo:parameters
            completion:nil];
}

/** 按钮事件 */
- (void)button2Event:(id)sender{
    NSMutableDictionary *parameters=[NSMutableDictionary dictionary];
    parameters[@"url"]=@"https://github.com/xtzPioneer/MGJRouterKit.git";
    [MGJRouter openURL:@"tx://push/web"
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
