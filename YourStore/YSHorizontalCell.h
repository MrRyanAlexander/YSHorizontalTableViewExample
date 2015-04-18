//
//  YSHorizontalCell.h
//  YourStore
//
//  Created by Ryan Alex on 4/7/15.
//  Copyright (c) 2015 YourStore. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YSRoundedCornersImageView.h"
#import "YSHorizontalCellLabel.h"

@interface YSHorizontalCell : UITableViewCell

@property (nonatomic, retain) YSRoundedCornersImageView *thumbnail;
@property (nonatomic, retain) YSHorizontalCellLabel *titleLabel;

@end
