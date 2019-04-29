//
//  TTDispatcherManager.m
//  TTDispatcher
//
//  Created by 王家强 on 2019/4/15.
//

#import "TTDispatcherManager.h"
#import <objc/runtime.h>
#import <objc/message.h>

static NSMutableArray <Class> *ModuleClasses;

@implementation TTDispatcherManager

+ (instancetype)shareInstance
{
    static TTDispatcherManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[TTDispatcherManager alloc] init];
        ModuleClasses = [NSMutableArray new];
    });
    return instance;
}

- (void)registerAppDelegateModule:(Class)moduleClass
{
    if (!moduleClass) {
        NSLog(@"[Dispatcher]---[module]---[不存在]");
        return;
    }
    if (![ModuleClasses containsObject:moduleClass]) {
        // Register module
        [ModuleClasses addObject:moduleClass];
    } else {
        // already exsits
    }
}

- (void)registerAppDelegateModules:(NSString *)moduleClass, ...
{
    va_list list;
    va_start(list, moduleClass);
    for (NSString *obj = moduleClass; obj != nil; obj = va_arg(list, NSString *)) {
        Class cls = NSClassFromString(obj);
        if (!cls) {
            NSLog(@"[Dispatcher]---[module]---[不存在]");
            return;
        }
        if (![ModuleClasses containsObject:cls]) {
            // Register module
            [ModuleClasses addObject:cls];
        }
    }
    va_end(list);
}

- (NSMutableArray<Class> *)moduleClasses
{
    return ModuleClasses;
}

- (BOOL)performAppDelegateTarget:(Class)cls action:(SEL)sel params:(id)arg, ...
{
    // 获取参数
    NSMutableArray *mParams = [NSMutableArray array];
    va_list list;
    va_start(list, arg);
    for (id obj = arg; obj != nil; obj = va_arg(list, id)) {
        [mParams addObject:obj];
    }
    va_end(list);
    
    // 获取返回值
    NSString *oriSel = [NSString stringWithFormat:@"module_%@",NSStringFromSelector(sel)];
    id result = [self performAppDelegateTarget:NSStringFromClass(cls) actionName:oriSel params:mParams];
    
    for (Class cls in [TTDispatcherManager shareInstance].moduleClasses) {
        [self performAppDelegateTarget:NSStringFromClass(cls) actionName:NSStringFromSelector(sel) params:mParams];
    }
    return result?[result unsignedIntegerValue]:YES;
}

- (id)performAppDelegateTarget:(NSString *)targetName actionName:(NSString *)actionName params:(NSArray *)mParams
{
    // 当调用其他类型消息时，不处理
    if (![actionName containsString:@"application"]) { return nil; }
    Class class = NSClassFromString(targetName);
    SEL action = NSSelectorFromString(actionName);
    
    // 检查 target-action
    if (!class || !action) { return nil; }
    
    // 检查实现
    NSObject *target = [class new];
    if (![target respondsToSelector:action]) { return nil; }
    
    // 检查函数签名
    NSMethodSignature *methodSig = [target methodSignatureForSelector:action];
    if(methodSig == nil) { return nil; }
    
    const char* retType = [methodSig methodReturnType];
    //如果是对象则直接处理
    if (strcmp(retType, @encode(id)) == 0) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        return [target performSelector:action withObject:mParams.firstObject];
#pragma clang diagnostic pop
    }
    
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSig];
    NSString *selStr = NSStringFromSelector(action);
    
    //参数处理
    NSUInteger paramsCount = [selStr componentsSeparatedByString:@":"].count - 1;
    if (!mParams) { paramsCount = 0; }
    
    if (paramsCount > 0 && paramsCount >= mParams.count) {
        for (int i = 0; i < mParams.count; i ++) {
            id param = mParams[i];
            if (param == [NSNull null]) {
                param = nil;
            }
            [invocation setArgument:&param atIndex:i + 2];
        }
    } else if (paramsCount > 0 && paramsCount < mParams.count) {
        NSLog(@"runtime参数数量与SEL所需数量异常");
        return nil;
    }
    
    [invocation setSelector:action];
    [invocation setTarget:target];
    
    if (strcmp(retType, @encode(void)) == 0) {
        [invocation invoke];
        return nil;
    }
    
    if (strcmp(retType, @encode(int)) == 0) {
        [invocation invoke];
        int result = 0;
        [invocation getReturnValue:&result];
        return @(result);
    }
    
    if (strcmp(retType, @encode(unsigned int)) == 0) {
        [invocation invoke];
        unsigned int result = 0;
        [invocation getReturnValue:&result];
        return @(result);
    }
    
    if (strcmp(retType, @encode(short)) == 0) {
        [invocation invoke];
        short result = 0;
        [invocation getReturnValue:&result];
        return @(result);
    }
    
    if (strcmp(retType, @encode(unsigned short)) == 0) {
        [invocation invoke];
        unsigned short result = 0;
        [invocation getReturnValue:&result];
        return @(result);
    }
    
    if (strcmp(retType, @encode(long)) == 0) {
        [invocation invoke];
        long result = 0;
        [invocation getReturnValue:&result];
        return @(result);
    }
    
    if (strcmp(retType, @encode(long long)) == 0) {
        [invocation invoke];
        long long result = 0;
        [invocation getReturnValue:&result];
        return @(result);
    }
    
    if (strcmp(retType, @encode(float)) == 0) {
        [invocation invoke];
        float result = 0.0f;
        [invocation getReturnValue:&result];
        return @(result);
    }
    
    if (strcmp(retType, @encode(char)) == 0) {
        [invocation invoke];
        char result = 0;
        [invocation getReturnValue:&result];
        return @(result);
    }
    
    if (strcmp(retType, @encode(unsigned char)) == 0) {
        [invocation invoke];
        unsigned char result = 0;
        [invocation getReturnValue:&result];
        return @(result);
    }
    
    if (strcmp(retType, @encode(NSInteger)) == 0) {
        [invocation invoke];
        NSInteger result = 0;
        [invocation getReturnValue:&result];
        return @(result);
    }
    
    if (strcmp(retType, @encode(BOOL)) == 0) {
        [invocation invoke];
        BOOL result = 0;
        [invocation getReturnValue:&result];
        return @(result);
    }
    
    if (strcmp(retType, @encode(CGFloat)) == 0) {
        [invocation invoke];
        CGFloat result = 0;
        [invocation getReturnValue:&result];
        return @(result);
    }
    
    if (strcmp(retType, @encode(NSUInteger)) == 0) {
        [invocation invoke];
        NSUInteger result = 0;
        [invocation getReturnValue:&result];
        return @(result);
    }
    
    NSLog(@"方法无法被调用,请检查返回值的基本数据类型,或者自行增加返回值类型");
    return nil;
    
}



@end
