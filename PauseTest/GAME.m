//
//  GAME.m
//  PauseTest
//
//  Created by Matthew Stacey on 03/12/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GAME.h"
#import "PauseView.h"
#import "PauseTestAppDelegate.h"

@implementation GAME

@synthesize pv=_pv;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)mainMenuPressed
{
    PauseTestAppDelegate *mainDelegate = (PauseTestAppDelegate *)[[UIApplication sharedApplication] delegate];
    
	[mainDelegate displayMainMenu];
}

- (void) pauseMenuResult:(int)action
{
    switch (action) {
        case 0:
            //Display MainMenu
            [self mainMenuPressed];
            break;
        default:        
            //do nothing - let the pause menu clear
            break;
    }
    NSLog(@"IN GAME DELEGATE METHOD BUTTON %i WAS CLICKED", action);
    
}

- (IBAction) pausePressed
{
CGRect startFrame = CGRectMake(0, -500, 320, 480);
   if (!self.pv) {
       self.pv = [[PauseView alloc] initWithFrame: startFrame totalQuestions:10 questionNumber:3];
       [self.pv setDelegate: self];
       [self.view addSubview:self.pv];
   }
   self.pv.frame = startFrame;
   [self.pv showPauseView];
}

- (void)dealloc
{
    [super dealloc];
    [self.pv release], self.pv = Nil;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
