//
//  ViewController.m
//  DCProgressBarExp
//
//  Created by zeta on 13/7/30.
//  Copyright (c) 2013年 zeta. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+DCProgressBarExtention.h"

@interface ViewController ()

@end

@implementation ViewController {
    CGFloat _progress;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib
    _progress = 0.1;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startLoading:(id)sender {
    [self dc_startLoading];
}

- (IBAction)stopLoading:(id)sender {
    [self dc_stopLoading];
}

- (IBAction)showProgress:(id)sender {
    _progress *= 1.5;
    if (_progress > 1) _progress = 0.1;
    [self dc_setProgress:_progress];
}

- (IBAction)toggleNavBar:(id)sender {
    self.navigationController.navigationBarHidden = !self.navigationController.navigationBarHidden;
}
@end
