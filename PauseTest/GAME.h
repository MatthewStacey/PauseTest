//
//  GAME.h
//  PauseTest
//
//  Created by Matthew Stacey on 03/12/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PauseView.h"

@interface GAME : UIViewController<PauseMenuAction> {
    
}

   @property (retain) PauseView *pv;

- (void) pauseMenuResult:(int)action;
- (IBAction) pausePressed;
- (void) mainMenuPressed;
@end
