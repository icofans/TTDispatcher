//
//  TTDispatcherExchange.m
//  TTDispatcher
//
//  Created by 王家强 on 2019/4/15.
//

#import "TTDispatcherExchange.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import "TTDispatcherManager.h"

@implementation TTDispatcherExchange

#pragma mark - AppDelegate
- (void)module_applicationDidFinishLaunching:(UIApplication *)application
{
    [[TTDispatcherManager shareInstance] performAppDelegateTarget:[TTDispatcherExchange class] action:_cmd params:application, nil];
}

- (BOOL)module_application:(UIApplication *)application willFinishLaunchingWithOptions:(nullable NSDictionary *)launchOptions
{
    return [[TTDispatcherManager shareInstance] performAppDelegateTarget:[TTDispatcherExchange class] action:_cmd params:application, launchOptions?:[NSNull null], nil];
}

- (BOOL)module_application:(UIApplication *)application didFinishLaunchingWithOptions:(nullable NSDictionary *)launchOptions
{
    return [[TTDispatcherManager shareInstance] performAppDelegateTarget:[TTDispatcherExchange class] action:_cmd params:application, launchOptions?:[NSNull null], nil];
}

- (void)module_applicationDidBecomeActive:(UIApplication *)application
{
    [[TTDispatcherManager shareInstance] performAppDelegateTarget:[TTDispatcherExchange class] action:_cmd params:application, nil];
}
- (void)module_applicationWillResignActive:(UIApplication *)application
{
    [[TTDispatcherManager shareInstance] performAppDelegateTarget:[TTDispatcherExchange class] action:_cmd params:application, nil];
}
- (BOOL)module_application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString*, id> *)options NS_AVAILABLE_IOS(9_0); // no equiv. notification. return NO if the application can't open for some reaso
{
    return [[TTDispatcherManager shareInstance] performAppDelegateTarget:[TTDispatcherExchange class] action:_cmd params:app,url,options, nil];
}

- (BOOL)module_application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    return [[TTDispatcherManager shareInstance] performAppDelegateTarget:[TTDispatcherExchange class] action:_cmd params:application,url, nil];
}

- (BOOL)module_application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return [[TTDispatcherManager shareInstance] performAppDelegateTarget:[TTDispatcherExchange class] action:_cmd params:application,url,sourceApplication,annotation, nil];
}

- (void)module_applicationDidReceiveMemoryWarning:(UIApplication *)application;      // try to clean up as much memory as possible. next step is to terminate ap
{
    [[TTDispatcherManager shareInstance] performAppDelegateTarget:[TTDispatcherExchange class] action:_cmd params:application, nil];
}
- (void)module_applicationWillTerminate:(UIApplication *)application
{
    [[TTDispatcherManager shareInstance] performAppDelegateTarget:[TTDispatcherExchange class] action:_cmd params:application, nil];
}
- (void)module_applicationSignificantTimeChange:(UIApplication *)application;        // midnight, carrier time update, daylight savings time chang
{
    [[TTDispatcherManager shareInstance] performAppDelegateTarget:[TTDispatcherExchange class] action:_cmd params:application, nil];
}
- (void)module_application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken NS_AVAILABLE_IOS(3_0)
{
    [[TTDispatcherManager shareInstance] performAppDelegateTarget:[TTDispatcherExchange class] action:_cmd params:application,deviceToken, nil];
}
- (void)module_application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error NS_AVAILABLE_IOS(3_0)
{
    [[TTDispatcherManager shareInstance] performAppDelegateTarget:[TTDispatcherExchange class] action:_cmd params:application,error, nil];
}
- (void)module_application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo NS_AVAILABLE_IOS(3_0)
{
    [[TTDispatcherManager shareInstance] performAppDelegateTarget:[TTDispatcherExchange class] action:_cmd params:application,userInfo, nil];
}
- (void)module_application:(UIApplication *)application didReceiveLocalNotification:(NSDictionary *)userInfo NS_AVAILABLE_IOS(3_0)
{
    [[TTDispatcherManager shareInstance] performAppDelegateTarget:[TTDispatcherExchange class] action:_cmd params:application,userInfo, nil];
}
- (void)module_application:(UIApplication *)application handleEventsForBackgroundURLSession:(NSString *)identifier completionHandler:(void (^)(void))completionHandler NS_AVAILABLE_IOS(7_0)
{
    [[TTDispatcherManager shareInstance] performAppDelegateTarget:[TTDispatcherExchange class] action:_cmd params:application,identifier,completionHandler, nil];
}
- (void)module_application:(UIApplication *)application handleWatchKitExtensionRequest:(nullable NSDictionary *)userInfo reply:(void(^)(NSDictionary * __nullable replyInfo))reply NS_AVAILABLE_IOS(8_2)
{
    [[TTDispatcherManager shareInstance] performAppDelegateTarget:[TTDispatcherExchange class] action:_cmd params:application,userInfo,reply, nil];
}

- (void)module_applicationShouldRequestHealthAuthorization:(UIApplication *)application NS_AVAILABLE_IOS(9_0)
{
    [[TTDispatcherManager shareInstance] performAppDelegateTarget:[TTDispatcherExchange class] action:_cmd params:application, nil];
}
- (void)module_applicationDidEnterBackground:(UIApplication *)application NS_AVAILABLE_IOS(4_0)
{
    [[TTDispatcherManager shareInstance] performAppDelegateTarget:[TTDispatcherExchange class] action:_cmd params:application, nil];
}
- (void)module_applicationWillEnterForeground:(UIApplication *)application NS_AVAILABLE_IOS(4_0)
{
    [[TTDispatcherManager shareInstance] performAppDelegateTarget:[TTDispatcherExchange class] action:_cmd params:application, nil];
}
- (void)module_applicationProtectedDataWillBecomeUnavailable:(UIApplication *)application NS_AVAILABLE_IOS(4_0)
{
    [[TTDispatcherManager shareInstance] performAppDelegateTarget:[TTDispatcherExchange class] action:_cmd params:application, nil];
}
- (void)module_applicationProtectedDataDidBecomeAvailable:(UIApplication *)application    NS_AVAILABLE_IOS(4_0)
{
    [[TTDispatcherManager shareInstance] performAppDelegateTarget:[TTDispatcherExchange class] action:_cmd params:application, nil];
}

- (void)module_remoteControlReceivedWithEvent:(UIEvent *)event
{
    [[TTDispatcherManager shareInstance] performAppDelegateTarget:[TTDispatcherExchange class] action:_cmd params:event, nil];
}

@end
