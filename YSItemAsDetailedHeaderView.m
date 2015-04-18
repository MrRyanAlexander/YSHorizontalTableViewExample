//
//  YSItemAsDetailedHeaderView.m
//  YourStore
//
//  Created by Ryan Alex on 4/6/15.
//  Copyright (c) 2015 YourStore. All rights reserved.
//

#import "YSItemAsDetailedHeaderView.h"

@implementation YSItemAsDetailedHeaderView

@synthesize itemImage           = _itemImage;
@synthesize itemNameLabel       = _itemNameLabel;
@synthesize itemPriceLabel      = _itemPriceLabel;
@synthesize itemStoreNameLabel  = _itemStoreNameLabel;
@synthesize itemRatingLabel     = _itemRatingLabel;
@synthesize itemOrderButton     = _itemOrderButton;

- (instancetype) initWithData:(NSDictionary *)data {
    self = [super init];
    if (self) {
        
    }
    return self;
}

@end
