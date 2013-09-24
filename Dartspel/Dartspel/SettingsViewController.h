//
//  SettingsViewController.h
//  Dartspel
//
//  Created by ManIkWeet on 17-09-13.
//  Copyright (c) 2013 Groep 1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController

@property (nonatomic, retain)IBOutlet UISegmentedControl * moeilijkheidsgraad;
- (int)getMoeilijkheidsgraad;
@end
