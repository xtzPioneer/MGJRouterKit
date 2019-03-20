//
//  MGJRouter+TXCreateObject.m
//  MGJRouterDemo
//
//  Created by xtz_pioneer on 2019/3/20.
//  Copyright © 2019 zhangxiong. All rights reserved.
//

#import "MGJRouter+TXCreateObject.h"
#import <objc/runtime.h>

/** DEBUG 打印日志 */
#if DEBUG
#define TXMGJLog(s, ... ) NSLog( @"<FileName:%@ InThe:%d Line> Log:%@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] )
#else
#define TXMGJLog(s, ... )
#endif

@implementation MGJRouter (TXCreateObject)

/**
 * 创建对象
 * @param className 类名字
 * @return 创建的对象
 */
+ (id)createObjectWithClassName:(NSString *)className{
    Class class = NSClassFromString(className);
    id obj = [[class alloc] init];
    if (!obj) {
        NSString * message=[NSString stringWithFormat:@"未能找到“%@”该类",className];
        TXMGJLog(@"%@",message);
    }
    return obj;
}

/**
 * 创建对象 (必须实现"routeWithParameters:(NSDictionary*)parameters"该方法)
 * @param className 类名字
 * @param parameters 传递的参数
 * @return 创建的对象
 */
+ (id)createObjectWithClassName:(NSString *)className parameters:(NSDictionary*)parameters{
    id obj = [self createObjectWithClassName:className];
    if (!obj) return obj;
    // 设定方法
    SEL method = NSSelectorFromString(@"routeWithParameters:");
    // 判断是否实现了该方法
    if(![obj respondsToSelector:method]){
        NSString * message=[NSString stringWithFormat:@"”%@“该类尚未实现:%@方法",className,@"routeWithParameters:"];
        TXMGJLog(@"%@",message);
        return obj;
    }
    // 根据方法创建签名对象sig
    NSMethodSignature * sig = [[obj class] instanceMethodSignatureForSelector:method];
    // 根据签名对象创建调用对象invocation
    NSInvocation *invocation =[NSInvocation invocationWithMethodSignature:sig];
    // 设置调用对象的相关信息
    invocation.target = obj;
    invocation.selector = method;
    // 判断是否为空
    if(parameters){
        // 参数必须从第2个索引开始，因为前两个已经被target和selector使用
        [invocation setArgument:&parameters atIndex:2];
    }
    // 调用方法
    [invocation invoke];
    // 返回obj
    return obj;
}

@end
