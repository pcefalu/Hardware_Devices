//
//  CCreditsViewController.m
//  Hardware_Devices
//
//  Created by Paul Cefalu on 2/10/14.
//  Copyright (c) 2014 Paul Cefalu. All rights reserved.
//

#import "CCreditsViewController.h"

@interface CCreditsViewController ()

@end

@implementation CCreditsViewController


//============================================================================
- (void)viewDidLoad
{	// Implement viewDidLoad to do additional setup
  // after loading the view, typically from a nib.
	//------------------------------------------------------
  
	[super  viewDidLoad];
  
  if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)])
  { // Hide Status Bar for IOS 7
    //----------------------------------------------------
    [self prefersStatusBarHidden];
    [self performSelector:@selector(setNeedsStatusBarAppearanceUpdate)];
  }
  else
  { // Hide Status Bar for IOS 6
    //----------------------------------------------------
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
  }
  
	//------------------------------------------------------
}	// End of viewDidLoad Method.


//============================================================================
- (void)didReceiveMemoryWarning
{	// Declare Variables
	//------------------------------------------------------
  
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
  
	//------------------------------------------------------
}	// End of didReceiveMemoryWarning Method.


@end




