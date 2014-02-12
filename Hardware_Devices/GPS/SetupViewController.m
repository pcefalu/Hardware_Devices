//
//  SetupViewController.m
//  Hardware_Devices
//
//  Created by Paul Cefalu on 2/10/14.
//  Copyright (c) 2014 Paul Cefalu. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>

#import "CAccuracyCellViewController.h"
#import "SetupViewController.h"

NSString * const kSetupInfoKeyAccuracy          = @"SetupInfoKeyAccuracy";
NSString * const kSetupInfoKeyDistanceFilter    = @"SetupInfoKeyDistanceFilter";
NSString * const kSetupInfoKeyTimeout           = @"SetupInfoKeyTimeout";

static NSString * const kAccuracyNameKey        = @"AccuracyNameKey";
static NSString * const kAccuracyValueKey       = @"AccuracyValueKey";

@implementation SetupViewController

@synthesize poDelegate;
@synthesize setupInfo;
@synthesize accuracyOptions;
@synthesize configureForTracking;
@synthesize accuracyPicker;
@synthesize slider;
@synthesize lblSelectedAccuracy;
@synthesize lblSelectedTimeout;
@synthesize intSelectedAccuracyID;


//============================================================================
- (void)TemplateMethod
{	// Declare Variables
	//------------------------------------------------------
  
  
  
	//------------------------------------------------------
}	// End of TemplateMethod Method.


#pragma mark Controller Default Method Handlers

//============================================================================
- (void)viewDidLoad
{	// Declare Variables
	//------------------------------------------------------
  
  self.navigationItem.leftBarButtonItem.tintColor  = [UIColor cyanColor];

  NSMutableArray *options = [NSMutableArray array];
  [options addObject:[NSDictionary dictionaryWithObjectsAndKeys:NSLocalizedString(@"AccuracyBest", @"AccuracyBest"),
                      kAccuracyNameKey, [NSNumber numberWithDouble:kCLLocationAccuracyBest], kAccuracyValueKey, nil]];
  
  [options addObject:[NSDictionary dictionaryWithObjectsAndKeys:NSLocalizedString(@"Accuracy10", @"Accuracy10"),
                      kAccuracyNameKey, [NSNumber numberWithDouble:kCLLocationAccuracyNearestTenMeters], kAccuracyValueKey, nil]];
  
  [options addObject:[NSDictionary dictionaryWithObjectsAndKeys:NSLocalizedString(@"Accuracy100", @"Accuracy100"),
                      kAccuracyNameKey, [NSNumber numberWithDouble:kCLLocationAccuracyHundredMeters], kAccuracyValueKey, nil]];
  
  [options addObject:[NSDictionary dictionaryWithObjectsAndKeys:NSLocalizedString(@"Accuracy1000", @"Accuracy1000"),
                      kAccuracyNameKey, [NSNumber numberWithDouble:kCLLocationAccuracyKilometer], kAccuracyValueKey, nil]];
  
  [options addObject:[NSDictionary dictionaryWithObjectsAndKeys:NSLocalizedString(@"Accuracy3000", @"Accuracy3000"),
                      kAccuracyNameKey, [NSNumber numberWithDouble:kCLLocationAccuracyThreeKilometers], kAccuracyValueKey, nil]];
  
  self.accuracyOptions         = options;
  self.slider.value            = INT_SETUP_VIEW_CELL_DEFAULT_TIMEOUT_SECONDS;
  
  [self.accuracyPicker reloadData];
  
	//------------------------------------------------------
}	// End of viewDidLoad Method.


//============================================================================
- (void)viewDidUnload
{	// Declare Variables
	//------------------------------------------------------
  
  self.accuracyPicker           = nil;
  self.slider                   = nil;
  self.lblSelectedAccuracy      = nil;
  self.lblSelectedTimeout       = nil;
  
	//------------------------------------------------------
}	// End of viewDidUnload Method.


//============================================================================
- (void)dealloc
{	// Declare Variables
	//------------------------------------------------------
  
  
  
	//------------------------------------------------------
}	// End of dealloc Method.


//============================================================================
- (void)viewWillAppear:(BOOL)animated
{	// Declare Variables
	//------------------------------------------------------
  
  [super viewWillAppear:animated];
  
  self.setupInfo = [NSMutableDictionary dictionary];
  [setupInfo setObject:[NSNumber numberWithDouble:INT_SETUP_VIEW_CELL_DEFAULT_DISTANCE_FILTER] forKey:kSetupInfoKeyDistanceFilter];
  [setupInfo setObject:[NSNumber numberWithDouble:INT_SETUP_VIEW_CELL_DEFAULT_TIMEOUT_SECONDS] forKey:kSetupInfoKeyTimeout];
  [setupInfo setObject:[NSNumber numberWithDouble:DBL_SETUP_VIEW_CELL_DEFAULT_LOCATION_ACCURACY] forKey:kSetupInfoKeyAccuracy];
  
	//------------------------------------------------------
}	// End of viewWillAppear Method.


#pragma mark Controller Custom Method Handlers

//============================================================================
- (void)UpdateConfigureStatusInfo
{	// Declare Variables
	//------------------------------------------------------
  
  NSDictionary *optionForRow = [accuracyOptions objectAtIndex:self.intSelectedAccuracyID];
  [setupInfo setObject:[optionForRow objectForKey:kAccuracyValueKey] forKey:kSetupInfoKeyAccuracy];
  
  self.lblSelectedAccuracy.text   =  [optionForRow objectForKey:kAccuracyNameKey];
  self.lblSelectedTimeout.text    =  [[NSString alloc] initWithFormat:@"%d sec.", (int)self.slider.value];
  
	//------------------------------------------------------
}	// End of TemplateMethod Method.


#pragma mark IBAction Event Handlers

//============================================================================
- (IBAction)done:(id)sender
{	// Declare Variables
	//------------------------------------------------------
  
  [self dismissModalViewControllerAnimated:YES];
  
  if ([poDelegate respondsToSelector:@selector(setupViewController:didFinishSetupWithInfo:)])
  {
    [poDelegate setupViewController:self didFinishSetupWithInfo:setupInfo];
  }
  
	//------------------------------------------------------
}	// End of done Method.


//============================================================================
- (IBAction)sliderChangedValue:(id)sender
{	// Declare Variables
	//------------------------------------------------------
  
  if (configureForTracking)
  {
    [setupInfo setObject:[NSNumber numberWithDouble:pow(10, [(UISlider *)sender value])] forKey:kSetupInfoKeyDistanceFilter];
  }
  else
  {
    [setupInfo setObject:[NSNumber numberWithDouble:[(UISlider *)sender value]] forKey:kSetupInfoKeyTimeout];
  }
  
  self.lblSelectedTimeout.text =  [[NSString alloc] initWithFormat:@"%d sec.", (int)[(UISlider *)sender value]];
  
	//------------------------------------------------------
}	// End of sliderChangedValue Method.


#pragma mark Picker DataSource/Delegate

//============================================================================
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{	// Declare Variables
	//------------------------------------------------------
  
  return 1;
  
	//------------------------------------------------------
}	// End of numberOfComponentsInPickerView Method.


//============================================================================
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{	// Declare Variables
	//------------------------------------------------------
  
  return 5;
  
	//------------------------------------------------------
}	// End of numberOfRowsInComponent Method.


//============================================================================
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{	// Declare Variables
	//------------------------------------------------------
  
  NSDictionary *optionForRow = [accuracyOptions objectAtIndex:row];
  return [optionForRow objectForKey:kAccuracyNameKey];
  
	//------------------------------------------------------
}	// End of titleForRow Method.


//============================================================================
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{	// Declare Variables
	//------------------------------------------------------
  
  NSDictionary *optionForRow = [accuracyOptions objectAtIndex:row];
  [setupInfo setObject:[optionForRow objectForKey:kAccuracyValueKey] forKey:kSetupInfoKeyAccuracy];
  
	//------------------------------------------------------
}	// End of didSelectRow Method.


//============================================================================
#pragma mark Table View Method Handlers

//============================================================================
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{	// Return the number of sections
  //------------------------------------------------------
  
  return 1;
  
  //------------------------------------------------------
}	// End of numberOfSectionsInTableView Method.


//============================================================================
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{	// Return the number of rows in the section
  //------------------------------------------------------
  
  return [self.accuracyOptions count];
  
  //------------------------------------------------------
}	// End of numberOfRowsInSection Method.


//================================================================
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{	// Declare Variables
	//------------------------------------------------------
  

  
	//------------------------------------------------------
} // End of tableView:accessoryButtonTappedForRowWithIndexPath Method.


//============================================================================
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{	// Configure the cell
  //----------------------------------------------------
  
  static NSString *CellIdentifier = @"CAccuracyCellIdentifier";
  CAccuracyCellViewController *poCell = (CAccuracyCellViewController *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  
  NSInteger intIndexID = [indexPath row];
  
  if(poCell == nil)
  {	// Customize the height of each row in the table view.
    //--------------------------------------------------
    NSArray *parrNib  = nil;
    parrNib           = [[NSBundle mainBundle] loadNibNamed:@"CAccuracyCellView" owner:self options:nil];
    poCell            = [parrNib objectAtIndex:0];
  }
  
  NSDictionary   *pdictAccuracy  = [self.accuracyOptions objectAtIndex:intIndexID];
  poCell.m_plblDisplayName.text  = [pdictAccuracy objectForKey:kAccuracyNameKey];
  
  if([[pdictAccuracy objectForKey:kAccuracyValueKey] doubleValue] == DBL_SETUP_VIEW_CELL_DEFAULT_LOCATION_ACCURACY)
  { // Setup Default Information
    //--------------------------------------------------
    poCell.selected             = true;
    self.intSelectedAccuracyID  = intIndexID;
    
    [self UpdateConfigureStatusInfo];
  }

  return poCell;
  
  //----------------------------------------------------
}	// End of cellForRowAtIndexPath Method.


//=======================================================
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{	// Declare Error Processing Information
	//---------------------------------------
  
  NSInteger intIndexID = [indexPath row];
  
  NSDictionary *optionForRow = [accuracyOptions objectAtIndex:intIndexID];
  [setupInfo setObject:[optionForRow objectForKey:kAccuracyValueKey] forKey:kSetupInfoKeyAccuracy];
  
  self.lblSelectedAccuracy.text   =  [optionForRow objectForKey:kAccuracyNameKey];
  self.lblSelectedTimeout.text    =  [[NSString alloc] initWithFormat:@"%d sec.", (int)self.slider.value];
  self.intSelectedAccuracyID      =  intIndexID;
  
	//---------------------------------------
} // End of tableView::didSelectRowAtIndexPath Method.


//================================================================
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{	// Customize the height of each row in the table view.
	//------------------------------------------------------
	
	return (CGFloat)INT_SETUP_VIEW_CELL_ROW_HEIGHT;
	
	//------------------------------------------------------
}	// End of tableView:heightForRowAtIndexPath Method.


//============================================================================
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{	// Override to support conditional editing of the table view
  //------------------------------------------------------
  
  // Return NO if you do not want the specified item to be editable.
  return NO;
  
  //------------------------------------------------------
}	// End of canEditRowAtIndexPath Method.


//============================================================================
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{	// Override to support editing the table view
  //------------------------------------------------------
  
  if (editingStyle == UITableViewCellEditingStyleDelete)
  {	// Delete the row from the data source
    //----------------------------------------------------
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
  }
  
  else if (editingStyle == UITableViewCellEditingStyleInsert)
  {	// Create a new instance of the appropriate class, insert
    // it into the array, and add a new row to the table view
    //----------------------------------------------------
    
  }
  
  //------------------------------------------------------
}	// End of commitEditingStyle Method.


//============================================================================
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{	// Start of Method Code
  //------------------------------------------------------
  
  
  
  //------------------------------------------------------
}	// End of moveRowAtIndexPath Method.


//============================================================================
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{	// Override to support conditional rearranging of the table view.
  //------------------------------------------------------
  
  // Return NO if you do not want the item to be re-orderable.
  return NO;
  
  //------------------------------------------------------
}	// End of canMoveRowAtIndexPath Method.


@end










