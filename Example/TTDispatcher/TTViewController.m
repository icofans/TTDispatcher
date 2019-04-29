//
//  TTViewController.m
//  TTDispatcher
//
//  Created by icofans on 04/03/2019.
//  Copyright (c) 2019 icofans. All rights reserved.
//

#import "TTViewController.h"

@interface TTViewController ()

@end

@implementation TTViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor redColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    NSLog(@"[TTViewController] --- [执行]");
    
    return YES;
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    NSLog(@"[TTViewController] --- [applicationDidEnterBackground]");
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
   NSLog(@"[TTViewController] --- [applicationWillEnterForeground]");
}

@end
