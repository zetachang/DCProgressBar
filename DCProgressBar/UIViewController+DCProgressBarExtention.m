//
//  UIViewController+DCProgressBarExtention.m
//  DCProgressBarExp
//
//  Created by zeta on 13/8/2.
//  Copyright (c) 2013年 zeta. All rights reserved.
//

#import "UIViewController+DCProgressBarExtention.h"
#import <objc/runtime.h>
#import "DCProgressBar.h"

static char kDCProgressBarKey;
static const int DCProgressBarHeight = 3;

@interface UIViewController (_DCProgressBar)
@property (readwrite, nonatomic, strong, setter = dc_setProgressBar:) DCProgressBar *dc_progressBar;
@end

@implementation UIViewController (DCProgressBarExtention)

- (DCProgressBar *)dc_progressBar {
    return (DCProgressBar *) objc_getAssociatedObject(self, &kDCProgressBarKey);
}

- (void)dc_setProgressBar:(DCProgressBar *)dc_progressBar {
    objc_setAssociatedObject(self, &kDCProgressBarKey, dc_progressBar, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void) dc_startLoading {
    [self prepareProgressBar];
    [[self dc_progressBar] startLoading];
}

- (void) dc_stopLoading {
    [self prepareProgressBar];
    [[self dc_progressBar] stopLoading];
}

- (void) dc_setProgress:(float)progress{
    [self prepareProgressBar];
    [[self dc_progressBar] setProgress:progress];
}

- (void)prepareProgressBar {
    if ([self dc_progressBar] == nil) {
        CGRect frame = CGRectMake(0, CGRectGetHeight(self.navigationController.navigationBar.frame) - DCProgressBarHeight + 1, self.view.bounds.size.width, DCProgressBarHeight);
        DCProgressBar* progressBar = [[DCProgressBar alloc] initWithFrame:frame];
        [self.navigationController.navigationBar addSubview:progressBar];
        
        
        [self dc_setProgressBar:progressBar];
        
    }
}

@end
