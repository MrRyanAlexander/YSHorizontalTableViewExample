//
//  test1.m
//  YourStore
//
//  Created by Ryan Alex on 4/6/15.
//  Copyright (c) 2015 YourStore. All rights reserved.
//

#import "test1.h"

@implementation test1
//@synthesize testName = _testName;

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.fakeName = @"fake name";
    }
    return self;
}


-(NSString*)testName {
    return @"test 1";
}

@end
