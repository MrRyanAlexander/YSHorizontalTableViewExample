//
//  YSStore.m
//  YourStore
//
//  Created by Ryan Alex on 4/6/15.
//  Copyright (c) 2015 YourStore. All rights reserved.
//

#import "YSStore.h"
#import "YSConstants.h"

@implementation YSStore

@dynamic title;
@dynamic mission;
@dynamic description;
@dynamic imageFile;
@dynamic rating;
@dynamic items;
@dynamic reviews;

+(void)load{
    [self registerSubclass];
}

+(NSString*)parseClassName {
    return kStoreClassName;
}

@end
