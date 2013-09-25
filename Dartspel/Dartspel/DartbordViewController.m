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
@synthesize moeilijkheidsgraad;


- (void)turnScreen:(BOOL)portrait
{
//    NSLog(@"Current: %@", NSStringFromCGRect(self.view.bounds));
//    NSLog(@"Vertical: %@", NSStringFromCGRect(self.vert.bounds));
//    NSLog(@"Horizontal: %@", NSStringFromCGRect(self.hor.bounds));
    if(portrait)
    {
        NSLog(@"Verticaal");
        CGRect temp = vert.bounds;
        self.view = self.vert;
        self.view.frame = temp;
    } else {
        NSLog(@"Horizontaal");
        CGRect temp = hor.bounds;
        self.view = self.hor;
        self.view.frame = temp;
    }
}

- (int) distanceFromPoint:(int)p2x: (int)p2y: (int)p1
{
    int xDist = (p2x - p1);
    int yDist = (p2y - p1);
    return sqrt((xDist * xDist) + (yDist * yDist));
}

- (IBAction)gooi:(id)sender {
    int point;
    int mg = random() % 20*moeilijkheidsgraad;
    NSString * pointsText;
    if(self.interfaceOrientation == UIInterfaceOrientationPortrait || self.interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown)
    {
        point = 250 - [self distanceFromPoint:xSlider.value: ySlider.value: 125];
        point = point - mg;
        pointsText = [NSString stringWithFormat:@"Points: %i", point];
    }else{
        point = 250 - [self distanceFromPoint:xSlider2.value: ySlider2.value: 93];
        point = point - mg;
        pointsText = [NSString stringWithFormat:@"Points: %i", point];
    }
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Points" message:pointsText delegate:self cancelButtonTitle:@"Ok!" otherButtonTitles:nil];
    [alert show];
}

- (IBAction)richt:(id)sender {
    if(self.interfaceOrientation == UIInterfaceOrientationPortrait || self.interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown)
    {
        CGRect frame = crosshair.frame;
        frame.origin.x = dartbord.frame.origin.x + xSlider.value - frame.size.width / 2;
        frame.origin.y = dartbord.frame.origin.y + ySlider.value - frame.size.height / 2;
        crosshair.frame = frame;
    } else {
        CGRect frame = crosshair2.frame;
        frame.origin.x = dartbord2.frame.origin.x + xSlider2.value - frame.size.width / 2;
        frame.origin.y = dartbord2.frame.origin.y + ySlider2.value - frame.size.height / 2;
        crosshair2.frame = frame;
    }
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
    //NSLog(@"%@", NSStringFromCGRect(hor.bounds));
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
