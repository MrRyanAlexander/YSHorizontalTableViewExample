//
//  YSItem.h
//  YourStore
//
//  Created by Ryan Alex on 4/6/15.
//  Copyright (c) 2015 YourStore. All rights reserved.
//

#import <Parse/Parse.h>
#import <ParseUI/ParseUI.h>

@interface YSItem : PFObject<PFSubclassing>

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *storeId;
@property (strong, nonatomic) NSString *description;
@property (strong, nonatomic) PFFile *imageFile;
@property (assign, nonatomic) NSUInteger *price;
@property (assign, nonatomic) NSUInteger *rating;
@property (strong, nonatomic) NSMutableArray *reviews;

@end
