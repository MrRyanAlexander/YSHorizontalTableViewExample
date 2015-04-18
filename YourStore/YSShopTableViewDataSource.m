//
//  YSShopTableViewDataSource.m
//  YourStore
//
//  Created by Ryan Alex on 4/7/15.
//  Copyright (c) 2015 YourStore. All rights reserved.
//

#import "YSShopTableViewDataSource.h"
#import "YSAppDelegate.h"
#import "YSItem.h"
#import "YSConstants.h"
#import "YSHorizontalCell.h"
#import "YSHorizontalTableViewAsCell.h"

@implementation YSShopTableViewDataSource {
    NSMutableArray *headerViewImages;
}

@synthesize data            = _data;
@synthesize reuseCells      = _reuseCells;
@synthesize headerViewImages = _headerViewImages;

- (instancetype) init {
    self = [super init];
    if (self) {
        [self setup];
        
    }
    return self;
}


- (void)cleanup {
    self.data = nil;
    self.reuseCells = nil;
}

- (void)setup {
    
    UIImage *image1 = [UIImage imageNamed:@"eye.jpeg"];
    
    self.headerViewImages = [[NSMutableArray alloc]initWithObjects:image1, image1, image1, image1,image1, image1, image1, image1, nil];
    
    self.reuseCells = [[NSMutableArray alloc]init];
    
    for (int i=0; i<self.headerViewImages.count-1; i++) {

        YSHorizontalTableViewAsCell *cell = [[YSHorizontalTableViewAsCell alloc] initWithFrame:CGRectMake(0, 0, 320, 416)];
        cell.items = self.headerViewImages;
        
        [self.reuseCells addObject:cell];
    }
    
    
    
    if ([YSDelegate location]) {
        
        PFQuery *query = [YSItem query];
        query.cachePolicy = kPFCachePolicyNetworkElseCache;
        query.limit = 100;
        [query whereKey:@"category" equalTo:[[[YSDelegate categoriesData] allKeys] objectAtIndex:[YSDelegate categoryIndex]]];
        [query whereKey:@"location" nearGeoPoint:[YSDelegate location]];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            
            if (!error) {
                
                //initialize mutable arrays to store objects by sub category
                NSMutableArray *index0 = [[NSMutableArray alloc]init];
                NSMutableArray *index1 = [[NSMutableArray alloc]init];
                NSMutableArray *index2 = [[NSMutableArray alloc]init];
                
                //make sure the _data is empty
                if (self.data) {
                    self.data = nil;
                }
                
                //initialize data array with the empty mutable arrays above
                self.data = [NSMutableArray arrayWithObjects:index0,index1,index2, nil];
                
                //iterate @return objects
                [objects enumerateObjectsUsingBlock:^(id obj1, NSUInteger idx, BOOL *stop) {
                    
                    //get object sub category string
                    NSString *objSubcateogry = [obj1 objectForKey:@"subCategory"];
                    
                    //iterate local sub categories
                    [[[[YSDelegate categoriesData] allKeys] objectAtIndex:[YSDelegate categoryIndex]] enumerateObjectsUsingBlock:^(id obj2, NSUInteger idx, BOOL *stop) {
                        
                        //compare object sub category to the Nth local sub category
                        if ([objSubcateogry isEqualToString:((NSString*)obj2)]) {
                            
                            //add match to the Nth array in data
                            NSLog(@"adding @return query match");
                            [[self.data objectAtIndex:idx] addObject:obj1];
                            
                        }
                        
                    }];
                    
                }];
                
            } else {
                NSLog(@"Query Error :%@", error);
                //query error
            }
        }];
        
    }
    else
    {
        //no location
        NSLog(@"No Location to Query with");
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.reuseCells.count;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YSHorizontalCell *cell = [self.reuseCells objectAtIndex:indexPath.section];
    return cell;
}

- (UIView*)tableView:(UITableView*)tableView headerForSection :(NSInteger)section {
    UIView *customSectionHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, kRegularSectionHeight)];
    customSectionHeaderView.backgroundColor = [UIColor whiteColor];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(kArticleCellHorizontalInnerPadding, 0, tableView.frame.size.width, kRegularSectionHeight)];
    UIFont *labelFont = [UIFont systemFontOfSize:16];
    [titleLabel setTextColor:[UIColor blackColor]];
    [titleLabel setBackgroundColor:[UIColor clearColor]];
    titleLabel.font = labelFont;
    titleLabel.text = @"Category Name";
    
    
    [customSectionHeaderView addSubview:titleLabel];
    
    return customSectionHeaderView;
}

- (CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section {
    return kRegularSectionHeight;
}
- (NSInteger)tableRowHeight {
    return kCellHeight + (kRowVerticalPadding * 0.5) + ((kRowVerticalPadding * 0.5) * 2);
}

- (UIColor*)backgroundColor {
    return kVerticalTableBackgroundColor;
}
@end
