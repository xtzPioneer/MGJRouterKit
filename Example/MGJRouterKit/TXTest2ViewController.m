//
//  TXTest2ViewController.m
//  MGJRouterDemo
//
//  Created by xtz_pioneer on 2019/3/20.
//  Copyright © 2019 zhangxiong. All rights reserved.
//

#import "TXTest2ViewController.h"

@interface TXTest2ViewController ()
/** 参数 */
@property (nonatomic,strong)NSDictionary *parameters;
@end

@implementation TXTest2ViewController

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
    // Do any additional setup after loading the view.
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
