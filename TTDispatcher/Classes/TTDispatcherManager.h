//
//  TTDispatcherManager.h
//  TTDispatcher
//
//  Created by 王家强 on 2019/4/15.
//

#import <Foundation/Foundation.h>

@interface TTDispatcherManager : NSObject

/**
 已经注册的Classes
 */
@property (nonatomic,strong,readonly) NSMutableArray<Class> *moduleClasses;

/**
 实例化

 @return 实例
 */
+ (instancetype)shareInstance;

/**
 注册Appdelegate

 @param moduleClass module
 */
- (void)registerAppDelegateModule:(Class)moduleClass;


/**
 注册Appdelegate 通过hardcode
 
 @param moduleClass module
 */
- (void)registerAppDelegateModules:(NSString *)moduleClass,...NS_REQUIRES_NIL_TERMINATION;

/**
 动态调用各个模块的appdelegate方法
 支持多参数,这里的参数只做转发不校验
 */
- (BOOL)performAppDelegateTarget:(Class)cls
                          action:(SEL)sel
                          params:(id)arg,...NS_REQUIRES_NIL_TERMINATION;

@end

