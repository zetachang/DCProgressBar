//
//  ViewController.h
//  DCProgressBarExp
//
//  Created by zeta on 13/7/30.
//  Copyright (c) 2013年 zeta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DCProgressBar.h"

@interface ViewController : UIViewController

- (IBAction)startLoading:(id)sender;
- (IBAction)stopLoading:(id)sender;
- (IBAction)showProgress:(id)sender;
- (IBAction)toggleNavBar:(id)sender;

@end
