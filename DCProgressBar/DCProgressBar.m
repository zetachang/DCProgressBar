//
//  DCProgressBar.m
//  DCProgressBarExp
//
//  Created by zeta on 13/7/30.
//  Copyright (c) 2013年 zeta. All rights reserved.
//

#import "DCProgressBar.h"
#import <QuartzCore/QuartzCore.h>
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface DCProgressBar()

@property (nonatomic, readwrite) CGFloat progressBarHeight;

@end

@implementation DCProgressBar {
    CALayer* _loadingLayer;
    CALayer* _progressLayer;
}


- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.progressBarColor = UIColorFromRGB(0x007AFF);
        self.progressBarHeight = 2.5;
        self.progress = 0.0;
    }
    return self;
}


- (void) startLoading {
    if (_loadingLayer == nil) {
        _loadingLayer = [self loadingLayer];
    }
    
    if (_loadingLayer.superlayer == nil) {
        self.layer.sublayers = @[_loadingLayer];
    }
}

- (void) stopLoading {
    [_loadingLayer removeFromSuperlayer];
}

- (void)setProgress:(float)progress {
    if (_progressLayer == nil) {
        _progressLayer = [self progressLayerWithProgress:progress];
    }
    
    if (_progressLayer.superlayer == nil) {
        self.layer.sublayers = @[_progressLayer];
    }
    
    CGFloat oldProgress = self.progress;
    _progress = (progress > 1) ? 1 : progress;
    
    CABasicAnimation* anim = [CABasicAnimation animation];
    anim.fromValue = @(self.bounds.size.width * oldProgress);
    anim.toValue = @(self.bounds.size.width * self.progress);
    anim.duration = 0.2; // Guess from the system default progress bar
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    [_progressLayer addAnimation:anim forKey:@"bounds.size.width"];
}

- (CALayer*) progressLayerWithProgress: (float) progress {
    CALayer* layer = [CALayer layer];
    
    layer.anchorPoint = CGPointMake(0, 0);
    layer.frame = CGRectMake(0, 0, 0, self.progressBarHeight);
    layer.contentsScale = [UIScreen mainScreen].scale;
    layer.contentsGravity = kCAGravityTopLeft;
    layer.backgroundColor = self.progressBarColor.CGColor;
    
    return layer;
}

- (CALayer*) loadingLayer {
    CAGradientLayer *gradient = [CAGradientLayer layer];
    
    gradient.contentsScale = [UIScreen mainScreen].scale;
    gradient.frame = CGRectMake(0, 0, self.bounds.size.width, self.progressBarHeight);
    gradient.startPoint = CGPointMake(0.0, 0.5);
    gradient.endPoint = CGPointMake(1.0, 0.5);
    
    UIColor *c1 = UIColorFromRGB(0x007AFF);
    UIColor *c2 = [UIColor whiteColor]; //UIColorFromRGB(0xF9F9F9);
    UIColor *c3 = UIColorFromRGB(0x007AFF);
    
    gradient.colors = @[(id)c1.CGColor, (id)c2.CGColor, (id)c3.CGColor];
    gradient.locations = @[@0, @0, @1];
    
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"locations"];
    anim.toValue = @[@0, @1, @1];
    anim.duration = 1.5;
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    //anim.autoreverses = YES;
    anim.repeatDuration = INFINITY;
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    
    [gradient addAnimation:anim forKey:@"locations"];
    
    return gradient;
}

// Experimental Effect
- (CALayer*) successLayer {
    CAGradientLayer* layer = [CAGradientLayer layer];
    layer.frame = self.bounds;
    layer.startPoint = CGPointMake(0.0, 0.5);
    layer.endPoint = CGPointMake(1.0, 0.5);
    UIColor* green = UIColorFromRGB(0x45D775);
    UIColor* white = [UIColor whiteColor];
    layer.colors = @[(id)white.CGColor, (id)green.CGColor, (id)white.CGColor];
    
    CABasicAnimation* anim = [CABasicAnimation animationWithKeyPath:@"colors"];
    anim.toValue = @[(id)green.CGColor, (id)green.CGColor, (id)green.CGColor];
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    anim.duration = 0.2;
    //anim.removedOnCompletion = NO;
    //anim.fillMode = kCAFillModeForwards;
    anim.beginTime = 0.0;
    
    CABasicAnimation* final = [CABasicAnimation animationWithKeyPath:@"colors"];
    //final.fromValue = @[(id)green.CGColor, (id)white.CGColor, (id)green.CGColor];
    final.toValue = @[(id)white.CGColor, (id)white.CGColor, (id)white.CGColor];
    final.beginTime = 0.2;
    final.duration = 0.1;
    final.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    
    CAAnimationGroup* group = [CAAnimationGroup animation];
    group.animations = @[anim, final];
    group.duration = 0.3;
    group.removedOnCompletion = NO;
    group.fillMode = kCAFillModeForwards;
    
    [layer addAnimation:group forKey:@"success"];
    
    return layer;
}

@end
