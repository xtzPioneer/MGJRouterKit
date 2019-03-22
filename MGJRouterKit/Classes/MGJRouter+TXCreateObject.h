//
//  MGJRouter+TXCreateObject.h
//  MGJRouterDemo
//
//  Created by xtz_pioneer on 2019/3/20.
//  Copyright © 2019 zhangxiong. All rights reserved.
//

#import "MGJRouter.h"

NS_ASSUME_NONNULL_BEGIN

/** 传递参数方法键 */
FOUNDATION_EXPORT NSString *const transferParametersMethodKey;

/**
 *  蘑菇街路由器套件,在该基础之上进行了扩展,使其更加简单快捷.
 */
@interface MGJRouter (TXCreateObject)

/**
 *  创建对象
 *
 *  @param className 类名称
 *
 *  @return 创建的对象
 */
+ (id)createObjectWithClassName:(NSString *)className;

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
+ (id)createObjectWithClassName:(NSString *)className parameters:(NSDictionary*)parameters;

@end

NS_ASSUME_NONNULL_END
