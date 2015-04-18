//
//  YSHorizontalTableViewCell.m
//  YourStore
//
//  Created by Ryan Alex on 4/7/15.
//  Copyright (c) 2015 YourStore. All rights reserved.
//

#import "YSHorizontalTableViewAsCell.h"
#import "YSHorizontalCell.h"
#import "YSConstants.h"

@implementation YSHorizontalTableViewAsCell {
    BOOL isLastCellVisible;
}

@synthesize horizontalTableView = _horizontalTableView;
@synthesize items = _items;

#pragma mark - Table View Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"HorizontalCell";
    
    __block YSHorizontalCell *cell = (YSHorizontalCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[YSHorizontalCell alloc] initWithFrame:CGRectMake(0, 0, kCellWidth, kCellHeight)];
    }
    
    __block NSDictionary *currentItem = [self.items objectAtIndex:indexPath.row];
    
    dispatch_queue_t concurrentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(concurrentQueue, ^{
        UIImage *image = (UIImage*)currentItem;
        dispatch_async(dispatch_get_main_queue(), ^{
            [cell.thumbnail setImage:image];
        });
    });
    
    //cell.titleLabel.text = [currentArticle objectForKey:@"Title"];
    
    return cell;
}

#pragma mark Table View Delegate 

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == self.items.count-1) {
        NSLog(@"\nloading the last cell");
        isLastCellVisible = YES;
    }
}

- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == self.items.count-1) {
        NSLog(@"\nunloading the last cell");
        isLastCellVisible = NO;
    }
}

#pragma mark - Table View Scroll Delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    //ensure that the end of scroll is fired.
    [self performSelector:@selector(scrollViewDidEndScrollingAnimation:) withObject:nil afterDelay:0.3];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    NSArray *visibleCells = self.horizontalTableView.visibleCells;
    NSArray *visibleRowPaths = [self.horizontalTableView indexPathsForVisibleRows];
    YSHorizontalCell *cell = visibleCells[0];
    NSInteger t1 = cell.center.y-self.horizontalTableView.contentOffset.y;
    if (t1>=0 && !isLastCellVisible)
    {
        [self.horizontalTableView scrollToRowAtIndexPath:visibleRowPaths[0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
    }
    else if (isLastCellVisible)
    {
        YSHorizontalCell *lastCell = visibleCells[visibleCells.count-1];
        NSInteger t2 = lastCell.center.y - self.horizontalTableView.contentOffset.y - self.horizontalTableView.frame.size.width;
        if (t2<=0)
        {
            [self.horizontalTableView scrollToRowAtIndexPath:visibleRowPaths[visibleCells.count-1] atScrollPosition:UITableViewScrollPositionTop animated:YES];
        }
    }
    else
    {
        [self.horizontalTableView scrollToRowAtIndexPath:visibleRowPaths[1] atScrollPosition:UITableViewScrollPositionTop animated:YES];
    }
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
}

#pragma mark Initialization

- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame]))
    {
        self.horizontalTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kCellHeight, kTableLength)];
        self.horizontalTableView.showsVerticalScrollIndicator = NO;
        self.horizontalTableView.showsHorizontalScrollIndicator = NO;
        self.horizontalTableView.transform = CGAffineTransformMakeRotation(-M_PI * 0.5);
        [self.horizontalTableView setFrame:CGRectMake(kRowHorizontalPadding * 0.5, kRowVerticalPadding * 0.5, kTableLength - kRowHorizontalPadding, kCellHeight)];
        
        self.horizontalTableView.rowHeight = kCellWidth;
        self.horizontalTableView.backgroundColor = kHorizontalTableBackgroundColor;
        self.horizontalTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        self.horizontalTableView.separatorColor = [UIColor clearColor];
        self.horizontalTableView.dataSource = self;
        self.horizontalTableView.delegate = self;
        [self addSubview:self.horizontalTableView];
    }
    
    return self;
}

#pragma mark - Memory Management

- (NSString *) reuseIdentifier
{
    return @"HorizontalTableViewAsCell";
}


@end
