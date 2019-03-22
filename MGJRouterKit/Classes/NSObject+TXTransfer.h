//
//  NSObject+TXTransfer.h
//  MGJRouter
//
//  Created by xtz_pioneer on 2019/3/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 *  利用“runtime”传递参数,同时可以传递多个参数
 */
@interface NSObject (TXTransfer)

/**
 *  传递参数
 *
 *  @param method 方法 (例如:"routeWithParameters:")
 *
 *  @param parameterss 参数集合 (例如:"@[parameters]")
 *
 */
- (void)transferParametersWithMethod:(NSString*)method parameterss:(NSArray*)parameterss;

@end

NS_ASSUME_NONNULL_END
