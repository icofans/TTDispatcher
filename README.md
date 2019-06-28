
### AppDelegate模块化解藕组件

1.通过运行时对UIApplication类进行hook，在交换的setDelegate方法中去交换appdelegate的23个方法，并指定一个类去处理交换后的方法。

2.在处理delegate方法的类，对已注册事件的module进行事件派发

3.在Appdelegate维护需要注册的module，之后需要使用的module就可以直接使用Appdelegate的事件了。

### 使用

```ruby
pod 'TTDispatcher'
```

在Appdelegate类添加需要注册的module

AppDelegate.m

```c

#import "AppDelegate.h"
#import <TTDispatcher.h>

@implementation TTAppDelegate

// 注册module
@dispatcher(@"TTMainModule",@"TTTestModule")

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    return YES;
}

@end
```


然后在需要使用的模块添加Appdelegate方法

TTMainModule.m

```c
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
```
