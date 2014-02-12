//
//  LocationDetailViewController.m
//  Hardware_Devices
//
//  Created by Paul Cefalu on 2/10/14.
//  Copyright (c) 2014 Paul Cefalu. All rights reserved.
//

#import "LocationDetailViewController.h"
#import "CLLocation (Strings).h"

@implementation LocationDetailViewController

@synthesize location;


//============================================================================
- (void)TemplateMethod
{	// Declare Variables
	//------------------------------------------------------
  
  
  
	//------------------------------------------------------
}	// End of TemplateMethod Method.


#pragma mark Controller Default Method Handlers

//============================================================================
- (void)dealloc
{	// Declare Variables
	//------------------------------------------------------
  
  
  
	//------------------------------------------------------
}	// End of dealloc Method.


//============================================================================
- (void)viewDidLoad
{	// Declare Variables
	//------------------------------------------------------
  
  self.navigationItem.leftBarButtonItem.tintColor  = [UIColor cyanColor];
  
	//------------------------------------------------------
}	// End of viewDidLoad Method.


//============================================================================
- (void)viewDidUnload
{	// Declare Variables
	//------------------------------------------------------
  

  
	//------------------------------------------------------
}	// End of viewDidUnload Method.


//============================================================================
- (NSDateFormatter *)dateFormatter
{	// Declare Variables
	//------------------------------------------------------
  
  if (dateFormatter == nil)
  {
    dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterLongStyle];
  }
  
  return dateFormatter;
  
	//------------------------------------------------------
}	// End of dateFormatter Method.


//============================================================================
- (void)viewWillAppear:(BOOL)animated
{	// Declare Variables
	//------------------------------------------------------
  
  [super viewWillAppear:animated];
  [self.tableView reloadData];
  
	//------------------------------------------------------
}	// End of viewWillAppear Method.


#pragma mark Table view methods

//============================================================================
- (NSInteger)numberOfSectionsInTableView:(UITableView *)table
{	// Declare Variables
	//------------------------------------------------------
  
  return 3;
  
	//------------------------------------------------------
}	// End of numberOfSectionsInTableView Method.


//============================================================================
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{	// Declare Variables
	//------------------------------------------------------
  
  return (section == 0) ? 3: 2;
  
	//------------------------------------------------------
}	// End of numberOfRowsInSection Method.


//============================================================================
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{	// Declare Variables
	//------------------------------------------------------
  
  switch (section)
  {
    case 0:
    {	//
      //--------------------------------------------------
      return NSLocalizedString(@"Attributes", @"Attributes");
      break;
    }
      
    case 1:
    {	//
      //--------------------------------------------------
      return NSLocalizedString(@"Accuracy", @"Accuracy");
      break;
    }
      
    default:
    {	//
      //--------------------------------------------------
      return NSLocalizedString(@"Course and Speed", @"Course and Speed");
      break;
    }
  }
  
	//------------------------------------------------------
}	// End of titleForHeaderInSection Method.


//============================================================================
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{	// Declare Variables
	//------------------------------------------------------
  
  static NSString *kLocationAttributeCellID = @"LocationAttributeCellID";
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kLocationAttributeCellID];
  
  if (cell == nil)
  {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:kLocationAttributeCellID];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
  }
  
  if (indexPath.section == 0)
  {
    switch (indexPath.row)
    {
      case 0:
      {	//
        //-------------------------------------------------
        cell.textLabel.text = NSLocalizedString(@"timestamp", @"timestamp");
        cell.detailTextLabel.text = [self.dateFormatter stringFromDate:location.timestamp];
        break;
      }
        
      case 1:
      {	//
        //-------------------------------------------------
        cell.textLabel.text = NSLocalizedString(@"coordinate", @"coordinate");
        
        if (location.horizontalAccuracy >= 0)
        {
          cell.detailTextLabel.text = location.localizedCoordinateString;
        }
        break;
      }
        
      default:
      {	//
        //-------------------------------------------------
        cell.textLabel.text = NSLocalizedString(@"altitude", @"altitude");
        cell.detailTextLabel.text = location.localizedAltitudeString;
        break;
      }
    }
  }
  else if (indexPath.section == 1)
  {
    switch (indexPath.row)
    {
      case 0:
      {	//
        //-------------------------------------------------
        cell.textLabel.text = NSLocalizedString(@"horizontal", @"horizontal");
        cell.detailTextLabel.text = location.localizedHorizontalAccuracyString;
        break;
      }
        
      default:
      {	//
        //-------------------------------------------------
        cell.textLabel.text = NSLocalizedString(@"vertical", @"vertical");
        cell.detailTextLabel.text = location.localizedVerticalAccuracyString;
        break;
      }
    }
  }
  else
  {
    switch (indexPath.row)
    {
      case 0:
      {	//
        //-------------------------------------------------
        cell.textLabel.text = NSLocalizedString(@"course", @"course");
        cell.detailTextLabel.text = location.localizedCourseString;
        break;
      }
        
      default:
      {	//
        //-------------------------------------------------
        cell.textLabel.text = NSLocalizedString(@"speed", @"speed");
        cell.detailTextLabel.text = location.localizedSpeedString;
        break;
      }
    }
  }
  
  return cell;
  
	//------------------------------------------------------
}	// End of cellForRowAtIndexPath Method.


@end

