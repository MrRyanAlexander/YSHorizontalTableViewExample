//
//  YSConstants.h
//  YourStore
//
//  Created by Ryan Alex on 4/7/15.
//  Copyright (c) 2015 YourStore. All rights reserved.
//

#ifndef YourStore_YSConstants_h
#define YourStore_YSConstants_h


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Class Name Strings
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#define kItemClassName              @"Item"
#define kReviewClassName            @"Review"
#define kOrderClassName             @"Order"
#define kStoreClassName             @"Store"

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// String Formats
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#define kPriceFormat                @"$%ld"


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Identity Strings
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#define kApplicationId @"15TihTueCQu5BZdPEfRfwLWBONH17SO0QleqebqT"
#define kClientId      @"Zro9scQ5d1FH4vSZNUok0ZXL2qxdT5RHzGmMypGz"

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)


#define KRandomString IS_IPAD ? @"iPad" : @"iPhone"
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// View Constansts
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Height of the headerView imported into views
#define kHeaderViewHeight (IS_IPAD ? 150.0f : 135.0f)

// Width of the headerView imported into views
#define kHeaderViewWidth (IS_IPAD ? 768.0f : 320.0f)

// Width (or length before rotation) of the table view embedded within another table view's row
#define kTableLength (IS_IPAD ? 768 : 320)

// Width of the cells of the embedded table view (after rotation, which means it controls the rowHeight property)
#define kCellWidth (IS_IPAD ? 192 : 100)

// Height of the cells of the embedded table view (after rotation, which would be the table's width)
#define kCellHeight (IS_IPAD ? 192 : 146)

// Padding for the Cell containing the article image and title
#define kArticleCellVerticalInnerPadding (IS_IPAD ? 4 : 10)
#define kArticleCellHorizontalInnerPadding (IS_IPAD ? 4 : 10)

// height of RoundedCornersImageView
#define kRoundedCornersImageViewHeight (IS_IPAD ? 120 : 80)

// width of RoundedCornersImageView
#define kRoundedCornersImageViewWidth (IS_IPAD ? 120 : 80)

#define kRoundedCornersImageViewFrame_iPad   CGRectMake(4, 4, 120, 120)
#define kRoundedCornersImageViewFrame_iPhone CGRectMake(10, 10, 80, 80)

// Height for the Headlines section of the main (vertical) table view
#define kHeadlinesSectionHeight (IS_IPAD ? 65 : 40)

// Height for regular sections in the main table view
#define kRegularSectionHeight (IS_IPAD ? 65 : 40)

// Padding for the title label in an article's cell
#define kArticleTitleLabelPadding 0

// Vertical padding for the embedded table view within the row
#define kRowVerticalPadding 0

// Horizontal padding for the embedded table view within the row
#define kRowHorizontalPadding 0

// The background color of the vertical table view
#define kVerticalTableBackgroundColor [UIColor lightGrayColor]//[UIColor colorWithRed:0.58823529 green:0.58823529 blue:0.58823529 alpha:1.0]

// Background color for the horizontal table view (the one embedded inside the rows of our vertical table)
#define kHorizontalTableBackgroundColor [UIColor whiteColor]//[UIColor colorWithRed:0.6745098 green:0.6745098 blue:0.6745098 alpha:1.0]

// The background color on the horizontal table view for when we select a particular cell
#define kHorizontalTableSelectedBackgroundColor [UIColor whiteColor]//[UIColor colorWithRed:0.0 green:0.59607843 blue:0.37254902 alpha:1.0]



























#endif
