//
//  YSShopTableViewDataSource.h
//  YourStore
//
//  Created by Ryan Alex on 4/7/15.
//  Copyright (c) 2015 YourStore. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface YSShopTableViewDataSource : NSObject<UITableViewDataSource>

@property (strong, nonatomic) NSMutableArray *data;
@property (strong, nonatomic) NSMutableArray *reuseCells;
@property (strong, nonatomic) NSMutableArray *headerViewImages;
- (NSInteger)tableRowHeight;
- (UIColor*)backgroundColor;
- (CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section;
- (UIView*)tableView:(UITableView*)tableView headerForSection :(NSInteger)section;

@end
