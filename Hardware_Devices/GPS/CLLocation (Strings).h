//
//  CLLocation (Strings).h
//  Hardware_Devices
//
//  Created by Paul Cefalu on 2/10/14.
//  Copyright (c) 2014 Paul Cefalu. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>


//============================================================================
@interface CLLocation (Strings)

- (NSString *)localizedCoordinateString;

- (NSString *)localizedAltitudeString;

- (NSString *)localizedHorizontalAccuracyString;

- (NSString *)localizedVerticalAccuracyString;

- (NSString *)localizedCourseString;

- (NSString *)localizedSpeedString;

@end
