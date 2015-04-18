//
//  YSPageViewController.h
//  YourStore
//
//  Created by Ryan Alex on 4/10/15.
//  Copyright (c) 2015 YourStore. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YSPageViewController : UIPageViewController<UIPageViewControllerDelegate, UIPageViewControllerDataSource>

- (instancetype)initWithTransitionStyle:(UIPageViewControllerTransitionStyle)style
                  navigationOrientation:(UIPageViewControllerNavigationOrientation)navigationOrientation
                                options:(NSDictionary *)options
                                   data:(NSMutableArray*)data;
@property NSUInteger index;

@end
