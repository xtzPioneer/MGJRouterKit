//
//  MGJRouter+TXCreateObject.m
//  MGJRouterDemo
//
//  Created by xtz_pioneer on 2019/3/20.
//  Copyright © 2019 zhangxiong. All rights reserved.
//

#import "MGJRouter+TXCreateObject.h"
#import "NSObject+TXTransfer.h"

/** 传递参数方法键 */
NSString *const transferParametersMethodKey=@"routeWithParameters:";

/** DEBUG 打印日志 */
#if DEBUG
#define TXMGJROUTERLog(s, ... ) NSLog( @"<FileName:%@ InThe:%d Line> Log:%@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] )
#else
#define TXMGJROUTERLog(s, ... )
#endif

@implementation MGJRouter (TXCreateObject)

/**
 *  创建对象
 *
 *  @param className 类名称
 *
 *  @return 创建的对象
 */
+ (id)createObjectWithClassName:(NSString *)className{
    Class class = NSClassFromString(className);
    id obj = [[class alloc] init];
    if (!obj) {
        NSString * message=[NSString stringWithFormat:@"未能找到“%@”该类",className];
        TXMGJROUTERLog(@"Error:%@",message);
    }
    return obj;
}

/**
 *  创建对象并传递参数
 *
 *  注意:使用该方法创建对象,必须在该对象中实现"-(void)routeWithParameters:(NSDictionary*)parameters;"方法,否则参数将传递失败
 *
 *  @param className 类名字
 *
 *  @param parameters 参数
 *
 *  @return 创建的对象
 */
+ (id)createObjectWithClassName:(NSString *)className parameters:(NSDictionary*)parameters{
    id obj = [self createObjectWithClassName:className];
    if (!obj) return obj;
    [obj transferParametersWithMethod:transferParametersMethodKey parameterss:@[parameters]];
    return obj;
}

@end
