//
//  TTMainModule.m
//  TTDispatcher_Example
//
//  Created by 王家强 on 2019/4/29.
//  Copyright © 2019 icofans. All rights reserved.
//

#import "TTMainModule.h"
#import "TTViewController.h"

@implementation TTMainModule

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    NSLog(@"[TTMainModule] --- [执行]");
    mWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    mWindow.backgroundColor = [UIColor whiteColor];
    [mWindow makeKeyAndVisible];
    [UIApplication sharedApplication].delegate.window = mWindow;
    
    mWindow.rootViewController = [TTViewController new];
    
    return YES;
}

@end
