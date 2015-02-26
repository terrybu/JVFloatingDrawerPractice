//
//  JVLeftDrawerTableViewController.m
//  JVFloatingDrawer
//
//  Created by Julian Villella on 2015-01-15.
//  Copyright (c) 2015 JVillella. All rights reserved.
//

#import "JVLeftDrawerTableViewController.h"
#import "TerryDrawerCell.h"
#import "AppDelegate.h"
#import "JVFloatingDrawerViewController.h"
#import "HistoryViewController.h"

//enum {
//    kHistoryOfRecordsIndex    = 0,
//    kLogOutIndex = 1
//};
//old c wya of doing enum, we can improve with typedef in ios

typedef NS_ENUM(NSInteger, CellIndexType) {
    CellIndexTypeHome,
    CellIndexTypeHistory,
    CellIndexTypeLogout
};

static const CGFloat kJVTableViewTopInset = 80.0;
static NSString * const kCellReuseIdentifier = @"TerryDrawerCell";

@interface JVLeftDrawerTableViewController ()

@end

@implementation JVLeftDrawerTableViewController

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
            cell.iconImageView.image = [[UIImage imageNamed:@"665-gear"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
            break;
        }
        case CellIndexTypeHistory: {
            cell.titleLabel.text = @"History";
            cell.iconImageView.image = [[UIImage imageNamed:@"665-gear"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
            break;
        }
        case CellIndexTypeLogout: {
            cell.titleLabel.text = @"Log Out";
            cell.iconImageView.image = [[UIImage imageNamed:@"665-gear"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
            break;
        }
        default:
            break;
        }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *destinationViewController = nil;

    if(indexPath.row == CellIndexTypeHistory) {
        destinationViewController = [[HistoryViewController alloc]initWithNibName:@"HistoryViewController" bundle:nil];
    } else {
        NSLog(@"log out");
    }
    
    [[[AppDelegate globalDelegate] drawerViewController] setCenterViewController:destinationViewController];
    [[AppDelegate globalDelegate] toggleLeftDrawer:self animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
