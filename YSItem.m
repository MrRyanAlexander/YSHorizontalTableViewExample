//
//  YSItem.m
//  YourStore
//
//  Created by Ryan Alex on 4/6/15.
//  Copyright (c) 2015 YourStore. All rights reserved.
//

#import "YSItem.h"
#import "YSConstants.h"

@implementation YSItem

@dynamic title;
@dynamic storeId;
@dynamic description;
@dynamic imageFile;
@dynamic price;
@dynamic rating;
@dynamic reviews;

+(void)load {
    [self registerSubclass];
}

+(NSString *)parseClassName {
    return kItemClassName;
}

@end
