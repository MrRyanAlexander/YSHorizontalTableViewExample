//
//  YSHorizontalCellLabel.m
//  YourStore
//
//  Created by Ryan Alex on 4/11/15.
//  Copyright (c) 2015 YourStore. All rights reserved.
//

#import "YSHorizontalCellLabel.h"
#import "YSConstants.h" 

@implementation YSHorizontalCellLabel

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.opaque = YES;
        super.backgroundColor = [UIColor clearColor];
        self.textColor = [UIColor blackColor];
        self.font = [UIFont boldSystemFontOfSize:11];
        self.numberOfLines = 2;
    }
    return self;
}

- (void)drawTextInRect:(CGRect)rect
{
    CGFloat height = [self sizeThatFits:rect.size].height;
    
    rect.origin.y += rect.size.height - height;
    rect.size.height = height;
    
    [super drawTextInRect:rect];
}


@end
