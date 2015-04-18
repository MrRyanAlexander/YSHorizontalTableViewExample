//
//  FavoritesTableViewController.m
//  YourStore
//
//  Created by Ryan Alex on 4/17/15.
//  Copyright (c) 2015 YourStore. All rights reserved.
//

#import "FavoritesTableViewController.h"

@interface FavoritesTableViewController ()

@end

@implementation FavoritesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    
    if (indexPath.section == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"item" forIndexPath:indexPath];
        return cell;
    }
    
    cell = [tableView dequeueReusableCellWithIdentifier:@"store" forIndexPath:indexPath];
    return cell;
}


@end
