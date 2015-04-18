//
//  YSReview.m
//  YourStore
//
//  Created by Ryan Alex on 4/6/15.
//  Copyright (c) 2015 YourStore. All rights reserved.
//

#import "YSReview.h"
#import "YSConstants.h"

@implementation YSReview

@dynamic title;
@dynamic reviewerId;
@dynamic description;
@dynamic rating;

+ (void)load{
    [self registerSubclass];
}

+ (NSString*)parseClassName {
    return kReviewClassName;
}

@end
