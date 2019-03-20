//
//  MGJRouter+TXCreateObject.h
//  MGJRouterDemo
//
//  Created by xtz_pioneer on 2019/3/20.
//  Copyright © 2019 zhangxiong. All rights reserved.
//

#import "MGJRouter.h"

NS_ASSUME_NONNULL_BEGIN

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

@end

NS_ASSUME_NONNULL_END
