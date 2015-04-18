//
//  YSPageViewController.m
//  YourStore
//
//  Created by Ryan Alex on 4/10/15.
//  Copyright (c) 2015 YourStore. All rights reserved.
//

#import "YSPageViewController.h"
#import "YSPageContentViewController.h"

@interface YSPageViewController ()
@property (strong, nonatomic) NSMutableArray *items;
@end

@implementation YSPageViewController

- (instancetype)initWithTransitionStyle:(UIPageViewControllerTransitionStyle)style
                  navigationOrientation:(UIPageViewControllerNavigationOrientation)navigationOrientation
                                options:(NSDictionary *)options
                                   data:(NSMutableArray*)data {
    
    self = [super initWithTransitionStyle:style navigationOrientation:navigationOrientation options:options];
    if (self) {
        //additional customization
        self.items = data;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.index = 0;
    self.delegate = self;
    self.dataSource = self;
    self.view.backgroundColor = [ UIColor whiteColor];

    [NSTimer scheduledTimerWithTimeInterval:10.0
                                     target:self
                                   selector:@selector(loadNextController)
                                   userInfo:nil
                                    repeats:YES];

    if (self.items.count==0) {
        UIImage *image1 = [UIImage imageNamed:@"eye.jpeg"];
        
        self.items = [[NSMutableArray alloc]initWithObjects:image1, image1, image1, image1,image1, image1, image1, image1, nil];
    }
    NSArray *startingViewControllers = @[[self viewControllerAtIndex:self.index]];
    [self setViewControllers: startingViewControllers
                   direction: UIPageViewControllerNavigationDirectionForward
                    animated: YES
                  completion: nil];
}

- (UIViewController*)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSUInteger index = ((YSPageContentViewController*) viewController).pageIndex;
    if (index > 0 ) {
        return [self viewControllerAtIndex:index-1];
    }
    return nil;
}

- (UIViewController*)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSUInteger index = ((YSPageContentViewController*) viewController).pageIndex;
    if (index+1 < [self.items count] ) {
        return [self viewControllerAtIndex:index+1];
    }
    return nil;
}

- (YSPageContentViewController *)viewControllerAtIndex:(NSUInteger)index{
    if (index < [self.items count]) {
        YSPageContentViewController *pageContentViewController =   [[YSPageContentViewController alloc]init];
        pageContentViewController.pageIndex = index;
        dispatch_queue_t concurrentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        dispatch_async(concurrentQueue, ^{
            UIImage *image = nil;
            image = (UIImage*)self.items[index];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [pageContentViewController.imageView setImage:image];
            });
        });
        return pageContentViewController;
    }
    return nil;
}

/*! set next controller */
- (void)loadNextController {
    YSPageContentViewController *nextViewController = [self viewControllerAtIndex:self.index++];
    if (nextViewController == nil) {
        self.index = 0;
        nextViewController = [self viewControllerAtIndex:self.index];
    }
    [self setViewControllers:@[nextViewController]
                   direction:UIPageViewControllerNavigationDirectionForward
                    animated:YES
                  completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
