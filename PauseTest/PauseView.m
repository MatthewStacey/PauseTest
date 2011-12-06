//
//  PauseView.m
//  PauseTest
//
//  Created by Matthew Stacey on 03/12/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PauseView.h"

@implementation PauseView

@synthesize ivBlack=_ivBlack;
@synthesize ivBackground=iv_Background;
@synthesize ModeTitle=_ModeTitle;
@synthesize detailsLabel=_detailsLabel;
@synthesize titleLabel=_titleLabel;
@synthesize  delegate=_delegate;


//@synthesize delegate;

-(id)initWithFrame:(CGRect)frame totalQuestions:(int) totalQuestions questionNumber: (int) questionNumber
{
    self = [super initWithFrame:frame];
    if (self) {

        self.ivBlack = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"backgroundPauseBox.png"]];
        self.ivBackground = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background.png"]];
        
        [self addSubview:self.ivBackground];
        [self addSubview:self.ivBlack];
        
        
        self.ModeTitle = [[UILabel alloc] initWithFrame:CGRectMake(30, 30, 260, 30)];
        self.ModeTitle.text = [NSString stringWithFormat:@"%@ Level", @"First"];
        self.ModeTitle.font = [UIFont fontWithName:@"Michroma" size:20];
        self.ModeTitle.textAlignment = UITextAlignmentCenter;
        self.ModeTitle.textColor = [UIColor whiteColor];
        self.ModeTitle.backgroundColor = [UIColor clearColor];
        [self addSubview:self.ModeTitle];
        
        self.detailsLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 80, 260, 30)];
        self.detailsLabel.font = [UIFont fontWithName:@"Michroma" size:14];
        self.detailsLabel.numberOfLines = 0; // this means infinite
        int questionsLeft = ((totalQuestions - questionNumber) + 1);
        if (questionsLeft == 0) {
            self.detailsLabel.text = [NSString stringWithFormat:@"Keep going, this is the last question for the round!",questionsLeft];
        }
        else   
        {
            if (questionsLeft == 1) {
                self.detailsLabel.text = [NSString stringWithFormat:@"Keep going, just one more question for the round!",questionsLeft];
            }
            else
            {
                self.detailsLabel.text = [NSString stringWithFormat:@"Keep going, after this one there are %d questions left for the round!",questionsLeft];
            }
        }
        self.detailsLabel.textAlignment = UITextAlignmentCenter;
        self.detailsLabel.textColor = [UIColor whiteColor];
        self.detailsLabel.backgroundColor = [UIColor clearColor];
        [self.detailsLabel sizeToFit];
        [self addSubview:self.detailsLabel];
        
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
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 300, 260, 30)];
        self.titleLabel.font = [UIFont fontWithName:@"Michroma" size:24];
        self.titleLabel.text = @"GAME PAUSED";
        self.titleLabel.textAlignment = UITextAlignmentCenter;
        self.titleLabel.textColor = [UIColor whiteColor];
        self.titleLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:self.titleLabel];

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
	//[self release];
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
    [self.ivBlack removeFromSuperview];
    [self.ivBackground removeFromSuperview];
    [self.ivBlack release], self.ivBlack=Nil;
    [self.ivBackground release], self.ivBackground=Nil;
    [self.ModeTitle release], self.ModeTitle=Nil;
    [self.detailsLabel release], self.detailsLabel=Nil;
    [self.titleLabel release], self.titleLabel=Nil;
    [super dealloc];
}

@end
