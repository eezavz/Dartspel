//
//  SwitchViewController.m
//  Dartspel
//
//  Created by ManIkWeet on 17-09-13.
//  Copyright (c) 2013 Groep 1. All rights reserved.
//

#import "SwitchViewController.h"
#import "DartbordViewController.h"
#import "SettingsViewController.h"

@interface SwitchViewController ()

@end

@implementation SwitchViewController

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    //NSLog(@"%d", toInterfaceOrientation);
    if(toInterfaceOrientation == UIInterfaceOrientationPortrait || toInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown)
    {
        NSLog(@"port");
        [self.dartbordViewController turnScreen:1];
    }
    else 
    {
        NSLog(@"land");
        [self.dartbordViewController turnScreen:2];
    }
}

- (IBAction) switchViews:(UIBarButtonItem *)sender
{
    if (self.settingsViewController.view.superview == nil) {
        if (self.settingsViewController == nil) {
            self.settingsViewController = [[SettingsViewController alloc] initWithNibName:@"SettingsView" bundle:nil];
        }
        
        [self.view addSubview:self.settingsViewController.view];
        CGRect onscreen = self.dartbordViewController.view.frame;
        onscreen.origin.x = 0;
        CGRect offscreenRight = self.settingsViewController.view.frame;
        offscreenRight.origin.x = offscreenRight.size.width;
        self.settingsViewController.view.frame = offscreenRight;// somewhere offscreen, in the direction you want it to appear from
        CGRect offscreenLeft = self.dartbordViewController.view.frame;
        offscreenLeft.origin.x = -offscreenLeft.size.width;
        [UIView animateWithDuration:0.5 animations:^{
            self.settingsViewController.view.frame = self.dartbordViewController.view.frame;// its final location
            self.dartbordViewController.view.frame = offscreenLeft;// its final location
            sender.title = @"Dartbord";
            
        }
                         completion:^(BOOL finished){
                             if(finished) {
                                 [self.dartbordViewController.view removeFromSuperview];
                             }}];
        
    } else if (self.dartbordViewController.view.superview == nil) {
        if (self.dartbordViewController == nil) {
            self.dartbordViewController = [[DartbordViewController alloc] initWithNibName:@"DartbordView" bundle:nil];
        }
        
        [self.view addSubview:self.dartbordViewController.view];
        CGRect onscreen = self.dartbordViewController.view.frame;
        onscreen.origin.x = 0;
        CGRect offscreenLeft = self.dartbordViewController.view.frame;
        offscreenLeft.origin.x = -offscreenLeft.size.width;
        self.dartbordViewController.view.frame = offscreenLeft;// somewhere offscreen, in the direction you want it to appear from
        CGRect offscreenRight = self.settingsViewController.view.frame;
        offscreenRight.origin.x = offscreenRight.size.width;
        [UIView animateWithDuration:0.5 animations:^{
            self.dartbordViewController.view.frame = onscreen;// its final location
            self.settingsViewController.view.frame = offscreenRight;// its final location
            sender.title = @"Instellingen";
        }
                         completion:^(BOOL finished){
                             if(finished) {
                                 [self.settingsViewController.view removeFromSuperview];
                                 
                             }}];
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

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.dartbordViewController = [[DartbordViewController alloc] initWithNibName:@"DartbordView" bundle:nil];
    [self.view insertSubview:self.dartbordViewController.view atIndex:0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
