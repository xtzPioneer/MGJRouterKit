//
//  TXAppDelegate.m
//  MGJRouterKit
//
//  Created by 907689522@qq.com on 03/20/2019.
//  Copyright (c) 2019 907689522@qq.com. All rights reserved.
//

#import "TXAppDelegate.h"

@implementation TXAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    
    // 模块1
    UINavigationController * module1NavigationViewController=[MGJRouter objectForURL:@"tx://get/module1"];
    
    // 模块2
    UINavigationController * module2NavigationViewController=[MGJRouter objectForURL:@"tx://get/module2"];
    
    // 模块3
    UINavigationController * module3NavigationViewController=[MGJRouter objectForURL:@"tx://get/module3"];
    
    // 模块4
    UINavigationController * module4NavigationViewController=[MGJRouter objectForURL:@"tx://get/module4"];
    
    // tabBarController
    UITabBarController *tabBarController=[[UITabBarController alloc]init];
    tabBarController.viewControllers=@[module1NavigationViewController,module2NavigationViewController,module3NavigationViewController,module4NavigationViewController];
    
    // 入口
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor=[UIColor whiteColor];
    self.window.rootViewController=tabBarController;
    [self.window makeKeyAndVisible];
    
    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
