//
//  LocationDetailViewController.h
//  Hardware_Devices
//
//  Created by Paul Cefalu on 2/10/14.
//  Copyright (c) 2014 Paul Cefalu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>


//============================================================================
@interface LocationDetailViewController : UITableViewController
< UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate, UIActionSheetDelegate >
{
    CLLocation *location;
    NSDateFormatter *dateFormatter;
}

@property (nonatomic, strong) CLLocation *location;
@property (nonatomic, retain, readonly) NSDateFormatter *dateFormatter;

@end
