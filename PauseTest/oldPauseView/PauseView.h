//
//  PauseView.h
//  PauseTest
//
//  Created by Matthew Stacey on 03/12/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PauseMenuAction <NSObject>
@required
- (void) pauseMenuResult:(int)action;
@end

@interface PauseView : UIView {
	UILabel		*titleLabel;
	UILabel		*msgLabel;
	int			newDelay;
	int			newY;
	int			newX;
    
    id <PauseMenuAction> delegate;
}
-(void) returnPressed;
-(void) mainMenuPressed;
- (id)initWithTitle:(NSString *)title message:(NSString *)msg;
- (void)showMsgWithDelay:(int)delay;

@property (assign) id delegate;

@end
