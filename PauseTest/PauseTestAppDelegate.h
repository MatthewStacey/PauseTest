//
//  PauseTestAppDelegate.h
//  PauseTest
//
//  Created by Matthew Stacey on 03/12/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PauseTestViewController, GAME;

@interface PauseTestAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet PauseTestViewController *pauseViewController;
@property (nonatomic, retain) IBOutlet GAME *gameViewController;

-(void) displayGame;
-(void) displayMainMenu;
@end
