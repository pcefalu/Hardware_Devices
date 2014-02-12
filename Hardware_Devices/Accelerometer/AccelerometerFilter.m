//
//  AccelerometerFilter.m
//  Hardware_Devices
//
//  Created by Paul Cefalu on 2/10/14.
//  Copyright (c) 2014 Paul Cefalu. All rights reserved.
//

#import "AccelerometerFilter.h"


#pragma mark -

#define kAccelerometerMinStep				      0.02
#define kAccelerometerNoiseAttenuation		3.0


//============================================================================
double Norm(double x, double y, double z)
{	// Declare Variables
	//------------------------------------------------------
  
	return sqrt(x * x + y * y + z * z);
  
	//------------------------------------------------------
}	// End of Norm Method.


//============================================================================
double Clamp(double v, double min, double max)
{	// Declare Variables
	//------------------------------------------------------
  
	if(v > max)
    return max;
  
	else
  {
    if(v < min) return min;
    else        return v;
  }
  
	//------------------------------------------------------
}	// End of Clamp Method.


#pragma mark -

//============================================================================
@implementation AccelerometerFilter

@synthesize x, y, z, adaptive;

//============================================================================
- (void)TemplateMethod
{	// Declare Variables
	//------------------------------------------------------
  
  
  
	//------------------------------------------------------
}	// End of TemplateMethod Method.


//============================================================================
- (void)addAcceleration:(UIAcceleration *)accel
{	// Declare Variables
	//------------------------------------------------------
  
	x = accel.x;
	y = accel.y;
	z = accel.z;
  
	//------------------------------------------------------
}	// End of addAcceleration Method.


//============================================================================
- (NSString *)name
{	// Declare Variables
	//------------------------------------------------------
  
	return @"You should not see this";
  
	//------------------------------------------------------
}	// End of name Method.

@end  // End of AccelerometerFilter



#pragma mark -

//============================================================================
@implementation LowpassFilter

//============================================================================
- (id)initWithSampleRate:(double)rate cutoffFrequency:(double)freq
{	// Declare Variables
	//------------------------------------------------------
  
	self = [super init];
  
	if(self != nil)
  {	// Process Request
    //----------------------------------------------------
		double dt = 1.0 / rate;
		double RC = 1.0 / freq;
		filterConstant = dt / (dt + RC);
	}
  
	return self;
  
	//------------------------------------------------------
}	// End of initWithSampleRate Method.


//============================================================================
- (void)addAcceleration:(UIAcceleration *)accel
{	// Declare Variables
	//------------------------------------------------------
  
	double alpha = filterConstant;
	
	if(adaptive)
  {	// Process Request
    //----------------------------------------------------
		double d = Clamp(fabs(Norm(x, y, z) - Norm(accel.x, accel.y, accel.z)) / kAccelerometerMinStep - 1.0, 0.0, 1.0);
		alpha = (1.0 - d) * filterConstant / kAccelerometerNoiseAttenuation + d * filterConstant;
	}
	
	x = accel.x * alpha + x * (1.0 - alpha);
	y = accel.y * alpha + y * (1.0 - alpha);
	z = accel.z * alpha + z * (1.0 - alpha);
  
	//------------------------------------------------------
}	// End of addAcceleration Method.


//============================================================================
- (NSString *)name
{	// Declare Variables
	//------------------------------------------------------
  
	return adaptive ? @"Adaptive Lowpass Filter" : @"Lowpass Filter";
  
	//------------------------------------------------------
}	// End of name Method.

@end  // End of LowpassFilter



#pragma mark -

//============================================================================
@implementation HighpassFilter

//============================================================================
- (id)initWithSampleRate:(double)rate cutoffFrequency:(double)freq
{	// Declare Variables
	//------------------------------------------------------
  
	self = [super init];
  
	if (self != nil)
  {	// Process Request
    //----------------------------------------------------
		double dt = 1.0 / rate;
		double RC = 1.0 / freq;
		filterConstant = RC / (dt + RC);
	}
  
	return self;
  
	//------------------------------------------------------
}	// End of initWithSampleRate Method.


//============================================================================
- (void)addAcceleration:(UIAcceleration *)accel
{	// Declare Variables
	//------------------------------------------------------
  
	double alpha = filterConstant;
	
	if (adaptive)
  {	// Process Request
    //----------------------------------------------------
		double d = Clamp(fabs(Norm(x, y, z) - Norm(accel.x, accel.y, accel.z)) / kAccelerometerMinStep - 1.0, 0.0, 1.0);
		alpha = d * filterConstant / kAccelerometerNoiseAttenuation + (1.0 - d) * filterConstant;
	}
	
	x = alpha * (x + accel.x - lastX);
	y = alpha * (y + accel.y - lastY);
	z = alpha * (z + accel.z - lastZ);
	
	lastX = accel.x;
	lastY = accel.y;
	lastZ = accel.z;
  
	//------------------------------------------------------
}	// End of TemplateMethod Method.


//============================================================================
- (NSString *)name
{	// Declare Variables
	//------------------------------------------------------
  
	return adaptive ? @"Adaptive Highpass Filter" : @"Highpass Filter";
  
	//------------------------------------------------------
}	// End of name Method.

@end  // End of HighpassFilter




