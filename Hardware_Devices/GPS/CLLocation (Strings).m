//
//  CLLocation (Strings).m
//  Hardware_Devices
//
//  Created by Paul Cefalu on 2/10/14.
//  Copyright (c) 2014 Paul Cefalu. All rights reserved.
//

#import "CLLocation (Strings).h"


//============================================================================
@implementation CLLocation (Strings)


//============================================================================
- (void)TemplateMethod
{	// Declare Variables
	//------------------------------------------------------
  
  
  
	//------------------------------------------------------
}	// End of TemplateMethod Method.


//============================================================================
- (NSString *)localizedCoordinateString
{	// Declare Variables
	//------------------------------------------------------
  
  if (self.horizontalAccuracy < 0)
  {
    return NSLocalizedString(@"DataUnavailable", @"DataUnavailable");
  }
  
  NSString *latString = (self.coordinate.latitude < 0) ?
  NSLocalizedString(@"South", @"South") : NSLocalizedString(@"North", @"North");
  
  NSString *lonString = (self.coordinate.longitude < 0) ?
  NSLocalizedString(@"West", @"West") : NSLocalizedString(@"East", @"East");
  
  return [NSString stringWithFormat:NSLocalizedString(@"LatLongFormat", @"LatLongFormat"),
          fabs(self.coordinate.latitude), latString, fabs(self.coordinate.longitude), lonString];
  
	//------------------------------------------------------
}	// End of localizedCoordinateString Method.


//============================================================================
- (NSString *)localizedAltitudeString
{	// Declare Variables
	//------------------------------------------------------
  
  if (self.verticalAccuracy < 0)
  {
    return NSLocalizedString(@"DataUnavailable", @"DataUnavailable");
  }
  
  NSString *seaLevelString = (self.altitude < 0) ?
  NSLocalizedString(@"BelowSeaLevel", @"BelowSeaLevel") : NSLocalizedString(@"AboveSeaLevel", @"AboveSeaLevel");
  
  return [NSString stringWithFormat:NSLocalizedString(@"AltitudeFormat", @"AltitudeFormat"),
          fabs(self.altitude), seaLevelString];
  
	//------------------------------------------------------
}	// End of localizedAltitudeString Method.


//============================================================================
- (NSString *)localizedHorizontalAccuracyString
{	// Declare Variables
	//------------------------------------------------------
  
  if (self.horizontalAccuracy < 0)
  {
    return NSLocalizedString(@"DataUnavailable", @"DataUnavailable");
  }
  
  return [NSString stringWithFormat:NSLocalizedString(@"AccuracyFormat", @"AccuracyFormat"), self.horizontalAccuracy];
  
	//------------------------------------------------------
}	// End of localizedHorizontalAccuracyString Method.


//============================================================================
- (NSString *)localizedVerticalAccuracyString
{	// Declare Variables
	//------------------------------------------------------
  
  if (self.verticalAccuracy < 0)
  {
    return NSLocalizedString(@"DataUnavailable", @"DataUnavailable");
  }
  
  return [NSString stringWithFormat:NSLocalizedString(@"AccuracyFormat", @"AccuracyFormat"), self.verticalAccuracy];
  
	//------------------------------------------------------
}	// End of localizedVerticalAccuracyString Method.


//============================================================================
- (NSString *)localizedCourseString
{	// Declare Variables
	//------------------------------------------------------
  
  if (self.course < 0)
  {
    return NSLocalizedString(@"DataUnavailable", @"DataUnavailable");
  }
  
  return [NSString stringWithFormat:NSLocalizedString(@"CourseFormat", @"CourseFormat"), self.course];
  
	//------------------------------------------------------
}	// End of localizedCourseString Method.


//============================================================================
- (NSString *)localizedSpeedString
{	// Declare Variables
	//------------------------------------------------------
  
  if (self.speed < 0)
  {
    return NSLocalizedString(@"DataUnavailable", @"DataUnavailable");
  }
  
  return [NSString stringWithFormat:NSLocalizedString(@"SpeedFormat", @"SpeedFormat"), self.speed];
  
	//------------------------------------------------------
}	// End of localizedSpeedString Method.


@end







