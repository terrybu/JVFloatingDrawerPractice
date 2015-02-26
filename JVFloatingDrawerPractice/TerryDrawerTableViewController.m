//
//  JVLeftDrawerTableViewController.m
//  JVFloatingDrawer
//
//  Created by Julian Villella on 2015-01-15.
//  Copyright (c) 2015 JVillella. All rights reserved.
//

#import "TerryDrawerTableViewController.h"
#import "TerryDrawerCell.h"
#import "AppDelegate.h"
#import "JVFloatingDrawerViewController.h"
#import "HistoryViewController.h"
#import "Constants.h"

//old c wya of doing enum, we can improve with typedef in ios
//enum {
//    kHistoryOfRecordsIndex    = 0,
//    kLogOutIndex = 1
//};

typedef NS_ENUM(NSInteger, CellIndexType) {
    CellIndexTypeHome,
    CellIndexTypeHistory,
    CellIndexTypeLogout
};

static const CGFloat kJVTableViewTopInset = 80.0;

@interface TerryDrawerTableViewController ()

@end

@implementation TerryDrawerTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.contentInset = UIEdgeInsetsMake(kJVTableViewTopInset, 0.0, 0.0, 0.0);
    self.clearsSelectionOnViewWillAppear = NO;
    [self.tableView registerNib:[UINib nibWithNibName:@"TerryDrawerCell" bundle:nil] forCellReuseIdentifier:kCellReuseIdentifier];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForItem:CellIndexTypeHome inSection:0] animated:NO scrollPosition:UITableViewScrollPositionNone];
}

#pragma mark - Table View Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TerryDrawerCell *cell;
    cell = [tableView dequeueReusableCellWithIdentifier:kCellReuseIdentifier forIndexPath:indexPath];
    
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"TerryDrawerCell" owner:self options:nil];
        cell = (TerryDrawerCell *)[nib objectAtIndex:0];
    }
    
    switch (indexPath.row) {
        case CellIndexTypeHome: {
            cell.titleLabel.text = @"Home";
            cell.iconImageView.image = [[UIImage imageNamed:@"IconHome"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
            break;
        }
        case CellIndexTypeHistory: {
            cell.titleLabel.text = @"History";
            cell.iconImageView.image = [[UIImage imageNamed:@"IconCalendar"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
            break;
        }
        case CellIndexTypeLogout: {
            cell.titleLabel.text = @"Log Out";
            cell.iconImageView.image = [[UIImage imageNamed:@"IconSettings"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
            break;
        }
        default:
            break;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UINavigationController *destinationNavController = nil;
    
    if(indexPath.row == CellIndexTypeHome) {
        destinationNavController = [[AppDelegate globalDelegate].controllersDictionary objectForKey:@"HomeViewNav"];
        [[[AppDelegate globalDelegate] drawerViewController] setCenterViewController:destinationNavController];
    }
    else if (indexPath.row == CellIndexTypeHistory) {
        destinationNavController = [[AppDelegate globalDelegate].controllersDictionary objectForKey:@"HistoryViewNav"];
        [[[AppDelegate globalDelegate] drawerViewController] setCenterViewController:destinationNavController];
    }
    else if (indexPath.row == CellIndexTypeLogout) {
        NSLog(@"log out!");
    }
    
    [[AppDelegate globalDelegate] toggleLeftDrawer:self animated:YES];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
