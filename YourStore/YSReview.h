//
//  YSReview.h
//  YourStore
//
//  Created by Ryan Alex on 4/6/15.
//  Copyright (c) 2015 YourStore. All rights reserved.
//

#import <Parse/Parse.h>

@interface YSReview : PFObject<PFSubclassing>

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *reviewerId;
@property (strong, nonatomic) NSString *description;
@property (assign, nonatomic) NSUInteger *rating;

@end
