//
//  YSHorizontalTableViewCell.h
//  YourStore
//
//  Created by Ryan Alex on 4/7/15.
//  Copyright (c) 2015 YourStore. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YSHorizontalTableViewAsCell : UITableViewCell <UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>

@property (nonatomic, retain) UITableView *horizontalTableView;
@property (nonatomic, retain) NSArray *items;

@end
