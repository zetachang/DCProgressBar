//
//  UIViewController+DCProgressBarExtention.h
//  DCProgressBarExp
//
//  Created by zeta on 13/8/2.
//  Copyright (c) 2013年 zeta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (DCProgressBarExtention)

- (void) dc_startLoading;
- (void) dc_stopLoading;
- (void) dc_setProgress: (float) progress;

@end
