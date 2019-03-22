//
//  NSObject+TXTransfer.m
//  MGJRouter
//
//  Created by xtz_pioneer on 2019/3/22.
//

#import "NSObject+TXTransfer.h"
#import <objc/runtime.h>

/** DEBUG 打印日志 */
#if DEBUG
#define TXTRANSFERLog(s, ... ) NSLog( @"<FileName:%@ InThe:%d Line> Log:%@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] )
#else
#define TXTRANSFERLog(s, ... )
#endif

@implementation NSObject (TXTransfer)

/**
 *  传递参数
 *
 *  @param method 方法 (例如:"routeWithParameters:")
 *
 *  @param parameterss 参数集合 (例如:"@[parameters]")
 *
 */
- (void)transferParametersWithMethod:(NSString*)method parameterss:(NSArray*)parameterss{
    // 字符串转换成数组
    NSArray *methods=[method componentsSeparatedByString:@":"];
    // 移除数组元素
    NSMutableArray *aMethods=[[NSMutableArray alloc]initWithArray:methods];
    [aMethods removeObject:@""];
    methods=aMethods.copy;
    // 判断是否要继续进行
    if (!methods||methods.count<=0||!parameterss||parameterss.count<=0||methods.count!=parameterss.count) {
        TXTRANSFERLog(@"Error:参数匹配失败");
        return;
    }
    // 设定方法
    SEL sELMethod=NSSelectorFromString(method);
    // 判断是否实现了该方法
    if(![self respondsToSelector:sELMethod]){
        NSString *message=[NSString stringWithFormat:@"”%@“该类未实现:%@方法",NSStringFromClass([self class]),method];
        TXTRANSFERLog(@"Error:%@",message);
        return;
    }
    // 根据方法创建签名对象sig
    NSMethodSignature *signature=[[self class] instanceMethodSignatureForSelector:sELMethod];
    // 根据签名对象创建调用对象invocation
    NSInvocation *invocation=[NSInvocation invocationWithMethodSignature:signature];
    // 设置调用对象的相关信息
    invocation.target=self;
    invocation.selector=sELMethod;
    // 参数必须从第2个索引开始，因为前两个已经被target和selector使用
    for (int index=0; index<parameterss.count; index++) {
        id parameters=parameterss[index];
        [invocation setArgument:&parameters atIndex:index+2];
    }
    // 调用方法
    [invocation invoke];
}

@end
