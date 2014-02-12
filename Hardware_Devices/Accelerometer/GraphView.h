//
//  GraphView.h
//  Hardware_Devices
//
//  Created by Paul Cefalu on 2/10/14.
//  Copyright (c) 2014 Paul Cefalu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface GraphView : UIView

- (void)addX:(UIAccelerationValue)x y:(UIAccelerationValue)y z:(UIAccelerationValue)z;

@end
