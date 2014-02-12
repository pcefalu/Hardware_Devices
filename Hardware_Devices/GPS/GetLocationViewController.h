//
//  GetLocationViewController.h
//  Hardware_Devices
//
//  Created by Paul Cefalu on 2/10/14.
//  Copyright (c) 2014 Paul Cefalu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "SetupViewController.h"

@class LocationDetailViewController;

//============================================================================
@interface GetLocationViewController : UIViewController < SetupViewControllerDelegate, CLLocationManagerDelegate,
UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate, UIActionSheetDelegate >
{
  SetupViewController             *setupViewController;
  UIButton                        *startButton;
  UILabel                         *descriptionLabel;
  CLLocationManager               *locationManager;
  NSMutableArray                  *locationMeasurements;
  CLLocation                      *bestEffortAtLocation;
  UITableView                     *tableView;
  NSDateFormatter                 *dateFormatter;
  NSString                        *stateString;
  LocationDetailViewController    *locationDetailViewController;
}

@property (nonatomic, strong, readonly)  SetupViewController               *setupViewController;
@property (nonatomic, strong, readonly)  NSDateFormatter                   *dateFormatter;
@property (nonatomic, strong, readonly)  LocationDetailViewController      *locationDetailViewController;

@property (nonatomic, strong)            IBOutlet UIButton                 *startButton;
@property (nonatomic, strong)            IBOutlet UILabel                  *descriptionLabel;
@property (nonatomic, strong)            IBOutlet UITableView              *tableView;

@property (nonatomic, strong)            CLLocationManager                 *locationManager;
@property (nonatomic, strong)            NSMutableArray                    *locationMeasurements;
@property (nonatomic, strong)            CLLocation                        *bestEffortAtLocation;
@property (nonatomic, strong)            NSString                          *stateString;


- (IBAction)start:(id)sender;

- (void)setupViewController:(SetupViewController *)controller didFinishSetupWithInfo:(NSDictionary *)setupInfo;

- (void)stopUpdatingLocation:(NSString *)state;

@end
