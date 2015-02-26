//
//  LogInViewController.m
//  JVFloatingDrawerPractice
//
//  Created by Terry Bu on 2/25/15.
//  Copyright (c) 2015 Terry Bu. All rights reserved.
//

#import "LogInViewController.h"
#import "AppDelegate.h"

@interface LogInViewController ()

@end

@implementation LogInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"Home Login View";
    
    UIImage *drawerButtonImage = [UIImage imageNamed:kIconDrawer];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:drawerButtonImage style:UIBarButtonItemStylePlain target:self action:@selector(actionToggleLeftDrawer:)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor blackColor];
    
}

- (IBAction)actionToggleLeftDrawer:(id)sender {
    [[AppDelegate globalDelegate] toggleLeftDrawer:self animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
