//
//  YSOrder.m
//  YourStore
//
//  Created by Ryan Alex on 4/6/15.
//  Copyright (c) 2015 YourStore. All rights reserved.
//

#import "YSOrder.h"
#import "YSConstants.h"

@implementation YSOrder

@dynamic itemId;
@dynamic transactionComplete;

+(void)load{
    [self registerSubclass];
}

+(NSString*)parseClassName {
    return kOrderClassName;
}

@end
