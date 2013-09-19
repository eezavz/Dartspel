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
@property (strong, nonatomic) IBOutlet UIImageView *crosshair;
@property (strong, nonatomic) IBOutlet UISlider *ySlider;
@property (strong, nonatomic) IBOutlet UISlider *xSlider;
- (IBAction)gooi:(id)sender;
- (IBAction)richt:(id)sender;


@end
