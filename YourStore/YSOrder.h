//
//  YSOrder.h
//  YourStore
//
//  Created by Ryan Alex on 4/6/15.
//  Copyright (c) 2015 YourStore. All rights reserved.
//

#import <Parse/Parse.h>

@interface YSOrder : PFObject<PFSubclassing>

@property (strong, nonatomic) NSString *itemId;
@property (assign, nonatomic) BOOL     transactionComplete;
@end
