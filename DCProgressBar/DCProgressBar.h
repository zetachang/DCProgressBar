//
//  DCProgressBar.h
//  DCProgressBarExp
//
//  Created by zeta on 13/7/30.
//  Copyright (c) 2013年 zeta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DCProgressBar : UIView

@property (nonatomic, strong) UIColor* progressBarColor;
@property (nonatomic, readonly) float progress;

- (void) startLoading;
- (void) stopLoading;
- (void) setProgress: (float) progress;

@end
