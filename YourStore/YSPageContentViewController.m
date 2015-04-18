//
//  YSPageContentViewController.m
//  YourStore
//
//  Created by Ryan Alex on 4/10/15.
//  Copyright (c) 2015 YourStore. All rights reserved.
//

#import "YSPageContentViewController.h"

@interface YSPageContentViewController ()

@end

@implementation YSPageContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    //self.imageView.image = self.image;
    self.imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:self.imageView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
