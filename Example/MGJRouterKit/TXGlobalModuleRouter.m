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
