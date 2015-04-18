//
//  YSAppDelegate.h
//  YourStore
//
//  Created by Ryan Alex on 4/5/15.
//  Copyright (c) 2015 YourStore. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

#define YSDelegate (YSAppDelegate*)[[UIApplication sharedApplication]delegate]

@interface YSAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) PFGeoPoint *location;
@property (assign, nonatomic) NSInteger categoryIndex;
@property (assign, nonatomic) BOOL isSession;
@property (strong, nonatomic) NSDictionary *categoriesData;
@end

/*!
 Categories :
 
    Food:
    
        Fresh
        Cold
        Frozen
 
    Laundry:
    
        Wash
        Dry
        DryClean
 
    Storage:
 
        Garage
        Shed
        Chest
 
    Tools: 
 
        Electric
        Gas
        Industrial
 */