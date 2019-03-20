# MGJRouterKit

[![CI Status](https://img.shields.io/travis/907689522@qq.com/MGJRouterKit.svg?style=flat)](https://travis-ci.org/907689522@qq.com/MGJRouterKit)
[![Version](https://img.shields.io/cocoapods/v/MGJRouterKit.svg?style=flat)](https://cocoapods.org/pods/MGJRouterKit)
[![License](https://img.shields.io/cocoapods/l/MGJRouterKit.svg?style=flat)](https://cocoapods.org/pods/MGJRouterKit)
[![Platform](https://img.shields.io/cocoapods/p/MGJRouterKit.svg?style=flat)](https://cocoapods.org/pods/MGJRouterKit)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## 代码片段
```objc
/** 创建对象 */
@interface MGJRouter (TXCreateObject)

/**
* 创建对象
* @param className 类名字
* @return 创建的对象
*/
+ (id)createObjectWithClassName:(NSString *)className;

/**
* 创建对象 (必须实现"routeWithParameters:(NSDictionary*)parameters"该方法)
* @param className 类名字
* @param parameters 传递的参数
* @return 创建的对象
*/
+ (id)createObjectWithClassName:(NSString *)className parameters:(NSDictionary*)parameters;

```

## 使用方法
* #import "MGJRouterKit.h" 即可使用
```objc

/** appDelegate */
+ (id)appDelegate{
    return [UIApplication sharedApplication].delegate;
}

/** 获取当前控制器 */
+ (UINavigationController *)currentViewController{
    UIWindow *window=[[self appDelegate] window];
    UITabBarController *tabBarController=(UITabBarController*)window.rootViewController;
    return tabBarController.selectedViewController;
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
        [[self currentViewController] pushViewController:viewController animated:YES];
    }];
    
    // 测试2
    [MGJRouter registerURLPattern:@"tx://push/test2ViewController" toHandler:^(NSDictionary *routerParameters) {
        UIViewController *viewController=[MGJRouter createObjectWithClassName:@"TXTest2ViewController" parameters:routerParameters];
        [[self currentViewController] pushViewController:viewController animated:YES];
    }];
    
    // Web模块1
    [MGJRouter registerURLPattern:@"tx://get/webModule" toObjectHandler:^id(NSDictionary *routerParameters) {
        UIViewController *viewController=[MGJRouter createObjectWithClassName:@"TXWebViewController" parameters:routerParameters];
        return viewController;
    }];
    
    // Web模块2
    [MGJRouter registerURLPattern:@"tx://push/web" toHandler:^(NSDictionary *routerParameters) {
        UIViewController *viewController=[MGJRouter createObjectWithClassName:@"TXWebViewController" parameters:routerParameters];
        [[self currentViewController] pushViewController:viewController animated:YES];
    }];
}
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
