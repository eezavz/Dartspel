//
//  DartbordViewController.h
//  Dartspel
//
//  Created by ManIkWeet on 17-09-13.
//  Copyright (c) 2013 Groep 1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DartbordViewController : UIViewController
{
    UIView * hor;
    UIView * vert;
    
}
@property (strong, retain) IBOutlet UIView * hor;
@property (strong, retain) IBOutlet UIView * vert;
@property (strong, nonatomic) IBOutlet UIImageView *dartbord;
@property (strong, retain) IBOutlet UIImageView * dartbord2;
@property (strong, nonatomic) IBOutlet UIImageView *crosshair;
@property (strong, retain) IBOutlet UIImageView * crosshair2;
@property (strong, nonatomic) IBOutlet UISlider *ySlider;
@property (strong, nonatomic) IBOutlet UISlider *xSlider;
@property (strong, retain) IBOutlet UISlider * ySlider2;
@property (strong, retain) IBOutlet UISlider * xSlider2;
- (IBAction)gooi:(id)sender;
- (IBAction)richt:(id)sender;
- (void)turnScreen:(BOOL)portrait;


@end
