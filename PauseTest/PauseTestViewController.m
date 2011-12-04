//
//  PauseTestViewController.m
//  PauseTest
//
//  Created by Matthew Stacey on 03/12/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PauseTestViewController.h"
#import "GAME.h"
#import "PauseTestAppDelegate.h"

@implementation PauseTestViewController

- (void)dealloc
{
    [super dealloc];
}

-(IBAction) displayGame
{
    PauseTestAppDelegate *mainDelegate = (PauseTestAppDelegate *)[[UIApplication sharedApplication] delegate];
    
	[mainDelegate displayGame];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
