//
//  SwitchViewController.h
//  Dartspel
//
//  Created by ManIkWeet on 17-09-13.
//  Copyright (c) 2013 Groep 1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DartbordViewController.h"
#import "SettingsViewController.h"
#define degreesToRadians(x) (M_PI * (x) / 180.0)

@interface SwitchViewController : UIViewController

@property (strong, nonatomic) DartbordViewController *dartbordViewController;
@property (strong, nonatomic) SettingsViewController *settingsViewController;

- (IBAction) switchViews:(UIBarButtonItem *)sender;

@end
