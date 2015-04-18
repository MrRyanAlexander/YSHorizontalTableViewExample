//
//  YSPageHeaderView.m
//  YourStore
//
//  Created by Ryan Alex on 4/12/15.
//  Copyright (c) 2015 YourStore. All rights reserved.
//

#import "YSPageHeaderView.h"
#import "YSConstants.h"

@implementation YSPageHeaderView

- (instancetype) init {
    self = [super init];
    if (self) {
        self.offsetAddition = 64;

        self.frame = CGRectMake(0, 0, 0, kHeaderViewHeight);
        
    }
    return self;
}

@end
