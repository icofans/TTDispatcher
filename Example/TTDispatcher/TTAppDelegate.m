//
//  TTAppDelegate.m
//  TTDispatcher
//
//  Created by icofans on 04/03/2019.
//  Copyright (c) 2019 icofans. All rights reserved.
//

#import "TTAppDelegate.h"
#import "TTDispatcher.h"

@implementation TTAppDelegate

@dispatcher(@"TTMainModule",@"TTTestModule")

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // @dispatcher(@"TTMainModule",@"TTTestModule") 这里注册的模块按顺序执行
    // TTAppDelegate最先执行，但由于方法交换后是由TTDispatcherExchange转发过来的，所以，这里self不在是原来的self
    // TTAppDelegate 原代理在组件化中并不需要执行操作,我们把具体的业务分离至各个module模块
    // 这里我们在 mainModule 设置rootVC
    NSLog(@"[%@]---[TTAppDelegate]---[执行]",self);
    return YES;
}

@end
