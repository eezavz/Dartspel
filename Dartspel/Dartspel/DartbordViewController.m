//
//  DartbordViewController.m
//  Dartspel
//
//  Created by ManIkWeet on 17-09-13.
//  Copyright (c) 2013 Groep 1. All rights reserved.
//

#import "DartbordViewController.h"
#define degreesToRadians(x) (M_PI * (x) / 180.0)

@interface DartbordViewController ()

@end

@implementation DartbordViewController
@synthesize hor;
@synthesize vert;
@synthesize dartbord;
@synthesize dartbord2;
@synthesize crosshair;
@synthesize crosshair2;
@synthesize xSlider;
@synthesize ySlider;
@synthesize xSlider2;
@synthesize ySlider2;



- (IBAction)gooi:(id)sender {
    NSLog(@"test");
}

- (IBAction)richt:(id)sender {
    CGRect frame = crosshair.frame;
    frame.origin.x = dartbord.frame.origin.x + xSlider.value - frame.size.width / 2;
    frame.origin.y = dartbord.frame.origin.y + ySlider.value - frame.size.height / 2;
    crosshair.frame = frame;
}

- (IBAction)richt2:(id)sender
{
    CGRect frame = crosshair2.frame;
    frame.origin.x = dartbord2.frame.origin.x + xSlider2.value - frame.size.width / 2;
    frame.origin.y = dartbord2.frame.origin.y + ySlider2.value - frame.size.height / 2;
    crosshair2.frame = frame;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) viewDidAppear:(BOOL)animated {
    [self richt:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    CGAffineTransform trans = CGAffineTransformMakeRotation(M_PI * 0.5);
    ySlider.transform = trans;
    ySlider2.transform = trans;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
