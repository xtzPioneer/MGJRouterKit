# MGJRouterKit

[![CI Status](https://img.shields.io/travis/907689522@qq.com/MGJRouterKit.svg?style=flat)](https://travis-ci.org/907689522@qq.com/MGJRouterKit)
[![Version](https://img.shields.io/cocoapods/v/MGJRouterKit.svg?style=flat)](https://cocoapods.org/pods/MGJRouterKit)
[![License](https://img.shields.io/cocoapods/l/MGJRouterKit.svg?style=flat)](https://cocoapods.org/pods/MGJRouterKit)
[![Platform](https://img.shields.io/cocoapods/p/MGJRouterKit.svg?style=flat)](https://cocoapods.org/pods/MGJRouterKit)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## 代码片段
```objc
//
//  MGJRouter+TXCreateObject.h
//  MGJRouterDemo
//
//  Created by xtz_pioneer on 2019/3/20.
//  Copyright © 2019 zhangxiong. All rights reserved.
//

#import "MGJRouter.h"

NS_ASSUME_NONNULL_BEGIN

/**
 *  蘑菇街路由器套件,在该基础之上进行了扩展,使其更加简单快捷.
 */
@interface MGJRouter (TXCreateObject)

/**
 * 创建对象
 *
 * @param className 类名称
 *
 * @return 创建的对象
 */
+ (id)createObjectWithClassName:(NSString *)className;

/**
 * 创建对象
 *
 * 注意:使用该方法创建对象,必须在该对象中实现"-(void)routeWithParameters:(NSDictionary*)parameters;"方法,否则参数将传递失败
 *
 * @param className 类名字
 *
 * @param parameters 参数
 *
 * @return 创建的对象
 */
+ (id)createObjectWithClassName:(NSString *)className parameters:(NSDictionary*)parameters;


@end

NS_ASSUME_NONNULL_END
```

## 使用方法
* #import "MGJRouterKit.h" 即可使用
```objc

//
//  TXGlobalModuleRouter.m
//  MGJRouterDemo
//
//  Created by xtz_pioneer on 2019/3/20.
//  Copyright © 2019 zhangxiong. All rights reserved.
//

#import "TXGlobalModuleRouter.h"
#import <UIKit/UIKit.h>

@implementation TXGlobalModuleRouter

/** appDelegate */
+ (id)appDelegate{
    return [UIApplication sharedApplication].delegate;
}

/** rootViewController */
+ (UIViewController *)rootViewController{
    UIWindow *window=[[self appDelegate] window];
    return window.rootViewController;
}

/** 获取当前控制器 */
+ (UIViewController*)currentViewController{
    UIViewController *currentViewController=[self rootViewController];
    while (currentViewController.presentedViewController) {
        currentViewController = currentViewController.presentedViewController;
    }
    if ([currentViewController isKindOfClass:[UITabBarController class]]) {
        currentViewController = [(UITabBarController *)currentViewController selectedViewController];
    }
    if ([currentViewController isKindOfClass:[UINavigationController class]]) {
        currentViewController = [(UINavigationController *)currentViewController topViewController];
    }
    return currentViewController;
}

/** 自动注册 */
+ (void)load {
    // 模块1
    [MGJRouter registerURLPattern:@"tx://get/module1" toObjectHandler:^id(NSDictionary *routerParameters) {
        UIViewController *module1ViewController=[MGJRouter createObjectWithClassName:@"TXModule1ViewController"];
        module1ViewController.title=@"模块1";
        UINavigationController *module1NavigationViewController=[[UINavigationController alloc]initWithRootViewController:module1ViewController];
        return module1NavigationViewController;
    }];
    
    // 模块2
    [MGJRouter registerURLPattern:@"tx://get/module2" toObjectHandler:^id(NSDictionary *routerParameters) {
        UIViewController *module2ViewController=[MGJRouter createObjectWithClassName:@"TXModule2ViewController"];
        module2ViewController.title=@"模块2";
        UINavigationController *module2NavigationViewController=[[UINavigationController alloc]initWithRootViewController:module2ViewController];
        return module2NavigationViewController;
    }];
    
    // 模块3
    [MGJRouter registerURLPattern:@"tx://get/module3" toObjectHandler:^id(NSDictionary *routerParameters) {
        UIViewController *module3ViewController=[MGJRouter createObjectWithClassName:@"TXModule3ViewController"];
        module3ViewController.title=@"模块3";
        UINavigationController *module3NavigationViewController=[[UINavigationController alloc]initWithRootViewController:module3ViewController];
        return module3NavigationViewController;
    }];
    
    // 模块4
    [MGJRouter registerURLPattern:@"tx://get/module4" toObjectHandler:^id(NSDictionary *routerParameters) {
        UIViewController *module4ViewController=[MGJRouter createObjectWithClassName:@"TXModule4ViewController"];
        module4ViewController.title=@"模块4";
        UINavigationController *module4NavigationViewController=[[UINavigationController alloc]initWithRootViewController:module4ViewController];
        return module4NavigationViewController;
    }];
    
    // 测试1
    [MGJRouter registerURLPattern:@"tx://push/test1ViewController" toHandler:^(NSDictionary *routerParameters) {
        UIViewController *viewController=[MGJRouter createObjectWithClassName:@"TXTest1ViewController" parameters:routerParameters];
        [[self currentViewController].navigationController pushViewController:viewController animated:YES];
    }];
    
    // 测试2
    [MGJRouter registerURLPattern:@"tx://push/test2ViewController" toHandler:^(NSDictionary *routerParameters) {
        UIViewController *viewController=[MGJRouter createObjectWithClassName:@"TXTest2ViewController" parameters:routerParameters];
        [[self currentViewController].navigationController pushViewController:viewController animated:YES];
    }];
    
    // Web模块1
    [MGJRouter registerURLPattern:@"tx://get/webModule" toObjectHandler:^id(NSDictionary *routerParameters) {
        UIViewController *viewController=[MGJRouter createObjectWithClassName:@"TXWebViewController" parameters:routerParameters];
        return viewController;
    }];
    
    // Web模块2
    [MGJRouter registerURLPattern:@"tx://push/web" toHandler:^(NSDictionary *routerParameters) {
        UIViewController *viewController=[MGJRouter createObjectWithClassName:@"TXWebViewController" parameters:routerParameters];
        [[self currentViewController].navigationController pushViewController:viewController animated:YES];
    }];
}

@end

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

```

## Installation

MGJRouterKit is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'MGJRouterKit'
```

## Author

xtzPioneer, xtz_pioneer@163.com

## License

MGJRouterKit is available under the MIT license. See the LICENSE file for more info.
