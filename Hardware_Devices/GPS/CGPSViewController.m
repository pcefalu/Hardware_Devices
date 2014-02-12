//
//  CGPSViewController.m
//  Hardware_Devices
//
//  Created by Paul Cefalu on 2/10/14.
//  Copyright (c) 2014 Paul Cefalu. All rights reserved.
//

#import "CGPSViewController.h"


#define SEG_LOCATE_VIEW_CONTROLLER         0
#define SEG_TRACK_VIEW_CONTROLLER          1


//============================================================================
@interface CGPSViewController ()

@end


//============================================================================
@implementation CGPSViewController


//============================================================================
- (void)TemplateMethod
{	// Declare Variables
	//------------------------------------------------------
  
  
  
	//------------------------------------------------------
}	// End of TemplateMethod Method.


//============================================================================
#pragma mark Controller Default Method Handlers

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
  
  self.navigationItem.title                        = @"GPS";
  self.navigationItem.leftBarButtonItem.tintColor  = [UIColor cyanColor];
  
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


//============================================================================
#pragma mark Controller Custom Method Handlers

//==================================================================================
- (IBAction)segmentCtrlChanged:(id)sender
{ // Start of Code
  //-------------------------------------------------------------
  
  UISegmentedControl *seg = sender;
  
  switch(seg.selectedSegmentIndex)
  {
    case SEG_LOCATE_VIEW_CONTROLLER:
    { // Display Get Location Controller
      //---------------------------------------------------------
      [self performSegueWithIdentifier:@"Locate"  sender:self];
      break;
    }
      
    case SEG_TRACK_VIEW_CONTROLLER:
    { // Display Credits View Controller
      //---------------------------------------------------------
      [self performSegueWithIdentifier:@"Track"  sender:self];
      break;
    }
      
    default:
      break;
  }
  
  //-------------------------------------------------------------
} // End of segmentCtrlChanged Method


@end
