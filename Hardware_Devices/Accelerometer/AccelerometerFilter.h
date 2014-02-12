//
//  AccelerometerFilter.h
//  Hardware_Devices
//
//  Created by Paul Cefalu on 2/10/14.
//  Copyright (c) 2014 Paul Cefalu. All rights reserved.
//

#import <UIKit/UIKit.h>


//============================================================================
@interface AccelerometerFilter : NSObject
{	// Basic filter object.
	//------------------------------------------------------
  
	BOOL adaptive;
	UIAccelerationValue x, y, z;
  
  //------------------------------------------------------
} // End of AccelerometerFilter Class.


// Add a UIAcceleration to the filter.
//------------------------------------------------------
- (void)addAcceleration:(UIAcceleration*)accel;

@property (nonatomic, readonly) UIAccelerationValue x;
@property (nonatomic, readonly) UIAccelerationValue y;
@property (nonatomic, readonly) UIAccelerationValue z;

@property (nonatomic, getter=isAdaptive) BOOL adaptive;
@property (unsafe_unretained, nonatomic, readonly) NSString *name;

@end


#pragma mark -

//============================================================================
@interface LowpassFilter : AccelerometerFilter
{	// A filter class to represent a lowpass filter
	//------------------------------------------------------
  
	double filterConstant;
	UIAccelerationValue lastX, lastY, lastZ;
  
  //------------------------------------------------------
} // End of LowpassFilter Class.

- (id)initWithSampleRate:(double)rate cutoffFrequency:(double)freq;

@end


#pragma mark -

//============================================================================
@interface HighpassFilter : AccelerometerFilter
{	// A filter class to represent a highpass filter.
	//------------------------------------------------------
  
	double filterConstant;
	UIAccelerationValue lastX, lastY, lastZ;
  
  //------------------------------------------------------
} // End of HighpassFilter Class.

- (id)initWithSampleRate:(double)rate cutoffFrequency:(double)freq;

@end