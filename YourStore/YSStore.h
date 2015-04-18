//
//  YSStore.h
//  YourStore
//
//  Created by Ryan Alex on 4/6/15.
//  Copyright (c) 2015 YourStore. All rights reserved.
//

#import <Parse/Parse.h>

@interface YSStore : PFObject<PFSubclassing>

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *mission;
@property (strong, nonatomic) NSString *description;
@property (strong, nonatomic) PFFile *imageFile;
@property (assign, nonatomic) NSUInteger *rating;
@property (strong, nonatomic) NSMutableArray *items;
@property (strong, nonatomic) NSMutableArray *reviews;

@end
