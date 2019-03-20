//
//  TXTest1ViewController.m
//  MGJRouterDemo
//
//  Created by xtz_pioneer on 2019/3/20.
//  Copyright © 2019 zhangxiong. All rights reserved.
//

#import "TXTest1ViewController.h"

@interface TXTest1ViewController ()
/** 参数 */
@property (nonatomic,strong)NSDictionary *parameters;
@end

@implementation TXTest1ViewController

/** 路由参数 */
- (void)routeWithParameters:(NSDictionary*)parameters{
    self.parameters=parameters;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    // label
    UILabel *label=[[UILabel alloc]init];
    label.textColor=[UIColor blackColor];
    label.font=[UIFont systemFontOfSize:16];
    label.numberOfLines=0;
    CGFloat labelX=15;
    CGFloat labelW=self.view.frame.size.width-labelX*2;
    CGFloat labelH=400;
    CGFloat labelY=200;
    label.frame=CGRectMake(labelX, labelY, labelW, labelH);
    [self.view addSubview:label];
    label.text=self.parameters[MGJRouterParameterUserInfo][@"text"];
    
    // 按钮
    UIButton *button=[[UIButton alloc]init];
    [button setTitle:@"进入Web" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(buttonEvent:) forControlEvents:UIControlEventTouchUpInside];
    CGFloat buttonX=15;
    CGFloat buttonY=CGRectGetMaxY(label.frame)+15;
    CGFloat buttonW=self.view.frame.size.width-buttonX*2;
    CGFloat buttonH=25;
    button.frame=CGRectMake(buttonX, buttonY, buttonW, buttonH);
    [self.view addSubview:button];
    // Do any additional setup after loading the view.
}

/** 按钮事件 */
- (void)buttonEvent:(id)sender{
    NSMutableDictionary *parameters=[NSMutableDictionary dictionary];
    parameters[@"url"]=@"http://www.baidu.com";
    [MGJRouter openURL:@"tx://push/web"
          withUserInfo:parameters
            completion:nil];
}
    
/** dealloc */
- (void)dealloc{
    NSLog(@"%s",__func__);
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
