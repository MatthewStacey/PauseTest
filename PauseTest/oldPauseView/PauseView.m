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

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)hideMsg;
{
	// Slide the view off screen
	CGRect frame = self.frame;
	int retractY;
	int retractX;
	
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:.75];
	
				//slideup
			retractY = 0;
			retractX = 0;
				
	frame.origin.y = retractY;
	frame.origin.x = retractX;
	self.frame = frame;
	
	//to autorelease the Msg, define stop selector
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
	
	[UIView commitAnimations];
}

- (void)animationDidStop:(NSString*)animationID finished:(BOOL)finished context:(void *)context 
{
	[self removeFromSuperview];
	[self release];
}

-(void) returnPressed
{
    [[self delegate] pauseMenuResult:0];
    [self hideMsg];
}
-(void) mainMenuPressed
{
     [[self delegate] pauseMenuResult:1];
    [self hideMsg];
}
- (id)initWithTitle:(NSString *)title message:(NSString *)msg
{
    if (self == [super init]) 
    {
        self.frame = CGRectMake(0, 480, 320, 480);
        [self setBackgroundColor:[UIColor blackColor]];
        [self setAlpha:.87];
        newY = 0;
        newX = 0;
        
        UIButton *retbtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [retbtn setTitle:@"RETURN" forState:UIControlStateNormal];
        [retbtn addTarget:self 
                              action:@selector(returnPressed)
                    forControlEvents:UIControlEventTouchDown];
        [retbtn setFrame:CGRectMake(20,200,69,69)];
        [self addSubview:retbtn];
        
        UIButton *mainmenubtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [mainmenubtn setTitle:@"MENU" forState:UIControlStateNormal];
        [mainmenubtn addTarget:self 
                              action:@selector(mainMenuPressed)
                    forControlEvents:UIControlEventTouchDown];
        [mainmenubtn setFrame:CGRectMake(120,200,69,69)];
        [self addSubview:mainmenubtn];
        
        // Title
        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 3, 280, 20)];
        titleLabel.font = [UIFont boldSystemFontOfSize:17];
        titleLabel.text = title;
        titleLabel.textAlignment = UITextAlignmentCenter;
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:titleLabel];
        
        // Message
        msgLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, 280, 80)];
        msgLabel.font = [UIFont systemFontOfSize:15];
        msgLabel.text = msg;
        msgLabel.textAlignment = UITextAlignmentCenter;
        msgLabel.lineBreakMode = UILineBreakModeWordWrap;
        msgLabel.numberOfLines = 0;	//no limit
        msgLabel.textColor = [UIColor whiteColor];
        msgLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:msgLabel];
    }
    
    return self;
}

- (void)showMsgWithDelay:(int)delay
{
    //  UIView *view = self.view;
	CGRect frame = self.frame;
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:.75];
    
	// Slide up based on y axis
	// A better solution over a hard-coded value would be to
	// determine the size of the title and msg labels and 
	// set this value accordingly
	
	frame.origin.y = newY;
	frame.origin.x = newX;
	self.frame = frame;
    
	[UIView commitAnimations];
    
	// Hide the view after the requested delay
	//[self performSelector:@selector(hideMsg) withObject:nil afterDelay:delay];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)dealloc
{
    if ([self superview])
        [self removeFromSuperview];
    [titleLabel release];
    [msgLabel release];
    [super dealloc];
}

@end
