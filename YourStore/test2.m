//
//  test2.m
//  YourStore
//
//  Created by Ryan Alex on 4/6/15.
//  Copyright (c) 2015 YourStore. All rights reserved.
//

#import "test2.h"

@implementation test2

-(NSString*)testName {
    return @"test 2";
}

-(NSString*)fakeNewName {
    self.fakeName = @"new fake name";
    return self.fakeName;
}
@end
