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


}

   @property (retain) UIImageView *ivBlack;
   @property (retain) UIImageView *ivBackground;
   @property (retain) UILabel *ModeTitle;
   @property (retain) UILabel *detailsLabel;
   @property (retain) UILabel *titleLabel;

   @property (assign) id <PauseMenuAction> delegate;


-(id)initWithFrame:(CGRect)frame totalQuestions:(int) totalQuestions questionNumber: (int) questionNumber;
//- (id)initWithFrame:(CGRect)frame :(int) totalQuestions: (int) questionNumber;
-(void)showPauseView;
-(void)hidePauseView;
-(void)mainMenuButtonPressed;
-(void)continueButtonPressed;
//@property (assign) id delegate;

@end
