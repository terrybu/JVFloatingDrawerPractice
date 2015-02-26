//
//  AppDelegate.m
//  JVFloatingDrawerPractice
//
//  Created by Terry Bu on 2/25/15.
//  Copyright (c) 2015 Terry Bu. All rights reserved.
//

#import "AppDelegate.h"
#import "TerryDrawerTableViewController.h"
#import "HistoryViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [self setUpStructureForFloatingDrawer];
    [self setUpSpringAnimator];
    
    self.window.rootViewController = self.drawerViewController;
    [self.window makeKeyAndVisible];
    return YES;
}


#pragma mark - Custom Methods

- (void)setUpStructureForFloatingDrawer {
    self.drawerViewController = [[JVFloatingDrawerViewController alloc]init];

    UINavigationController *homeViewNavController = [[UINavigationController alloc]initWithRootViewController:[[LogInViewController alloc]initWithNibName:@"LogInViewController" bundle:nil]];
    UINavigationController *historyViewNavController = [[UINavigationController alloc]initWithRootViewController:[[HistoryViewController alloc]initWithNibName:@"HistoryViewController" bundle:nil]];
    
    self.controllersDictionary = [[NSMutableDictionary alloc]init];
    [self.controllersDictionary setObject:homeViewNavController forKey:@"HomeViewNav"];
    [self.controllersDictionary setObject:historyViewNavController forKey:@"HistoryViewNav"];
    
    self.drawerViewController.centerViewController = homeViewNavController;
    self.drawerViewController.leftViewController = [[TerryDrawerTableViewController alloc]initWithNibName:@"JVLeftDrawerTableViewController" bundle:nil];
    self.drawerViewController.backgroundImage = [UIImage imageNamed:@"hackworld"];
}

- (void)setUpSpringAnimator {
    JVFloatingDrawerSpringAnimator *animator = [[JVFloatingDrawerSpringAnimator alloc] init];
    self.drawerViewController.animator = animator;
    animator.animationDuration = .70;
    animator.animationDelay = 0;
    animator.initialSpringVelocity = 10;
    animator.springDamping = 1.8;
}

#pragma mark - Global Access Helper

+ (AppDelegate *)globalDelegate {
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}

- (void)toggleLeftDrawer:(id)sender animated:(BOOL)animated {
    [self.drawerViewController toggleDrawerWithSide:JVFloatingDrawerSideLeft animated:animated completion:nil];
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
