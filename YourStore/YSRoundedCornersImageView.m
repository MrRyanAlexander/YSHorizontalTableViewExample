//
//  YSRoundedCornersImageView.m
//  YourStore
//
//  Created by Ryan Alex on 4/11/15.
//  Copyright (c) 2015 YourStore. All rights reserved.
//

#import "YSRoundedCornersImageView.h"
#import "YSConstants.h"

@implementation YSRoundedCornersImageView

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.opaque = YES;
        self.layer.cornerRadius = 20;
        self.layer.masksToBounds = YES;
    }
    return self;
}


@end
