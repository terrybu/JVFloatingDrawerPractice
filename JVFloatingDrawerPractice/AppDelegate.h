//
//  AppDelegate.h
//  JVFloatingDrawerPractice
//
//  Created by Terry Bu on 2/25/15.
//  Copyright (c) 2015 Terry Bu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LogInViewController.h"
#import "JVFloatingDrawerViewController.h"
#import "JVFloatingDrawerSpringAnimator.h"
#import "Constants.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) JVFloatingDrawerViewController *drawerViewController;
@property (nonatomic, strong) NSMutableDictionary *controllersDictionary;

+ (AppDelegate *)globalDelegate;
- (void)toggleLeftDrawer:(id)sender animated:(BOOL)animated;

@end

