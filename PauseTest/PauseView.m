//
//  PauseView.m
//  PauseTest
//
//  Created by Matthew Stacey on 03/12/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PauseView.h"

@implementation PauseView

@synthesize delegate;

- (id)initWithFrame:(CGRect)frame :(int) totalQuestions: (int) questionNumber
{
    self = [super initWithFrame:frame];
    if (self) {

        ivBlack = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"backgroundPauseBox.png"]];
        ivBackground = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background.png"]];
        
        [self addSubview:ivBackground];
        [self addSubview:ivBlack];
        
        
        ModeTitle = [[UILabel alloc] initWithFrame:CGRectMake(30, 30, 260, 30)];
        ModeTitle.text = [NSString stringWithFormat:@"%@ Level", @"First"];
        ModeTitle.font = [UIFont fontWithName:@"Michroma" size:20];
        ModeTitle.textAlignment = UITextAlignmentCenter;
        ModeTitle.textColor = [UIColor whiteColor];
        ModeTitle.backgroundColor = [UIColor clearColor];
        [self addSubview:ModeTitle];
        
        detailsLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 80, 260, 30)];
        detailsLabel.font = [UIFont fontWithName:@"Michroma" size:14];
        detailsLabel.numberOfLines = 0; // this means infinite
        int questionsLeft = ((totalQuestions - questionNumber) + 1);
        if (questionsLeft == 0) {
            detailsLabel.text = [NSString stringWithFormat:@"Keep going, this is the last question for the round!",questionsLeft];
        }
        else   
        {
            if (questionsLeft == 1) {
                detailsLabel.text = [NSString stringWithFormat:@"Keep going, just one more question for the round!",questionsLeft];
            }
            else
            {
                detailsLabel.text = [NSString stringWithFormat:@"Keep going, after this one there are %d questions left for the round!",questionsLeft];
            }
        }
        detailsLabel.textAlignment = UITextAlignmentCenter;
        detailsLabel.textColor = [UIColor whiteColor];
        detailsLabel.backgroundColor = [UIColor clearColor];
        [detailsLabel sizeToFit];
        [self addSubview:detailsLabel];
        
        UIButton *levelSelectButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [levelSelectButton addTarget:self 
                              action:@selector(mainMenuButtonPressed)
                    forControlEvents:UIControlEventTouchDown];
        [levelSelectButton setFrame:CGRectMake(20,200,69,69)];
        UIImage *levelSelectImg = [UIImage imageNamed:@"buttonMainMenu.png"];
        [levelSelectButton setBackgroundImage:levelSelectImg forState:UIControlStateNormal];
        [self addSubview:levelSelectButton];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button addTarget:self 
                   action:@selector(continueButtonPressed)
         forControlEvents:UIControlEventTouchDown];
        [button setFrame:CGRectMake(220,200,69,69)];
        UIImage *resume = [UIImage imageNamed:@"buttonPauseback.png"];
        [button setBackgroundImage:resume forState:UIControlStateNormal];
        [self addSubview:button];
        
        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 300, 260, 30)];
        titleLabel.font = [UIFont fontWithName:@"Michroma" size:24];
        titleLabel.text = @"GAME PAUSED";
        titleLabel.textAlignment = UITextAlignmentCenter;
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:titleLabel];

    }
    return self;
}

-(void)showPauseView
{
    CGRect frame = self.frame;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:.75];
    
    frame.origin.y = 0;
    self.frame = frame;
    
    [UIView commitAnimations];
}

-(void)hidePauseView
{
    CGRect frame = self.frame;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.25];
    frame.origin.y = -500;
    self.frame = frame;
    
	[UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
	
	[UIView commitAnimations];
}

- (void)animationDidStop:(NSString*)animationID finished:(BOOL)finished context:(void *)context 
{
	[self removeFromSuperview];
	[self release];
}

-(void)continueButtonPressed
{
    [[self delegate] pauseMenuResult:1];
    [self hidePauseView];
}
-(void)mainMenuButtonPressed
{
    [[self delegate] pauseMenuResult:0];
    [self hidePauseView];
}

- (void)dealloc
{
    [ivBlack removeFromSuperview];
    [ivBackground removeFromSuperview];
    [ivBlack release], ivBlack=Nil;
    [ivBackground release], ivBackground=Nil;
    [ModeTitle release], ModeTitle=Nil;
    [detailsLabel release], detailsLabel=Nil;
    [titleLabel release], titleLabel=Nil;
    if ([self superview])
        [self removeFromSuperview];
    [super dealloc];
}

@end
