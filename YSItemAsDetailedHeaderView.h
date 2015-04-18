//
//  YSItemAsDetailedHeaderView.h
//  YourStore
//
//  Created by Ryan Alex on 4/6/15.
//  Copyright (c) 2015 YourStore. All rights reserved.
//

//#import <UIKit/UIKit.h>

@interface YSItemAsDetailedHeaderView : UIView

@property (strong, nonatomic) UIImageView   *itemImage;
@property (strong, nonatomic) UILabel       *itemNameLabel;
@property (strong, nonatomic) UILabel       *itemPriceLabel;
@property (strong, nonatomic) UILabel       *itemStoreNameLabel;
@property (strong, nonatomic) UILabel       *itemRatingLabel;
@property (strong, nonatomic) UIButton      *itemOrderButton;


- (instancetype) initWithData:(NSDictionary*)data;

@end
