//
//  YSShopTableViewController.m
//  YourStore
//
//  Created by Ryan Alex on 4/7/15.
//  Copyright (c) 2015 YourStore. All rights reserved.
//

#import "YSShopTableViewController.h"
#import "YSShopTableViewDataSource.h"
#import "YSPageHeaderView.h"
#import "YSPageViewController.h"
#import "YSConstants.h"

@interface YSShopTableViewController()
@property (strong, nonatomic) YSShopTableViewDataSource *dataSource;
@end
@implementation YSShopTableViewController {
    NSInteger headerViewOffsetAddition;
}
@synthesize dataSource = _dataSource;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self.dataSource;
    self.tableView.tableHeaderView = [self tableHeaderView];
    self.tableView.rowHeight = [self.dataSource tableRowHeight];
    [self.tableView setBackgroundColor:[self.dataSource backgroundColor]];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return [self.dataSource tableView:tableView heightForHeaderInSection:section];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [self.dataSource tableView:tableView headerForSection:section];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
    UIView *headerContentView = self.tableView.tableHeaderView.subviews[0];
    //offsetY + 64 to account for the statusbar and navbar
    headerContentView.transform = CGAffineTransformMakeTranslation(0, MIN(offsetY+headerViewOffsetAddition, 0));
}

- (YSPageHeaderView*)tableHeaderView {
    YSPageHeaderView *headerView = [[YSPageHeaderView alloc]init];
    headerViewOffsetAddition = headerView.offsetAddition;
    YSPageViewController *pages = [[YSPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil data:self.dataSource.headerViewImages];
    pages.view.frame = headerView.frame;
    [self addChildViewController:pages];
    [headerView addSubview:pages.view];
    [pages didMoveToParentViewController:self];
    
    return headerView;
}

-(YSShopTableViewDataSource*)dataSource {
    if (!_dataSource) {
        _dataSource = [[YSShopTableViewDataSource alloc]init];
    }
    return _dataSource;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
