//
//  YSAppDelegate.m
//  YourStore
//
//  Created by Ryan Alex on 4/5/15.
//  Copyright (c) 2015 YourStore. All rights reserved.
//

#import "YSAppDelegate.h"
#import "YSConstants.h"

@interface YSAppDelegate ()
@property(nonatomic, readonly) UIUserInterfaceIdiom userInterfaceIdiom;
@end

@implementation YSAppDelegate
@synthesize location = _location;
@synthesize isSession = _isSession;
@synthesize categoryIndex = _categoryIndex;
@synthesize categoriesData = _categoriesData;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    BOOL iSiPad = self.userInterfaceIdiom == UIUserInterfaceIdiomPad ? YES : NO;
    
    self.categoriesData = @{
                            @"Food"     :@[@"Fresh",@"Cold",@"Frozen"],
                            @"Laundry"  :@[@"Wash", @"Dry", @"DryClean"],
                            @"Storage"  :@[@"Garage",@"Shed",@"Chest"],
                            @"Tools"    :@[@"Electric",@"Gas",@"Industrial"]
                            };
    
    
    NSLog(@"Type of device string : %@", KRandomString);
    


    // Override point for customization after application launch.
    
    [Parse enableLocalDatastore];
    
    // Initialize Parse.
    [Parse setApplicationId:kApplicationId clientKey:kClientId];
    
    // [Optional] Track statistics around application opens.
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
    
    [PFGeoPoint geoPointForCurrentLocationInBackground:^(PFGeoPoint *geoPoint, NSError *error) {
        if (!error) {
            NSLog(@"\n@return Geo point : %@", geoPoint);
            // do something with the new geoPoint
            self.location = geoPoint;
        }
        else {
            NSLog(@"Geo request Error : %@", error);
        }
    }];
    
    UIUserNotificationType userNotificationTypes = (UIUserNotificationTypeAlert |
                                                    UIUserNotificationTypeBadge |
                                                    UIUserNotificationTypeSound);
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:userNotificationTypes
                                                                             categories:nil];
    [application registerUserNotificationSettings:settings];
    [application registerForRemoteNotifications];
    
    if (application.applicationState != UIApplicationStateBackground) {
        // Track an app open here if we launch with a push, unless
        // "content_available" was used to trigger a background push (introduced
        // in iOS 7). In that case, we skip tracking here to avoid double
        // counting the app-open.
        BOOL preBackgroundPush = ![application respondsToSelector:@selector(backgroundRefreshStatus)];
        BOOL oldPushHandlerOnly = ![self respondsToSelector:@selector(application:didReceiveRemoteNotification:fetchCompletionHandler:)];
        BOOL noPushPayload = ![launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
        if (preBackgroundPush || oldPushHandlerOnly || noPushPayload) {
            [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
        }
    }
    
    self.isSession = [PFUser currentUser] ? YES : NO;
    
    if (!self.isSession) {
        [PFAnonymousUtils logInWithBlock:^(PFUser *user, NSError *error) {
            if (error) {
                //Since this error is not likely to happen in any case except an internet failure
                //use it as a way to know that the internet is not currently available
                NSLog(@"No internet available :-(");
            } else {
                NSLog(@"Anonymous user logged in.");
            }
        }];
    }
    
    return YES;
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    // Store the deviceToken in the current installation and save it to Parse.
    PFInstallation *currentInstallation = [PFInstallation currentInstallation];
    [currentInstallation setDeviceTokenFromData:deviceToken];
    [currentInstallation saveInBackground];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    [PFPush handlePush:userInfo];
}

- (void)application:(UIApplication *)application
didReceiveRemoteNotification:(NSDictionary *)userInfo
fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))handler {
    if (application.applicationState == UIApplicationStateInactive) {
        // The application was just brought from the background to the foreground,
        // so we consider the app as having been "opened by a push notification."
        [PFAnalytics trackAppOpenedWithRemoteNotificationPayload:userInfo];
    }
    // Create empty photo object
    NSString *photoId = [userInfo objectForKey:@"p"];
    PFObject *targetPhoto = [PFObject objectWithoutDataWithClassName:@"Photo"
                                                            objectId:photoId];
    
    // Fetch photo object
    [targetPhoto fetchIfNeededInBackgroundWithBlock:^(PFObject *object, NSError *error) {
        // Show photo view controller
        if (error) {
            handler(UIBackgroundFetchResultFailed);
        } else if ([PFUser currentUser]) {
            //PhotoVC *viewController = [[PhotoVC alloc] initWithPhoto:object];
            //[self.navController pushViewController:viewController animated:YES];
            handler(UIBackgroundFetchResultNewData);
        } else {
            handler(UIBackgroundFetchResultNoData);
        }
    }];
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    PFInstallation *currentInstallation = [PFInstallation currentInstallation];
    if (currentInstallation.badge != 0) {
        currentInstallation.badge = 0;
        [currentInstallation saveEventually];
    }
    if (application.applicationState == UIApplicationStateInactive) {
        [PFGeoPoint geoPointForCurrentLocationInBackground:^(PFGeoPoint *geoPoint, NSError *error) {
            if (!error) {
                // do something with the new geoPoint
                self.location = geoPoint;
            }
        }];
    }
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
