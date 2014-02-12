//
//  CAccelerometerViewController.m
//  Hardware_Devices
//
//  Created by Paul Cefalu on 2/10/14.
//  Copyright (c) 2014 Paul Cefalu. All rights reserved.
//

#import "GraphView.h"
#import "AccelerometerFilter.h"
#import "CAccelerometerViewController.h"

#define kUpdateFrequency	60.0
#define kLocalizedPause		NSLocalizedString(@"Pause","pause taking samples")
#define kLocalizedResume	NSLocalizedString(@"Resume","resume taking samples")


//============================================================================
@interface CAccelerometerViewController ()
{	// Declare Private Data Members
	//------------------------------------------------------
  
	AccelerometerFilter *filter;
	BOOL isPaused, useAdaptive;
}

@property (nonatomic, strong) IBOutlet GraphView *unfiltered;
@property (nonatomic, strong) IBOutlet GraphView *filtered;
@property (nonatomic, strong) IBOutlet UIBarButtonItem *pause;
@property (nonatomic, strong) IBOutlet UILabel *filterLabel;

- (IBAction)pauseOrResume:(id)sender;
- (IBAction)filterSelect:(id)sender;
- (IBAction)adaptiveSelect:(id)sender;

// Sets up a new filter. Since the filter's class matters and not a particular instance
// we just pass in the class and -changeFilter: will setup the proper filter.
- (void)changeFilter:(Class)filterClass;

@end

  //------------------------------------------------------
  // End of CAccelerometerViewController Class.


//============================================================================
@implementation CAccelerometerViewController

@synthesize unfiltered, filtered, pause, filterLabel;


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
  
  [self InitializeAccelerometer];
  
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
#pragma mark IBAction Method Handlers

//============================================================================
- (IBAction)pauseOrResume:(id)sender
{	// Declare Variables
	//------------------------------------------------------
  
	if (isPaused)
	{ // If we're paused, then resume and set the title to "Pause"
    //----------------------------------------------------
		isPaused = NO;
		pause.title = kLocalizedPause;
	}
	else
	{ // If we are not paused, then pause and set the title to "Resume"
    //----------------------------------------------------
		isPaused = YES;
		pause.title = kLocalizedResume;
	}
	
	// Inform accessibility clients that the pause/resume button has changed.
	UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, nil);
  
	//------------------------------------------------------
}	// End of pauseOrResume Method.


//============================================================================
- (IBAction)filterSelect:(id)sender
{	// Declare Variables
	//------------------------------------------------------
  
	if ([sender selectedSegmentIndex] == 0)
	{ // Index 0 of the segment selects the lowpass filter
    //----------------------------------------------------
		[self changeFilter:[LowpassFilter class]];
	}
	else
	{ // Index 1 of the segment selects the highpass filter
    //----------------------------------------------------
		[self changeFilter:[HighpassFilter class]];
	}
  
	// Inform accessibility clients that the filter has changed.
	UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, nil);
  
	//------------------------------------------------------
}	// End of filterSelect Method.


//============================================================================
- (IBAction)adaptiveSelect:(id)sender
{	// Index 1 is to use the adaptive filter,
  // so if selected then set useAdaptive appropriately
	//------------------------------------------------------
  
	useAdaptive = [sender selectedSegmentIndex] == 1;
  
	// and update our filter and filterLabel
	filter.adaptive = useAdaptive;
	filterLabel.text = filter.name;
	
	// Inform accessibility clients that the adaptive selection has changed.
	UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, nil);
  
	//------------------------------------------------------
}	// End of adaptiveSelect Method.


//============================================================================
#pragma mark Controller Custom Method Handlers

//============================================================================
- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
{	// UIAccelerometerDelegate method, called when the device accelerates.
	//------------------------------------------------------
  
	if (!isPaused)
  {	// Update the accelerometer graph view
    //----------------------------------------------------
		[filter addAcceleration:acceleration];
		[unfiltered addX:acceleration.x y:acceleration.y z:acceleration.z];
		[filtered addX:filter.x y:filter.y z:filter.z];
	}
  
	//------------------------------------------------------
}	// End of didAccelerate Method.


//============================================================================
- (void)changeFilter:(Class)filterClass
{	// Ensure that the new filter class is different from the current one...
	//------------------------------------------------------
  
	if (filterClass != [filter class])
  {	// And if it is, release the old one and create a new one.
    //----------------------------------------------------
		filter = [[filterClass alloc] initWithSampleRate:kUpdateFrequency cutoffFrequency:5.0];
    
		// Set the adaptive flag
		filter.adaptive = useAdaptive;
    
		// And update the filterLabel with the new filter name.
		filterLabel.text = filter.name;
	}
  
	//------------------------------------------------------
}	// End of changeFilter Method.


//============================================================================
- (void)InitializeAccelerometer
{	// Declare Variables
	//------------------------------------------------------
  
	pause.possibleTitles = [NSSet setWithObjects:kLocalizedPause, kLocalizedResume, nil];
	isPaused = NO;
	useAdaptive = NO;
	[self changeFilter:[LowpassFilter class]];
	[[UIAccelerometer sharedAccelerometer] setUpdateInterval:1.0 / kUpdateFrequency];
	[[UIAccelerometer sharedAccelerometer] setDelegate:self];
	
	[unfiltered setIsAccessibilityElement:YES];
	[unfiltered setAccessibilityLabel:NSLocalizedString(@"unfilteredGraph", @"")];
  
	[filtered setIsAccessibilityElement:YES];
	[filtered setAccessibilityLabel:NSLocalizedString(@"filteredGraph", @"")];
  
	//------------------------------------------------------
}	// End of InitializeAccelerometer Method.


@end
