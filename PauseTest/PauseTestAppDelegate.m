//
//  PauseTestAppDelegate.m
//  PauseTest
//
//  Created by Matthew Stacey on 03/12/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PauseTestAppDelegate.h"
#import "GAME.h"
#import "PauseTestViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation PauseTestAppDelegate


@synthesize window=_window;
@synthesize pauseViewController=_viewController;
@synthesize gameViewController;

-(void) displayGame
{
    GAME *game = [[GAME alloc] initWithNibName:@"GAME" bundle:nil];  
    [self setGameViewController:game];
	[game release];
    
    
    // First create a CATransition object to describe the transition
    CATransition *transition = [CATransition animation];
    // Animate over 3/4 of a second
    transition.duration = 1.0f;
    // using the ease in/out timing function
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    transition.type = kCATransitionFade;
    
    transition.delegate = self;
    
    // Next add it to the containerView's layer. This will perform the transition based on how we change its contents.
    [self.window.layer addAnimation:transition forKey:nil];
    
    
    [self.pauseViewController.view removeFromSuperview];
    [self.window addSubview:[gameViewController view]];
    
}

-(void) displayMainMenu
{
    // First create a CATransition object to describe the transition
    CATransition *transition = [CATransition animation];
    // Animate over 3/4 of a second
    transition.duration = 1.0f;
    // using the ease in/out timing function
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    transition.type = kCATransitionFade;
    
    transition.delegate = self;
    
    // Next add it to the containerView's layer. This will perform the transition based on how we change its contents.
    [self.window.layer addAnimation:transition forKey:nil];
    
    [gameViewController.view removeFromSuperview];

    
    [self.window addSubview:[self.pauseViewController view]];
    [UIView commitAnimations];
    
    [gameViewController release];
    gameViewController = nil;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
     
    self.window.rootViewController = self.pauseViewController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)dealloc
{
    [_window release];
    [_viewController release];
    [gameViewController release];
    [super dealloc];
}

@end
