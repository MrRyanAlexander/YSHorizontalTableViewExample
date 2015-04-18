//
//  YSHorizontalCell.m
//  YourStore
//
//  Created by Ryan Alex on 4/7/15.
//  Copyright (c) 2015 YourStore. All rights reserved.
//

#import "YSHorizontalCell.h"
#import "YSConstants.h"
@interface YSHorizontalCell()
@property(nonatomic, readonly) UIUserInterfaceIdiom userInterfaceIdiom;
@end
@implementation YSHorizontalCell
@synthesize thumbnail = _thumbnail;
@synthesize titleLabel = _titleLabel;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    self.thumbnail = [[YSRoundedCornersImageView alloc]initWithFrame:kRoundedCornersImageViewFrame_iPhone];
    [self.contentView addSubview:self.thumbnail];
    
    self.titleLabel = [[YSHorizontalCellLabel alloc] initWithFrame:CGRectMake(self.thumbnail.frame.size.width * 0.17, self.thumbnail.frame.size.height * 0.832, self.thumbnail.frame.size.width, self.thumbnail.frame.size.height * 0.7)];
    self.titleLabel.text = @"Hello Cat";
    [self.contentView addSubview:self.titleLabel];
    
    self.backgroundColor = [UIColor whiteColor];
    self.selectedBackgroundView = [[UIView alloc] initWithFrame:self.thumbnail.frame];
    self.selectedBackgroundView.backgroundColor = kHorizontalTableSelectedBackgroundColor;
    self.transform = CGAffineTransformMakeRotation(M_PI * 0.5);
    
    return self;
}


#pragma mark - View Lifecycle

- (NSString *)reuseIdentifier
{
    return @"HorizontalCell";
}

#pragma mark - Memory Management

@end
